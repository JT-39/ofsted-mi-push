
# Get dates of next publication release and set reminder
scrape_release_dates <- function(url) {

  page <- xml2::read_html(url)

  # Extract the publication release date elements based on their CSS selector
  raw_release_dates <- page |>
    rvest::html_nodes("tbody") |>
    rvest::html_text()

  # Split the text into lines
  lines <- strsplit(raw_release_dates, "\n")[[1]]

  lines
}



# Collect release dates into dataframe and nice format
format_release_dates <- function(lines) {

  # Convert to dataframe
  release_dates <- data.frame(
    "Release_date" = stringr::str_trim(head(lines[seq(1, length(lines), by = 2)], -1)),
    "Publication" = stringr::str_trim(lines[seq(2, length(lines), by = 2)])
  )

  # Filter for only future releases
  future_releases <- release_dates |>
    dplyr::mutate(Release_date = stringr::str_extract(Release_date, "\\d{1,2} \\w+ \\d{4}")) |>
    datefixR::fix_date_df(c("Release_date")) |>
    subset(Release_date > Sys.Date())

  future_releases
}
