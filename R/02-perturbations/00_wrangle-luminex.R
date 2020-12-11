# Normalize the luminex data by subtracting blanks and correcting for total
# protein amount

library(tidyverse)
library(here)


# Get the data =================================================================
df <- readxl::read_xlsx(
  here("data", "Luminex", "2017-12-08", "171201-perturbation-samples.xlsx"),
  sheet = "data", skip = 2
)
annotations <- readxl::read_xlsx(
  here("data", "Luminex", "2017-12-08", "annotations.xlsx")
  )


# Protein concentration measurements
prot_conc <- readxl::read_xlsx(
  here("data", "Luminex", "2017-12-08", "171201-perturbation-samples.xlsx"),
  sheet = "BCA PTPN11", range = "A22:K118"
)

# Prepare the data =============================================================

# WT cells (fourth block of epitope names, these get suffix between 14 and 23)
wt <- select(df, row, column, treatShort, ends_with(str_c("...",seq(34, 43))))
colnames(wt) <- str_replace(colnames(wt), "\\..*", "")  # Remove suffix from name

wt <- wt %>%
  left_join(
    filter(annotations, `Cell line` == "MCF10A_WT"),
    by = c("column", "row")
  ) %>%
  mutate(Sample_number = as.factor(Sample_number)) %>%
  select(
    c(
      "Sample_number", "Treatment", "treatShort.x", "Akt1", "BioAkt", "CREB1",
      "EGFR", "ERK1", "GSK3", "MEK1", "P70S6K", "PRAS40", "RS6"
    )
  ) %>%
  mutate(Treatment = if_else(is.na(Treatment), treatShort.x, Treatment)) %>%
  filter(Treatment != "water") %>%
  select(-treatShort.x)


# PI3K mutant (first block of epitope names, these get suffix between ...4 and ...13)
# Take care not to also select 1x. suffices
mut <- select(df, row, column, treatShort, ends_with(str_c("...", as.character(seq(24, 33)))))
colnames(mut) <- str_replace(colnames(mut), "\\..*", "")

mut <- mut %>%
  left_join(
    filter(annotations, `Cell line` == "MCFA10A_PI3Kmut"),
    by = c("column", "row")
  ) %>%
  mutate(Sample_number = as.factor(Sample_number)) %>%
  select(
    c(
      "Sample_number", "Treatment", "treatShort.x", "Akt1", "BioAkt", "CREB1",
      "EGFR", "ERK1", "GSK3", "MEK1", "P70S6K", "PRAS40", "RS6"
    )
  ) %>%
  mutate(Treatment = if_else(is.na(Treatment), treatShort.x, Treatment)) %>%
  filter(Treatment != "water") %>%
  select(-treatShort.x)

prot_conc <- prot_conc %>%
  select("Treatment" = `...2`, "Protein_concentration" = `...6`, Sample_number) %>%
  mutate(
    Cell_line = if_else(Sample_number <= 48, "WT", "Mut"),
    Sample_number = as.factor(Sample_number)
  ) %>%
  filter(Treatment != "Lysis buffer") %>%
  group_by(Cell_line) %>%
  mutate(mean_conc = mean(Protein_concentration)) %>%
  ungroup() %>%
  mutate(correction_factor = Protein_concentration / mean_conc)



# Subtract the blanks ==========================================================

# Parental
# Calculate blank for each epitope
wt_blank <- filter(wt, Treatment == "blank") %>%
  gather(epitope, blank, -Treatment, -Sample_number) %>%
  group_by(epitope) %>%
  summarise(blank = mean(blank))

# Substract blank from data
wt_sb <- wt %>%
  filter(Treatment != "blank") %>%
  gather(epitope, Fl, -Sample_number, -Treatment) %>%
  left_join(wt_blank, by = "epitope") %>%
  mutate(Fl = Fl - blank) %>%
  select(-blank) %>%
  spread(epitope, Fl)
rm(wt, wt_blank)

# PI3K mutant
# Calculate blank for each epitope
mut_blank <- filter(mut, Treatment == "blank") %>%
  gather(epitope, blank, -Treatment, -Sample_number) %>%
  group_by(epitope) %>%
  summarise(blank = mean(blank))

# Substract blank from data
mut_sb <- mut %>%
  filter(Treatment != "blank") %>%
  gather(epitope, Fl, -Sample_number, -Treatment) %>%
  left_join(mut_blank, by = "epitope") %>%
  mutate(Fl = Fl - blank) %>%
  select(-blank) %>%
  spread(epitope, Fl)
