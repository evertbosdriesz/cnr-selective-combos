# Script to add IC10 and IC50, estimated in the pilot study, to the table
# containing the applied drug concentrations in the perturbation experiment.

library(tidyverse)
library(here)

icx <- read_tsv(here("results/pilot/drug-sensitivities-pilot.tsv")) %>%
    separate(Drug, into = c('Inhibitor', 'dummy'), sep = ' ')
used <- read_tsv(here('results/perturbations/drug-concentrations.tsv')) %>%
    # Add RAFi manually because it is only tested at 1 concentration
    add_row(Inhibitor = 'RAFi', IC50 = 0.15, IC90 = 1., NormalizedIC50 = 0.15)

icx %>%
    group_by(Inhibitor) %>%
    summarise_if(is.numeric, mean) %>%
    mutate(Inhibitor = str_replace(Inhibitor, "IGF1R", "IGF1Ri")) %>%
    right_join(rename(used, applied_high = IC90, applied_low = IC50)) %>%
    select(Inhibitor, IC10, applied_low, IC50, applied_high, IC90) %>%
    mutate(IC10_relative = IC10/applied_high,
           IC50_relative = IC50/applied_high,
           applied_low_relative = applied_low/applied_high
           ) %>%
    write_tsv(here('results/perturbations/drug-concentrations-annotated.tsv'))
