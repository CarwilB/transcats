#' Reformat a combined translation table into a standard one
#'
#' Part of the import sequence for a combined translation table,
#' which can be produced by `create_blank_translation_table` and
#' edited externally (for example, as a CSV file). This function
#' takes a single data frame and splits it into as many smaller
#' translation tables as are indicated by the number. of headers.
#'
#' It returns the translation table list used as the main
#' translation table format by `transcats`.
#'
#' @param combined_table A combined translation table with as
#'  many columns as languages involved. This table must be
#'  sectioned off for each variable. Each header line takes the form
#'  "variable_name", "--", "--", with as many "--"s as needed
#'  to cover all but the first column.
#'
#' @return A translation table list, `translation_list`,
#'   each member of which is a translation table for a
#'   given categorical variable.
#' @export
#'
#' @examples
#' gss_translation_combined <- readr::read_csv("inst/extdata/gss_cat_transtable_complete.csv")
#' gss_translation <- parse_combined_tronslation_table(gss_translation_combined)
parse_combined_tronslation_table <- function(combined_table){

  header_row_numbers <- which(combined_table[,2]=="--")
  table_names <- combined_table[header_row_numbers,1] %>% pull(1)
  n_tables <- length(header_row_numbers)
  header_row_numbers <- c(header_row_numbers, nrow(combined_table)+1)

  translation_list <-
    purrr::map(1:n_tables,
               ~ slice(combined_table, (header_row_numbers[.x]+1):(header_row_numbers[.x+1]-1))) %>%
    purrr::set_names(table_names[1:n_tables])

  translation_list
}
