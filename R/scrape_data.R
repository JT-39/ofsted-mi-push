
# Parse the HTML content of the webpage
parse_html <- function(url) {

  # Make an HTTP request to the URL
  resource <- httr::GET(url)

  XML::htmlParse(resource)
}


# Extract the links from the parsed HTML
extract_links <- function(parse, url_month) {
  tibble::tibble(WebLink = XML::xpathSApply(parse,
                                            path = "//a",
                                            XML::xmlGetAttr,
                                            "href")) |>
    dplyr::filter(
      grepl('https://assets.publishing.service.gov.uk/', WebLink),
      grepl('.csv', WebLink),
      grepl(url_month, WebLink),
      grepl(
        'Management_information_-_state-funded_schools_-_latest_inspections_',
        WebLink
      )
    )
}


# Main function to get the Ofsted data file path and the month is relates to
get_data_path_and_month <- function(month, url) {
  ofsted_path <- NA
  minus <- 0

  while (is.na(ofsted_path)) {
    minus = minus + 1

    prev_month <- get_prev_month(month, minus)
    url_month <- format_date_url(prev_month)

    parse <- parse_html(url)
    links <- extract_links(parse, url_month)

    # Generate the path to the Ofsted CSV file
    ofsted_path <- links$WebLink[1]
  }

  ofsted_path
}


# Load data from the data file path
load_ofsted_raw <- function(ofsted_data_path) {
  utils::read.csv(file = url(paste0(ofsted_data_path)))
}
