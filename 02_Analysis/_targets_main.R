library(targets)
# library(crew)


# Define custom functions and other global objects.
targets::tar_source(c(here::here("R/helpers.R"),
                      here::here("R/date_helpers.R"),
                      here::here("R/scrape_data.R"),
                      here::here("R/clean_data.R"),
                      here::here("R/sql.R"),
                      here::here("R/scrape_release_dates.R")))

# # Set target-specific options such as packages:
# tar_option_set(
#   controller = crew_controller_local(workers = 2)
# )


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
                          snapshot_date = snapshot_date)),

  # SQL yaml key
  tar_target(sql_creds,
             "cred_dit"),

  # Connect to SQL
  tar_target(dit_conn,
             connect_sql_db(yml_key = sql_creds)),

  # Pull existing date snapshots from SQL table
  tar_target(existing_snapshots,
             pull_snapshots(yml_key = sql_creds)),

  # Push cleaned Ofsted data to SQL safely.
  # Checks whether the data snapshot exists already in the SQL table.
  # Only pushes if it does not.
  tar_target(ofsted_mi_append,
             safely_append_ofsted(latest_month = snapshot_date,
                                  existing_months = existing_snapshots,
                                  data = ofsted_clean,
                                  yml_key = sql_creds)),

  # Get release dates
  tar_target(raw_release_dates,
             scrape_release_dates(url = ofsted_url)),

  # Format release dates
  tar_target(future_release_dates,
             format_release_dates(lines = raw_release_dates))
)
