# Tidy and Normalize the Envision data
#
# Normalization: Treatment - POA/(DMSO - POA)

library(tidyverse)
library(readxl)
library(here)
library(stringr)

# Get the well annotations
annot <- read_tsv(here("results", "perturbations", "well-annotations.tsv"))
mapping <- read_tsv(here("results", "perturbations", "treatment-mapping.tsv"))


normalize_viability <- function(df) {
  pao_mean <- mean(dplyr::pull(dplyr::filter(df, Treatment == "PAO 10uM"), Viability))
  dsmo_mean <- mean(dplyr::pull(dplyr::filter(df, Treatment == "DMSO"), Viability))
  df %>% mutate(
    NormalizedViability = (Viability - pao_mean) / (dsmo_mean - pao_mean)
  )
}



wt <- read_csv(
  file.path(here("data", "EnVision", "2017-12-11", "CTB_MCF10A_WT_allcombos_20171211.csv")),
  skip = 8, n_max = 16, col_names = as.character(seq(24)),
  col_types = str_c(rep('i', 24), collapse = "")
  ) %>%
  mutate(Row = LETTERS[1:16]) %>%
  gather(Column, Viability, -Row) %>%
  unite(Well, Row, Column, sep = "") %>%
  left_join(annot, by = "Well") %>%
  select(Well, Treatment = TreatmentLuminex, Viability) %>%
  filter(!is.na(Treatment)) %>%
  normalize_viability()

write_tsv(wt, file.path(here("results", "perturbations", "wt-envision.tsv")))

mut <- read_csv(
  file.path(here("data", "EnVision", "2017-12-11", "CTB_MCF10A_PI3K_allcombos_20171211.csv")),
  skip = 8, n_max = 16, col_names = as.character(seq(24)),
  col_types = str_c(rep('i', 24), collapse = "")
) %>%
  mutate(Row = LETTERS[1:16]) %>%
  gather(Column, Viability, -Row) %>%
  unite(Well, Row, Column, sep = "") %>%
  left_join(annot, by = "Well") %>%
  select(Well, Treatment = TreatmentLuminex, Viability) %>%
  filter(!is.na(Treatment)) %>%
  normalize_viability()

write_tsv(mut, file.path(here("results", "perturbations", "pi3k-envision.tsv")))
