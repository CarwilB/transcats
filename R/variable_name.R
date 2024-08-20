tcats$var_name_table <- gss_var_table

#' Change the active variable name table
#'
#' Changes the value of tcats$var_name_table, the currently active
#' table for translating variable names.
#'
#' @param vartable A horizontal translation table whose column names
#'                 correspond to variables
#'
#' @returns Former value of the parameter.
#'
#' @examples
#' set_var_name_table(gss_var_table)
set_var_name_table <- function(vartable) {
  old <- tcats$var_name_table
  tcats$var_name_table <- vartable
  invisible(old)
}
#' Language-specific names for variables
#'
#' This function outputs a string naming a variable based on a multilingual
#' translation table. If you want to output the names of multiple variables at
#' once, you can use this function with map() (and you cannot use variable_name()).
#'
#' @param variable Name of the variable, passed as a string, in quotes
#' @param lang Language to be used; use `r_variable` for the variable itself.
#' @param name_table A horizontal translation table whose column names correspond to variables
#'
#' @returns A text string that is the title of the variable, or the name of the variable in r.
#'
#' @examples
#' set_var_name_table(gss_var_table)
#' variable_name_from_string("relig", lang="es")
#' variable_name_from_string("partyid", lang="en")
#' map(colnames(forcats::gss_cat), var_lang_str)
#'
variable_name_from_string <- function(variable,
                                      lang = tcats$title_lang,
                                      name_table = tcats$var_name_table){
  stopifnot(lang %in% name_table$language)

  row_of_names_for_language <- name_table %>% filter(language == lang)
  if (any(names(row_of_names_for_language)==variable)){
    dplyr::pull(row_of_names_for_language[1, variable])
    # select(row_of_names_for_language, .cols={{variable}}) %>% pull()
  }else{
    warning(paste0("No translation found for ", variable, "."))
    variable
  }
}

#' Language-specific names for variables
#'
#' @param variable Name of the variable, without quotes
#' @param lang Language to be used; use `r_variable` for the variable itself.
#' @param name_table A horizontal translation table whose column names correspond to variables
#'
#' @returns A text string that is the title of the variable, or the name of the variable in r.
#'
#' @examples
#' variable_name_from_string(relig, "es", gss_var_table)
#' variable_name_from_string(partyid, "en", gss_var_table)
#'
variable_name <- function(variable,
                          lang = tcats$title_lang,
                          name_table = tcats$var_name_table){
  variable <- rlang::as_label(rlang::enquo(variable))
  variable_name_from_string(variable, lang, name_table)
}

lang_chosen <- "es" # using Spanish as the default target language

#' Language-specific names for variables (shortened call)
#'
#' This functions provides a shortened call to variable_name using
#' preset values for the language and variable name table.
#'
#' @param ... Name of the variable, without quotes
#'
#' @returns A text string that is the title of the variable
#'
#' @examples
#' var_lang(tvhours)
var_lang <- function(...){
  variable_name(..., lang = tcats$title_lang,
                     name_table = tcats$var_name_table)
}

#' Language-specific names for variables (shortened call)
#'
#' This functions provides a shortened call to variable_name using
#' preset values for the language and variable name table.
#'
#' @param ... Name of the variable, passed as a string, in quotes
#'
#' @returns A text string that is the title of the variable
#'
#' @examples
#' var_lang_str("tvhours")
#'
var_lang_str <- function(...){
  variable_name_from_string(..., lang = tcats$title_lang,
                                 name_table = tcats$var_name_table)
}

#' Produce a list of display names for each variables
#'
#' Using the active variable name table, produce a list of display names for each
#' variable, in the language currently specified as tcats$title_lang (set by
#' `set_title_lang()`).
#'
#' @param dataframe Dataframe whose columns are the variables to be listed.
#'
#' @return A vector of strings wit the display names.
#'
#' @examples
#' variable_names_vector(forcats::gss_cat)
variable_names_vector <- function(dataframe){
  purrr::map(colnames(dataframe), var_lang_str) %>%
    purrr::list_simplify()
}
