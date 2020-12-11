# Theme, color, and labeling settings used throughout the project

col_wt    <- RColorBrewer::brewer.pal(9, "Set1")[4] # Purple
col_pi3k  <- RColorBrewer::brewer.pal(9, "Set1")[3] # Green
color_lst <- c("PI3K" = col_pi3k, "WT" = col_wt)

label_wt   <- bquote("Parental")
label_pi3k <- bquote("PI3K"^{H1047R})
label_lst  <- c("PI3K" = label_pi3k, "WT" = label_wt)

epitope_labels <- c(
  "EGFR" = "EGFR Y1068",
  "MEK1" = "MEK1 S217/S221",
  "ERK1" = "ERK1 T202/Y204",
  "GSK3" = "GSK3 S21/S9",
  "CREB1" = "CREB1 S133",
  "BioAkt" = "AKT1 T473",
  "PRAS40" = "PRAS40 T246",
  "P70S6K" = "P70S6K T389",
  "RS6" = "RPS6 S235"
)
