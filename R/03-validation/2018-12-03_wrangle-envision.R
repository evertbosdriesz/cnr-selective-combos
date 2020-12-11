# Tidy and Normalize the Envision data
#
# Normalization: Treatment - POA/(DMSO - POA)

library(tidyverse)
library(here)

## Read and wrangle the EnVision data ------------------------------------------

# The validation experiment was performed twice (on 2018-11-25 and 2018-12-03)
# This script cleans the 2018-12-03 experiment

# The experiment consistented of 8 plates
# Reads of the plates start at rows 9, 33, 65, 92, 119, 146, 173 and 200.
# However, this is an excel file, and not all rows are recognized by the read_csv
# parser
data_file <- here("data", "EnVision", "2018-12-03", "Joao_20181203.csv")

start_rows <- list("R1" = 11, "R2" = 38, "R3" = 65, "R4" = 92, "R5" = 119,
                   "R6" = 146, "R7" = 173, "R8" = 200)

read_plate <- function(start_row, f) {
  read_csv(f,
           skip = start_row - 1, n_max = 16,
           col_names = c("row", sprintf("%02d", 1:24)),
           col_types = str_c(c('c', rep('d', 24)), collapse = "")
  ) %>%
    gather(column, viability, -row) %>%
    unite(well, row, column, sep = "", remove = FALSE)
}



df <- purrr::map(start_rows, read_plate, data_file) %>%
  bind_rows(.id = "replicate")

rm(data_file, start_rows, read_plate)


## Combine with the drug printing annotations-----------------------------------

# Annotation of which combos are control (non-selective) and selective
annot_combos <- read_tsv(here("data", "EnVision", "2018-12-03",
                              "annot-combos-20181203.txt"))

# Which drugs are printed in which wells?
annot <- readxl::read_xlsx(
  here("data", "EnVision", "2018-12-03",
       "Validation Experiment MCF10A_Updated 2018-11-30 1059.xlsx"),
  sheet = "Tabular"
)
colnames(annot) <- make.names(colnames(annot))

annot <- annot %>%
  filter(Plate == 1) %>% # 8 plates were printed. Each is a copy, keep one.
  select(well = Dispensed..well,
         EGFRi = "Conc...µM...EGFRi..Gefitinib.",
         RAFi  = "Conc...µM...RAFi..LY3009120.",
         MEKi  = "Conc...µM...MEKi..Trametinib.",
         ERKi  = "Conc...µM...ERKi..SCH772984.",
         PI3Ki = "Conc...µM...PI3Ki..BKM120.",
         AKTi  = "Conc...µM...AKTi..MK2206.",
         mTORi = "Conc...µM...mTORi..AZD8055.",
         GSK3i = "Conc...µM...GSK3i..3F8.",
         IGF1Ri = "Conc...µM...IGF1R..OSI.906.",
         PAO   = "Conc...µM...PAO",
         well_used = "Total.dispensed.volume..nL."
  ) %>%
  filter(!is.na(well_used)) %>%
  select(-well_used)

# Match the combinations by inhibitor names. Make sure names have matching
# inhibitor ordering.
sort_combo <- function(x){
  x %>%
    str_split("\\+") %>%
    purrr::map(sort) %>%
    purrr::map(function(x) paste0(x, collapse = "+")) %>%
    unlist()
}
# Extract the applied drugs for each well
tmp <- annot %>%
  gather(inhibitor, concentration, -well) %>%
  mutate(drug = if_else(!is.na(concentration), inhibitor, "")) %>%
  select(well, drug) %>%
  filter(drug != "") %>%
  distinct() %>%
  group_by(well) %>%
  summarise(combo = paste0(drug, collapse = "+")) %>%
  mutate(combo = sort_combo(combo))

annot <- annot %>%
  left_join(tmp, by = "well") %>%
  mutate(combo = replace_na(combo, "DMSO")) %>%
  left_join(mutate(annot_combos, combo = sort_combo(combo)), by = "combo")

## Combine and add cell line annotation --------------------------------------

# The following combos are used both as Selective and NonSelective:
#   * GSK3i+IGF1Ri+MEKi
#   * GSK3i+PI3Ki+mTORi
#   * IGF1Ri+MEKi+RAFi
#   * IGF1Ri+MEKi+mTORi
# We need to fix this manually to avoid duplicates in the eventual data frame.
# Luckily, the Selective combo's are in the upper rows (F) and the NonSelective
# are in the lower ones (K and L).


df <- df %>%
  right_join(annot, by = "well") %>%
  mutate(cell_line = case_when(
    column <= "12" ~ "WT",
    column >= "12" ~ "PI3K"
  )) %>%
  # Fix the duplicate entries
  filter(!((row == "E") & (type == "NonSelective"))) %>%
  filter(!((row %in% c("J", "K")) & (type == "Selective")))

# ## Normalize the viability data ------------------------------------------------

# We normalize per plate and cell line.

pao_mean <- df %>%
  filter(combo == "PAO") %>%
  group_by(replicate, cell_line) %>%
  summarise(pao_mean = mean(viability))

dmso_mean <- df %>%
  filter(combo == "DMSO") %>%
  group_by(replicate, cell_line) %>%
  summarise(dmso_mean = mean(viability))

df <- df %>%
  left_join(pao_mean, by = c("replicate", "cell_line")) %>%
  left_join(dmso_mean, by = c("replicate", "cell_line")) %>%
  mutate(normalized_viability = (viability - pao_mean) / (dmso_mean - pao_mean)) %>%
  select(replicate, well, row, column, cell_line, type, combo, viability, normalized_viability, everything())

write_tsv(df, here("results", "validation", "20181203-envision.tsv"))


