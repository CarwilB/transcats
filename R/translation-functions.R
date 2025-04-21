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




