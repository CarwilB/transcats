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
#'
#' @returns A modified version of the data table with extra columns
#'
#' @examples
#' sr_levels_es <- sr_levels %>% translated_levels("state_responsibility")
translated_join <- function(dataframe, variable,
                            translation_table = tcats$translation_table,
                            dest_lang = tcats$dest_lang,
                            source_lang = tcats$source_lang){
  renamed_variable <- str_c(variable, dest_lang, sep="_")
  left_join(dataframe, pluck(translation_table, variable),
            by = setNames(source_lang, variable)) %>%
    rename_with(~ paste0(variable, "_", .x, recycle0 = TRUE), .cols =any_of(c(dest_lang)))
}

translated_join_vars <- function(dataframe, variables=c(""), ...){
  for (i in 1:length(variables)){
    dataframe <- translated_join(dataframe, variables[i], ...)
  }
  return(dataframe)
}




