# Prepare the Well annoations to analyze teh IncuCyte and Envision data from the
# perturbation experiment.

library(tidyverse)
library(readxl)
library(here)

out_path <- here("results", "perturbations", "well-annotations.tsv")

# Prepare the well annotations
annot <- read_xlsx(
  file.path(here("data", "Luminex", "2017-12-08", "MCF10A for Luminex 2017-12-11 1934.xlsx")),
  sheet = "Tabular detail"
)
colnames(annot) <- str_replace_all(make.names(colnames(annot)), "\\.+", "_")

annot <- annot %>%
  # Only use Plate 3. (4 is exact replicate.)
  filter(Plate == 3 & !(Fluid_name %in% c("Caspase 3/7"))) %>%
  # Make well naming consistent with IncuCyte (i.e. C03 -> C3)
  mutate(
    Well = str_c(
      str_extract(Dispensed_well, "[A-Z]+"),
      as.character(Dispensed_col)
    ),
    Row = str_extract(Dispensed_well, "[A-Z]+"),
    Column = as.character(Dispensed_col)
  ) %>%
  unite(Treatment, Fluid_name, Dispensed_conc_, Conc_units) %>%
  select(Well, Row, Column, Treatment)
# Add # of drugs to annotation
# annot <- left_join(annot, summarise(group_by(annot, Well), N_drugs = n()), by = "Well")


# Combine all annotations for each well in a sigle discription
combine_treatments <- function(well_id, df) {
  df %>%
    filter(Well == well_id) %>%
    pull(Treatment) %>%
    str_c(collapse = " + ") %>%
    str_replace("DMSO normalization_NA_NA", "DMSO") %>%
    str_replace(" \\+ DMSO", "")
  # str_replace("_NA_NA", "")
}
lst <- unlist(purrr::map(annot$Well, function(Well) combine_treatments(Well, annot)))
annot <- distinct(tibble(
  Well = annot$Well,
  Row = annot$Row,
  Column = annot$Column,
  Treatment = lst
)) %>%
  mutate(NDrugs = str_count(Treatment, "\\+") + 1)

annot <- annot %>%
  separate(Treatment, sep = "\\+", into = c("Drug1", "Drug2", "Drug3"), remove = FALSE) %>%
  separate(Drug1, sep = "_", into = c("Drug1", "Conc1")) %>%
  separate(Drug2, sep = "_", into = c("Drug2", "Conc2")) %>%
  separate(Drug3, sep = "_", into = c("Drug3", "Conc3")) %>%
  mutate(TreatmentLuminex = Treatment %>%
           str_replace("IGF1R \\(OSI-906\\)", "IGF1Ri") %>%
           str_replace("FGFRi \\(AZD4547\\)", "FGFRi") %>%
           str_replace("EGFRi \\(Gefitinib\\)", "EGFRi") %>%
           str_replace("RAFi \\(LY3009120\\)", "RAFi") %>%
           str_replace("MEKi \\(Trametinib\\)", "MEKi") %>%
           str_replace("ERKi \\(SCH772984\\)", "ERKi") %>%
           str_replace("GSK3i \\(3F8\\)", "GSK3i") %>%
           str_replace("PI3Ki \\(BKM120\\)", "PI3Ki") %>%
           str_replace("AKTi \\(MK2206\\)", "AKTi") %>%
           str_replace("mTORi \\(AZD8055\\)", "mTORi") %>%
           str_replace("4\\.9", "5") %>%
           str_replace_all("_µM", "uM") %>%
           str_replace_all("_", " ") %>%
           str_replace("AKTi 1uM \\+ IGF1Ri 3uM", "IGF1Ri 3uM + AKTi 1uM") %>%
           str_replace("mTORi 0.01uM \\+ IGF1Ri 3uM", "IGF1Ri 3uM + mTORi 0.01 uM")
  )



message("Annotations written to ", out_path)
write_tsv(annot, out_path)
write_tsv(
  unique(select(annot, Treatment, TreatmentLuminex)),
  here("results", "perturbations", "treatment-mapping.tsv")
)
