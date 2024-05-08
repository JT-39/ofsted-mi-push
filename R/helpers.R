# Your functions can go here. Then, when you want to call those functions, run
# `source("R/helpers.R")` at the start of your script.


# Truncate long text (for displaying table data)
truncate_text <- function(x, max_length = 15) {
  ifelse(nchar(x) > max_length,
         paste0(stringr::str_sub(x, end = max_length), "..."),
         x)
}

