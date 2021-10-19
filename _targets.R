library(targets)
library(tarchetypes) # render reports with tar_render()

# import functions
sapply(dir("functions", full.names = TRUE), source)

# specify packages to load
options(tidyverse.quiet = TRUE)
tar_option_set(packages = c("tidyverse"))

list(
  # watch a single file on disk
  tar_target(raw_data_path, "data/raw_data.csv", format = "file"),
  
  # watch multiple files on disk
  tar_target(multiple_raw_data_paths, 
             find_raw_data_paths("raw*\\.csv"),
             format = "file"),
  
  # clean the raw data
  tar_target(cleaned_data,
             read_and_clean_raw_data(raw_data_path)), 
  
  # export cleaned data (https://books.ropensci.org/targets/files.html#external-output-files)
  tar_target(plot_file,
             plot_and_return_path(cleaned_data),
             format = "file"),
  
  # render Markdown reports (https://books.ropensci.org/targets/files.html#literate-programming)
  tar_render(my_report.Rmd, "reports/my_report.Rmd")
)