
# Get the start date of the (current) month
get_start_month <- function(date = Sys.Date()) {
  date |>
    lubridate::floor_date(unit = "month")
}


# Get the previous months
get_prev_month <- function(date, minus) {
  date |>
    lubridate::`%m-%`(months(minus))
}


# Get the snapshot month date from the ofsted file path
get_snapshot_date <- function(ofsted_path) {
  ofsted_path |>
    stringr::str_extract("\\d{2}_\\w{3}_\\d{4}") |>
    stringr::str_replace_all("_", " ") |>
    lubridate::dmy() |>
    lubridate::`%m+%`(months(1)) |>
    get_start_month()
}


# Format the date for URL
format_date_url <- function(date) {
  date |>
    lubridate::`day<-`(lubridate::days_in_month(date)) |>
    format(format = "%d_%b_%Y")
}
