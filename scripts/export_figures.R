# Export manuscript figures (300 dpi PNG) to ./output/figures from the plot
# objects cached by scripts/stats_v02.qmd
# Run from the project root: Rscript scripts/export_figures.R

library(ggplot2)

proc <- "data/processed"
out <- "output/figures"
dir.create(out, recursive = TRUE, showWarnings = FALSE)

save_fig <- function(plot, file, width = 7, height = 4.5) {
  ggsave(file.path(out, file), plot, width = width, height = height, dpi = 300, bg = "white")
}

# substrate use: predicted probabilities across sampling periods (Fig. 2)
save_fig(readRDS(file.path(proc, "ggsub1.RDS"))$plot, "fig2_substrate_use_by_sampling_period.png")

# substrate use: number-of-legs contrasts (Fig. 3)
save_fig(readRDS(file.path(proc, "number_of_legs_contrast.rds"))$plot, "fig3_substrate_use_by_number_of_legs.png", width = 9)

# behavior: predicted probabilities across sampling periods (Fig. 4)
save_fig(readRDS(file.path(proc, "ggbeh2.RDS"))$plot, "fig4_behavior_by_sampling_period.png")

# behavior: number-of-legs contrasts (Fig. 5)
save_fig(readRDS(file.path(proc, "ggbeh4.RDS"))$plot, "fig5_behavior_by_number_of_legs.png", width = 9)

# substrate use: food substrate contrasts (Supplementary Table 2; not in the manuscript)
save_fig(readRDS(file.path(proc, "food_substrate_contrast.rds"))$plot, "substrate_use_by_food_substrate.png", height = 3.5)
