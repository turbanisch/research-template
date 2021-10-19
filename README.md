# Research Template

This is a template for a research project that uses [targets](https://github.com/ropensci/targets) as a pipeline toolkit. It comes with a `.gitignore` file optimized for the pipeline script in `_targets.R`.

Before you start working, please make the following (optional) adjustments:

- rename the R project file
- add the folders as described below

## Folder structure

- `data`: raw data
- `functions`: functions to be sourced in `_targets.R`
- `output`: output data files
- `reports`: R Markdown reports and their compiled derivatives

## Data
The folder `data` contains only raw data. Targets automatically stores derived data in `_targets`. If you want to save (and track) derived data explicitly, do so in the `output` folder. For example, co-authors may ask you to provide a dataset in Stata's file format.

Create a folder for each set of raw data to bundle multiple files. Add a short README to each folder explaining 

- data origin (URL, name of co-author)
- when added
- additional information necessary to obtain the data, such as the search query for a database

## Functions
Create a separate R script for each function to avoid clutter, similar to scripts in the `R/` folder of an R package. 