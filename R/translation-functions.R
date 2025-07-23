#' Change the active translation table
#'
#' Changes the value of tcats$translation_table.
#'
#' @param transtable A list of translation tables, named
#'        by the variables involved.
#'
#' @returns Former value of the parameter.
#'
#' @export
set_active_translation_table <- function(transtable) {
  old <- tcats$translation_table
  tcats$translation_table <- transtable
  invisible(old)
}

#' Get list of variables in the active translation table
#'
#' Returns a list of variables in the active translation table.
#'
#' @returns A character vector with the names of the variables in the
#' active translation table.
#'
#' @export
#'
#' @examples
#' set_active_translation_table(uc_translation)
#' get_translation_variables()
get_translation_variables <- function() {
  names(tcats$translation_table)
}

#' Translated Join
#'
#' Adds one column (`translated_join`) or several columns (`translated_join_vars`)
#' to the right side of a data table, filled with translations of one or several
#' categorical variables.
#'
#' Translated variables take the name of the original variable, plus an underscore,
#' and the code of the destination language.
#'
#'
#' @param dataframe Data table being changed
#' @param variable Name of the variable to be translated, as a string.
#' @param variables A list of variables in c("firstvar", "secondvar") format.
#' @param translation_table Consolidated translation table to be used
#'   (translation_table$variable should be a translation table for
#'   the variable involved).
#' @param dest_lang Language to be translated to, typically as a short code.
#' @param source_lang Language to be translated from, typically as a short code.
#' @param .location If location is "right", the translated columns are added on
#'     the right of dataframe. If "beside" they are added next to the the
#'     translated variable. If "replace", they supplant the translated variable.
#' @param ... is used to pass translation_table, dest_lang, source_lang
#'  on from translated_join_vars to translated_join
#'
#' @returns A modified version of the data table with extra columns
#'
#' @export
translated_join <- function(dataframe, variable,
                            translation_table = tcats$translation_table,
                            dest_lang = tcats$dest_lang,
                            source_lang = tcats$source_lang,
                            .location="right"){
  assertthat::assert_that(variable %in% names(translation_table))

  renamed_variable <- stringr::str_c(variable, dest_lang, sep="_")
  var_trans_table <- purrr::pluck(translation_table, variable)
  var_trans_table <- var_trans_table [ , names(var_trans_table) %in% c(source_lang, dest_lang)]

  dataframe <- dplyr::left_join(dataframe, var_trans_table,
            by = setNames(source_lang, variable)) %>%
    dplyr::rename_with(~ paste0(variable, "_", .x, recycle0 = TRUE),
                       .cols =any_of(c(dest_lang)))
  if (.location %in% c("beside", "replace")){
    dataframe <- dplyr::relocate(dataframe, tidyselect::matches(paste0(variable, "_")),
                                 .after = {{variable}})
    if (.location == "replace"){
      dataframe <- dataframe[ ,!names(dataframe) %in% c(variable)]
    }
  }
  return(dataframe)
}

#' @rdname translated_join
#'
#' @export
#'
translated_join_vars <- function(dataframe, variables=c(""), ...){
  for (i in 1:length(variables)){
    dataframe <- translated_join(dataframe, variables[i], ...)
    }
  return(dataframe)
}

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
#' `all_translation_available` checks if all values in the vector
#' have translations available in the translation table.
#'
#' `which_translation_unavailable` returns a vector with the values
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
all_translation_available <- function(dataframe, variable_name,
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
which_translation_unavailable <- function(dataframe, variable_name,
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