rm(mut, mut_blank)

# Correct for total protein ====================================================
# Parental
wt_norm <- wt_sb %>%
  left_join(prot_conc) %>%
  mutate(
    correction_factor = if_else(is.na(correction_factor), 1, correction_factor),
    Sample_number = as.integer(Sample_number)
  ) %>%
  mutate_if(is.double, list(~. / correction_factor)) %>%
  select(-correction_factor, -Cell_line, -Protein_concentration, -mean_conc)

# PI3K mutant
mut_norm <- mut_sb %>%
  left_join(prot_conc) %>%
  mutate(
    correction_factor = if_else(is.na(correction_factor), 1, correction_factor),
    Sample_number = as.integer(Sample_number)
  ) %>%
  mutate_if(is.double, list(~. / correction_factor)) %>%
  select(-correction_factor, -Cell_line, -Protein_concentration, -mean_conc)

# Write to file
write_tsv(wt_norm, here("results", "perturbations", "wt-luminex.tsv"))
message("Parental data written to: ", here("results", "perturbations", "wt-luminex.tsv"))
write_tsv(mut_norm, here("results", "perturbations", "pi3k-luminex.tsv"))
message("PI3K mutant data written to: ", here("results", "perturbations", "pi3k-luminex.tsv"))

# Calculate Log-fold change data ===============================================
# Perturbations
cols_ordered <- c(
  # MAPK
  "FGFRi 0.1uM", "IGF1Ri 3uM", "IGF1Ri 10uM",
  "EGFRi 0.3uM", "EGFRi 1uM",
  "RAFi 1uM",
  "MEKi 0.002uM", "MEKi 0.02uM",
  "ERKi 0.02uM", "ERKi 0.4uM",
  "GSK3i 2uM", "GSK3i 5uM",
  # AKT
  "PI3Ki 1uM", "PI3Ki 2uM",
  "AKTi 1uM", "AKTi 5uM",
  "mTORi 0.01uM", "mTORi 0.3uM",

  # Combo
  # MAPK-MAPK
  "EGFRi 0.3uM + IGF1Ri 3uM",
  "EGFRi 0.3uM + MEKi 0.002uM",
  "EGFRi 0.3uM + ERKi 0.02uM",
  "MEKi 0.002uM + ERKi 0.02uM",
  # AKT-AKT
  "IGF1Ri 3uM + AKTi 1uM",
  "IGF1Ri 3uM + mTORi 0.01 uM",
  "PI3Ki 1uM + mTORi 0.01uM",
  "AKTi 1uM + mTORi 0.01uM",
  # MAPK-AKT
  "EGFRi 0.3uM + PI3Ki 1uM",
  "EGFRi 0.3uM + AKTi 1uM",
  "EGFRi 0.3uM + mTORi 0.01uM",
  "MEKi 0.002uM + PI3Ki 1uM",
  "ERKi 0.02uM + PI3Ki 1uM",
  "ERKi 0.02uM + AKTi 1uM"
)

rows_ordered <- c(
  "EGFR", "MEK1", "ERK1", "GSK3", "CREB1", # MAPK
  "Akt1", "BioAkt", "PRAS40", "P70S6K", "RS6"
)

# MCF10A parental
wt_mat <- group_by(wt_norm, Treatment) %>%
  summarise_if(is.double, mean) %>%
  column_to_rownames("Treatment") %>%
  as.matrix() %>%
  t()


wt_lfc <- log2(wt_mat / wt_mat[, "DMSO"])[rows_ordered, cols_ordered]
wt_lfc <- rownames_to_column(as.data.frame(wt_lfc), "Epitope")
write_tsv(wt_lfc, here("results", "perturbations", "wt-luminex-lfc.tsv"))
message("Parental lFC data written to", here("results", "perturbations", "wt-luminex-lfc.tsv"))

mut_mat <- group_by(mut_norm, Treatment) %>%
  summarise_if(is.double, mean) %>%
  column_to_rownames("Treatment") %>%
  as.matrix() %>%
  t()


mut_lfc <- log2(mut_mat / mut_mat[, "DMSO"])[rows_ordered, cols_ordered]
mut_lfc <- rownames_to_column(as.data.frame(mut_lfc), "Epitope")
write_tsv(mut_lfc, here("results", "perturbations", "pi3k-luminex-lfc.tsv"))
message("PI3K lFC data written to", here("results", "perturbations", "pi3k-luminex-lfc.tsv"))
