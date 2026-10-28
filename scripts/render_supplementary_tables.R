# Render the supplementary tables into a single PDF: ./output/supplementary_tables.pdf
# Run from the project root: Rscript scripts/render_supplementary_tables.R

tables <- list(
  list(qmd = "supplementary_loo_table.qmd", analysis = "substrate", no = 1),
  list(qmd = "supplementary_contrasts_table.qmd", analysis = "substrate", part = "contrasts", no = 2),
  list(qmd = "supplementary_contrasts_table.qmd", analysis = "substrate", part = "periods", no = 3),
  list(qmd = "supplementary_loo_table.qmd", analysis = "behavior", no = 4),
  list(qmd = "supplementary_contrasts_table.qmd", analysis = "behavior", part = "periods", no = 5),
  list(qmd = "supplementary_contrasts_table.qmd", analysis = "behavior", part = "contrasts", no = 6)
)

for (t in tables) {
  out <- paste0("supplementary_table_", t$no, ".pdf")
  quarto::quarto_render(
    input = file.path("scripts", t$qmd),
    output_file = out,
    execute_params = c(list(analysis = t$analysis, table_no = t$no), if (!is.null(t$part)) list(part = t$part))
  )
}

# combine all tables into a single PDF (one table per page) and remove the
# per-table files
table_pdfs <- file.path("scripts", paste0("supplementary_table_", seq_along(tables), ".pdf"))
system2("pdfunite", c(table_pdfs, file.path("output", "supplementary_tables.pdf")))
file.remove(table_pdfs)
