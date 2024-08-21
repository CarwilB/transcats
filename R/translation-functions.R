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
#' @param ... is used to pass translation_table, dest_lang, source_lang
#'  on from translated_join_vars to translated_join
#'
#' @returns A modified version of the data table with extra columns
#'
#' @export
translated_join <- function(dataframe, variable,
                            translation_table = tcats$translation_table,
                            dest_lang = tcats$dest_lang,
                            source_lang = tcats$source_lang){
  renamed_variable <- stringr::str_c(variable, dest_lang, sep="_")
  var_trans_table <- purrr::pluck(translation_table, variable) %>%
    dplyr::select(tidyselect::matches(source_lang), tidyselect::matches(dest_lang))
  dplyr::left_join(dataframe, var_trans_table,
            by = setNames(source_lang, variable)) %>%
    dplyr::rename_with(~ paste0(variable, "_", .x, recycle0 = TRUE),
                       .cols =any_of(c(dest_lang)))
}

#' @rdname translated_join
#'
#' @export
translated_join_vars <- function(dataframe, variables=c(""), ...){
  for (i in 1:length(variables)){
    dataframe <- translated_join(dataframe, variables[i], ...)
  }
  return(dataframe)
}




