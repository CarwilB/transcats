globalVariables(c("language"))
#' Append new entries to variable_name_table
#'
#' @param table A variable translation table with one column named `language`
#' @param extension A matching variable translation table with one
#'     column named `language` that has the same languages, not necessarily
#'     in the same order. (The extension may have additional languages, which
#'     will be dropped.)
#' @param overwrite A flag indicating whether entries that overlap between
#'     the two tables should be overwritten by the value in extension.
#'     Default value is FALSE, indicating no change should be made.
#'
#' @return A longer variable translation table
#' @export
#'
#' @examples
#' n_trans_table <- tibble::tribble(
#'  ~language, ~date, ~age, ~n, ~n_state_perp, ~n_state_victim, ~n_state_separate, ~deaths,
#'  "en", "Date", "Age", "Confirmed", "State Perp", "State Victim", "Sep from State", "Deaths",
#'  "es", "Fecha", "Edad", "Confirmado", "Perp x Estado", "Víctima Estatal",
#'    "Ajeno del Estado", "Muertes",
#'  "r_variable", "date", "age", "n", "n_state_perp", "n_state_victim",
#'    "n_state_separate", "deaths")
#' append_to_var_name_table(uc_var_table, n_trans_table)
#' append_to_var_name_table(uc_var_table, gss_var_table)[c(1,6,71)]
append_to_var_name_table <- function(table, extension, overwrite=FALSE){
  assertthat::assert_that("language" %in% names(table))
  assertthat::assert_that("language" %in% names(extension))

  duplicate_vars <- intersect(names(table), names(extension))
  duplicate_vars <- duplicate_vars[duplicate_vars != "language"]

  # cat(paste0("Duplicates: ",duplicate_vars, "\n"))
  if (overwrite){
    table <- table %>% select(-all_of(duplicate_vars))
  } else{
    extension <- extension %>% select(-all_of(duplicate_vars))
  }

  if (identical(table$language, extension$language)){
    new_table <- dplyr::bind_cols(table, select(extension, -language))
  }else if(identical(sort(table$language),sort(extension$language))) {
    extension <- extension %>% dplyr::arrange(match(language, table$language))
    new_table <- dplyr::bind_cols(table, select(extension, -language))
  }else if (all(table$language %in% extension$language)){
    extension <- extension %>% dplyr::filter(language %in% table$language)
    new_table <- dplyr::bind_cols(table, select(extension, -language))
  }else{
    warning("Translation table extension does not match the format of the overall translation table and cannot be added.")
    return(table)
  }
  return(new_table)
}
