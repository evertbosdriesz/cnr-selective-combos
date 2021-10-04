# Identifying selective drug combinations using Comparative Network Reconstruction

Data and code relating to the manuscript **"Identifying selective drug combinations using Comparative Network Reconstruction"**
Evert Bosdriesz, Joao Manuel Fernandes Neto, Anja Sieber, Rene R Bernards, Nils Bluthgen, Lodewyk Wessels
bioRxiv 2020.12.17.423240; doi: https://doi.org/10.1101/2020.12.17.423240

## What's where?

### Data

In the [data](https://github.com/evertbosdriesz/cnr-selective-combos/tree/master/data) directory, you can find the a subfolder with
  * EnVision data: These are the viability measurements. These contains 3 subfolders
      * 2017-09-05; pilot data to establish the IC50's.
      * 2017-12-11; The viabilities for the perturbation experiments
      * 2018-12-03; The viabilities from the validation experiment 
  * Luminex data: These are the (phospho-)protein quantification measurements
The Korkola et al. subfolder contains previously published RPPA data that is only used to determine the quasi-steady state timepoint at which our Luminex data are recorded. 

### Code and results 

  * The notebook [R/01-pilot/envision-pilot.Rmd](https://github.com/evertbosdriesz/cnr-selective-combos/blob/master/R/01-pilot/envision-pilot.Rmd) contains the code to **establish the IC50s and IC90s** that we need for the subsequent perturbation experiments. The determined IC50's and IC90's are stored in the table [results/pilot/drug-sensitivities-pilot.tsv](https://github.com/evertbosdriesz/cnr-selective-combos/blob/master/results/pilot/drug-sensitivities-pilot.tsv)
  * The code to **pre-process the data from the perturbation experiments** can be found in the scipts
      * [/R/02-perturbations/00_wrangle-annotation.R](https://github.com/evertbosdriesz/cnr-selective-combos/blob/master/R/02-perturbations/00_wrangle-annotation.R) to produce the annotation. It produces [/results/perturbations/well-annotations.tsv](https://github.com/evertbosdriesz/cnr-selective-combos/blob/master/results/perturbations/well-annotations.tsv) and [results/perturbations/treatment-mapping.tsv](https://github.com/evertbosdriesz/cnr-selective-combos/blob/master/results/perturbations/treatment-mapping.tsv)
      *  [/R/02-perturbations/00_wrangle-envision.R](https://github.com/evertbosdriesz/cnr-selective-combos/blob/master/R/02-perturbations/00_wrangle-envision.R) is used to **process and normalize the viability data** from the perturabtion experiment. It produces the normalized viabilities in the tables [/results/perturbations/pi3k-envision.tsv](https://github.com/evertbosdriesz/cnr-selective-combos/blob/master/results/perturbations/pi3k-envision.tsv) and [/results/perturbations/wt-envision.tsv](https://github.com/evertbosdriesz/cnr-selective-combos/blob/master/results/perturbations/wt-envision.tsv)
      *  [/R/02-perturbations/00_wrangle-luminex.R](https://github.com/evertbosdriesz/cnr-selective-combos/blob/master/R/02-perturbations/00_wrangle-luminex.R) to produce the normalized (phospho-)protein quantifitaction data and calculate the log2-fold changes compared to DMSO control. These are stored in [/results/perturbations/pi3k-luminex.tsv](https://github.com/evertbosdriesz/cnr-selective-combos/blob/master/results/perturbations/pi3k-luminex.tsv), [/results/perturbations/wt-luminex.tsv](https://github.com/evertbosdriesz/cnr-selective-combos/blob/master/results/perturbations/wt-luminex.tsv), [/results/perturbations/pi3k-luminex-lfc.tsv](https://github.com/evertbosdriesz/cnr-selective-combos/blob/master/results/perturbations/pi3k-luminex-lfc.tsv) and [/results/perturbations/wt-luminex-lfc.tsv](https://github.com/evertbosdriesz/cnr-selective-combos/blob/master/results/perturbations/wt-luminex-lfc.tsv) and 




### Overview of figures

The following notebooks and scripts contain the code to generate the main figures in the text.

  * [R/02-perturbations/luminex-exploration.Rmd](https://github.com/evertbosdriesz/cnr-selective-combos/blob/master/R/02-perturbations/luminex-exploration.Rmd): Figure 2A.
  * [R/02-perturbations/envision-exploration.Rmd](https://github.com/evertbosdriesz/cnr-selective-combos/blob/master/R/02-perturbations/envision-exploration.Rmd): Figure 2C.
  * [python/gen-luminex-heatmaps.py](https://github.com/evertbosdriesz/cnr-selective-combos/blob/master/python/gen-luminex-heatmaps.py): Figure 2B
  * [python/cnr-mcf10a-pi3k.ipynb](https://github.com/evertbosdriesz/cnr-selective-combos/blob/master/python/cnr-mcf10a-pi3k.ipynb): Figure 3 and 5A
  * [R/02-perturbations/mapping-signaling-drugresponse.Rmd](https://github.com/evertbosdriesz/cnr-selective-combos/blob/master/R/02-perturbations/mapping-signaling-drugresponse.Rmd): Figure 4
  * [mathematica/optimize-combinations.nb](https://github.com/evertbosdriesz/cnr-selective-combos/blob/master/mathematica/optimize-combinations.nb) (and [python/plot-heatmap-optimization-selection.py](https://github.com/evertbosdriesz/cnr-selective-combos/blob/master/python/plot-heatmap-optimization-selection.py)): Figure 5 B and C
  * [R/03-validation/validation-analysis.Rmd](https://github.com/evertbosdriesz/cnr-selective-combos/blob/master/R/03-validation/validation-analysis.Rmd): Figure 5D-F
