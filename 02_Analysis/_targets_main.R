library(targets)
# This is an example _targets.R file. Every
# {targets} pipeline needs one.
# Use tar_script() to create _targets.R and tar_edit()
# to open it again for editing.
# Then, run tar_make() to run the pipeline
# and tar_read(data_summary) to view the results.

# Define custom functions and other global objects.
# This is where you write source(\"R/functions.R\")
# if you keep your functions in external scripts.
targets::tar_source(c(here::here("R/helpers.R"),
                      here::here("R/date_helpers.R"),
                      here::here("R/scrape_data.R"),
                      here::here("R/clean_data.R"),
                      here::here("R/sql.R"),
                      here::here("R/scrape_release_dates.R")))

# Set target-specific options such as packages:
# tar_option_set(packages = "utils")

# End this file with a list of target objects.
list(
  # Start of the current month
  tar_target(start_month,
             get_start_month(date = Sys.Date())),

  # URL to Ofsted MI website
  tar_target(ofsted_url,
             paste0("https://www.gov.uk/government/statistical-data-sets/",
                    "monthly-management-information-ofsteds-school-inspections",
                    "-outcomes")),

  # Get the path to the latest Ofsted MI .csv file on the Ofsted website
  tar_target(ofsted_path,
             get_data_path_and_month(month = start_month,
                                     url = ofsted_url)),

  # Extract snapshot date
  tar_target(snapshot_date,
             get_snapshot_date(ofsted_path = ofsted_path)),

  # Download the CSV file from the web
  tar_target(ofsted_raw,
             load_ofsted_raw(ofsted_data_path = ofsted_path)),

  # Data cleaning to prepare append to SQL table
  tar_target(ofsted_clean,
             clean_ofsted(data_raw = ofsted_raw,
                          snapshot_date = snapshot_date))
)
