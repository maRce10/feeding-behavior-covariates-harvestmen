# Toward welfare indicators: leg condition and aversive stimuli modulate defensive behavior in Opiliones

[![Website](https://img.shields.io/badge/website-analysis%20report-408AB4)](https://marce10.github.io/feeding-behavior-covariates-harvestmen/)
[![Publish website](https://github.com/maRce10/feeding-behavior-covariates-harvestmen/actions/workflows/publish.yml/badge.svg)](https://github.com/maRce10/feeding-behavior-covariates-harvestmen/actions/workflows/publish.yml)

Code and data to reproduce the analyses, figures and supplementary tables of:

> O'Brien S. L., Araya-Salas M., Skelly N., Herrera Palencia D. M., Escalante I. *Toward welfare indicators: leg condition and aversive stimuli modulate defensive behavior in Opiliones.* (in preparation)

We exposed field-collected *Prionostemma* sp. 1 harvestmen with different leg conditions to a brief aversive stimulus paired with one substrate (rock or sand) and a rewarding stimulus (food) on the other, and modeled their substrate use and defensive responses (flee, escape, bobbing, chemical release and freeze) with Bayesian mixed models (brms). Candidate models were compared with approximate leave-one-out cross-validation (loo), and effects were estimated as posterior contrasts in predicted probabilities (marginaleffects).

## Website

The rendered analysis report, with all code, results and figures, is available at **[marce10.github.io/feeding-behavior-covariates-harvestmen](https://marce10.github.io/feeding-behavior-covariates-harvestmen/)**:

- [Statistical analysis](https://marce10.github.io/feeding-behavior-covariates-harvestmen/scripts/stats_v02.html): data preparation, candidate models, model selection and posterior contrasts (Figs. 2–5)
- [Supplementary tables](https://marce10.github.io/feeding-behavior-covariates-harvestmen/output/supplementary_tables.pdf) (PDF): Supplementary Tables 1–6

## Repository structure

```
_quarto.yml, index.qmd, styles.css, _figure-download.html
                                       Quarto website configuration (cached code results in _freeze/)
.github/workflows/publish.yml          GitHub Actions workflow that builds the website and deploys it to GitHub Pages
scripts/
  stats_v02.qmd                        Data preparation, model fitting, model selection and posterior contrasts
  supplementary_loo_table.qmd          LOO model selection tables (Supplementary Tables 1 and 4)
  supplementary_contrasts_table.qmd    Posterior contrasts and predicted probabilities (Supplementary Tables 2, 3, 5 and 6)
  render_supplementary_tables.R        Renders the supplementary tables into output/supplementary_tables.pdf
  export_figures.R                     Exports the manuscript figures to output/figures/
  qmd.css                              Style sheet for the rendered report
data/
  raw/data_v02.xlsx                    Raw observations: 'Substrate' sheet (substrate use) and 'behavior' sheet (defensive responses)
  processed/loo_list_substrate.rds     PSIS-LOO objects for the 17 substrate-use candidate models
  processed/loo_list_behavior.rds      PSIS-LOO objects for the 12 behavior candidate models
output/
  figures/                             Manuscript figures (fig2 ... fig5) and the food-substrate contrast figure
  supplementary_tables.pdf             Supplementary Tables 1-6
```

## Reproducing the analyses

Open `feeding_behavior_covariates_harvestmen.Rproj` and render `scripts/stats_v02.qmd`. Paths are relative to the project root.

- **Model fits are not in this repository.** Each fitted brms model is 50-95 MB (about 1.5 GB in total), above GitHub's file limits. The model-fitting chunks in `stats_v02.qmd` (`eval: false`) write them to `data/processed/fits_substrate/` and `data/processed/fits_behavior/`. Fitting all models takes several hours (4 chains x 4,000 iterations each).
- Posterior contrasts are cached in `data/processed/` the first time they are computed; delete the cached files to recompute them after refitting.
- Supplementary tables: `Rscript scripts/render_supplementary_tables.R`. Figures: `Rscript scripts/export_figures.R`. Both need the fitted models and cached contrasts.
- The website is built by GitHub Actions on every push to `master`. The workflow does not run R: it uses the results stored in `_freeze/`. After editing a `.qmd` file, render it locally (`quarto render`) and commit the updated `_freeze/` folder.

## Licence

Code is released under the [MIT licence](LICENSE). Data (`data/`) and outputs (`output/`) are released under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/); please cite the archive (see [`CITATION.cff`](CITATION.cff)).
