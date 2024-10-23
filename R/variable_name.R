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
#' purrr::map(colnames(forcats::gss_cat), var_lang_str)
#'
#'
#' @export
variable_name_from_string <- function(variable,
                                      lang = tcats$title_lang,
                                      name_table = tcats$var_name_table){
  stopifnot(lang %in% name_table$language)

  row_of_names_for_language <- name_table[which(name_table$language == lang), ]
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
#' variable_name(relig, "es", gss_var_table)
#' variable_name(partyid, "en", gss_var_table)
#'
#' @export
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
#'
#' @export
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
#'
#' @export
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
#' set_title_lang("es")
#' set_var_name_table(gss_var_table)
#' variable_names_vector(forcats::gss_cat)
#'
#' @export
variable_names_vector <- function(dataframe){
  purrr::map(colnames(dataframe), var_lang_str) %>%
    purrr::list_simplify()
}


#' Check if a language is available in a variable name table
#'
#' This function returns a simple logical result, TRUE or FALSE, as to
#' whether a given language appears in the active variable name table, or in
#' a language table passed as the second parameter.
#'
#' @param lang A language code.
#' @param name_table A variable name table. Defaults to the active var_name_table.
#'
#' @return Logical true or false
#' @export
#'
#' @examples
#' var_name_language_available("fr") # examines active variable table
#' var_name_language_available("es", uc_var_table)
var_name_language_available <- function(lang = tcats$title_lang,
                                        name_table = tcats$var_name_table) {
  assertthat::assert_that(assertthat::is.string(lang))
  return (lang %in% name_table$language)
}


