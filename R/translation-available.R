#' Check whether translations are available for all values in a vector/column
#'
#' @description
#' `translation_available_for` checks if the values in a vector or
#'  column to see which have translations available in the
#'  translation table.
#'
#' `num_translation_available` returns the number of values
#'  that have translations available, from zero to
#'  length(unique(vector)).
#'
#' `all_translation_available_for` checks if all values in the vector
#' have translations available in the translation table.
#'
#' `which_translation_unavailable_for` returns a vector with the values
#'  that do not have translations available in the translation table.
#'
#' @param dataframe A vector or dataframe to be checked. If a dataframe,
#'   it should contain the variable specified in `variable`.
#' @param variable_name The name of the variable to be checked, as a string.
#' @param translation_table A translation table, by default
#'   this is the active translation table.
#' @param dest_lang The destination language code, by default
#'  this is the current source language, set by set_dest_lang().
#' @param source_lang The source language code, by default
#'  this is the current source language, set by set_source_lang().
#' @param verbose If TRUE, prints messages about the process.
#'
#' @returns A list of values with available translation
#'
#' @export
translation_available_for <- function(dataframe, variable_name,
                                      translation_table = tcats$translation_table,
                                      dest_lang = tcats$dest_lang,
                                      source_lang = tcats$source_lang,
                                      verbose = FALSE){
  if (!is.character(variable_name) || length(variable_name) != 1) {
    stop("The variable name must be a single string.")
  }
  if (is.data.frame(dataframe)) {
    vector <- dataframe[[variable_name]]
  } else {
    vector <- dataframe
  }
  if (!(variable_name %in% names(translation_table))) {
    if (verbose) message("Variable not found in translation table.")
    return(NULL)
  }
  var_trans_table <- purrr::pluck(translation_table, variable_name)
  if (!(source_lang %in% names(var_trans_table))){
    if (verbose) message("Source language not found in translation table.")
    return(NULL)
  }
  if (!(dest_lang %in% names(var_trans_table))){
    if (verbose) message("Destination language not found in translation table.")
    return(NULL)
  }
  # Check if all values in the vector have a translation
  if (is.null(vector) || length(vector) == 0) {
    warning("No values to check for translation.")
    return(NULL)
  }
  unique_values <- unique(vector)
  intersect(unique_values, purrr::pluck(var_trans_table, source_lang))
}

#' @rdname translation_available_for
num_translation_available <- function(dataframe, variable_name,
                                      translation_table = tcats$translation_table,
                                      dest_lang = tcats$dest_lang,
                                      source_lang = tcats$source_lang,
                                      verbose = FALSE){
  translation_available_for(dataframe, variable_name,
                            translation_table = translation_table,
                            dest_lang = dest_lang,
                            source_lang = source_lang,
                            verbose = verbose) %>%
    length()
}

#' @rdname translation_available_for
all_translation_available_for <- function(dataframe, variable_name,
                                      translation_table = tcats$translation_table,
                                      dest_lang = tcats$dest_lang,
                                      source_lang = tcats$source_lang,
                                      verbose = FALSE) {
  available_values <- translation_available_for(dataframe, variable_name,
                                                translation_table = translation_table,
                                                dest_lang = dest_lang,
                                                source_lang = source_lang,
                                                verbose = verbose)
  unique_values <- unique(dataframe[[variable_name]])
  all(unique_values %in% translation_available_for(dataframe, variable_name,
                                                   translation_table = translation_table,
                                                   dest_lang = dest_lang,
                                                   source_lang = source_lang))
}

#' @rdname translation_available_for
which_translation_unavailable_for <- function(dataframe, variable_name,
                                          translation_table = tcats$translation_table,
                                          dest_lang = tcats$dest_lang,
                                          source_lang = tcats$source_lang,
                                          verbose = FALSE) {
  unique_values <- unique(dataframe[[variable_name]])
  available_values <- translation_available_for(dataframe, variable_name,
                                                translation_table = translation_table,
                                                dest_lang = dest_lang,
                                                source_lang = source_lang,
                                                verbose = verbose)
  unavailable_values <- setdiff(unique_values, available_values)
  return(unavailable_values)
}

#' Show values with available translations
#'
#' @description
#' `which_translation_available` returns the values for which
#'  there is an available translation in the translation table.
#'
#'  Note that unlike functions like `translation_available_for`,
#'  `which_translation_available` does not check the values
#'  within a dataframe or vector, but looks directly at the
#'  translation table and returns all possible values that
#'  can be translated.
#'
#' @param variable_name The name of the variable to be checked,
#'  as a string.
#' @param translation_table A translation table, by default
#'   this is the active translation table.
#' @param dest_lang The destination language code, by default
#'  this is the current source language, set by set_dest_lang().
#' @param source_lang The source language code, by default
#'  this is the current source language, set by set_source_lang().
#' @param verbose If TRUE, prints messages about the process.
#'
#' @returns A character vector with the values that have translations
#'  available.
#'
#' @export
which_translation_available <-  function(variable_name,
                                         translation_table = tcats$translation_table,
                                         dest_lang = tcats$dest_lang,
                                         source_lang = tcats$source_lang,
                                         verbose = FALSE) {
  if (!is.character(variable_name) || length(variable_name) != 1) {
    stop("The variable name must be a single string.")
  }
  if (!(variable_name %in% names(translation_table))) {
    if (verbose) message("Variable not found in translation table.")
    return(NULL)
  }

  var_trans_table <- purrr::pluck(translation_table, variable_name)
  var_trans_table <- var_trans_table [ , names(var_trans_table) %in%
                                         c(source_lang, dest_lang)]

  if (!(source_lang %in% names(var_trans_table))){
    if (verbose) message("Source language not found in translation table.")
    return(NULL)
  }
  if (!(dest_lang %in% names(var_trans_table))){
    if (verbose) message("Destination language not found in translation table.")
    return(NULL)
  }
  # Get the values that have translations available
  filtered_var_trans_table <- var_trans_table[
    var_trans_table[[1]] != "" & !is.na(var_trans_table[[1]]) &
    var_trans_table[[2]] != "" & !is.na(var_trans_table[[2]]), ]
  filtered_var_trans_table[[1]] %>%
    unique() %>%
    sort()
}
