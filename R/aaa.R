tcats <- new.env(parent = emptyenv())
tcats$source_lang <- "en"
tcats$title_lang <- "en"
tcats$dest_lang <- "es"
tcats$dest_lang_list <- c(tcats$dest_lang) # default list has just one element

# tcats$var_name_table <- gss_var_table

#' Report the active source language for translation
source_lang <- function() {
  tcats$source_lang
}

#' Report the active language for names of variables
title_lang <- function() {
  tcats$title_lang
}

#' Report the active destination language for translation
dest_lang <- function() {
  tcats$dest_lang
}

dest_lang_list <- function() {
  tcats$dest_lang_list
}

tcats$var_name_table <- data.frame(year = c("year of survey", "a\U00F1o de la encuesta",
                                            "ann\U00E9e de l'enqu\U00EAte", "year"),
                                   language = c("en", "es", "fr", "r_variable"))

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

#' Change the active source language for translation
#'
#' Changes the value of tcats$source_lang.
#'
#' @param langcode Code for the language you are choosing, typically
#'                 a two- or three-letter string.
#'
#' @returns Former value of the parameter.
set_source_lang <- function(langcode = "en") {
  old <- tcats$source_lang
  tcats$source_lang <- langcode
  invisible(old)
}

#' Change the active language for names of variables
#'
#' Changes the value of tcats$title_lang.
#'
#' @param langcode Code for the language you are choosing, typically
#'                 a two- or three-letter string.
#'
#' @returns Former value of the parameter.
set_title_lang <- function(langcode = "en") {
  old <- tcats$title_lang
  tcats$title_lang <- langcode
  invisible(old)
}

#' Change the active destination language for translation
#'
#' Changes the value of tcats$dest_lang.
#'
#' @param langcode Code for the language you are choosing, typically
#'                 a two- or three-letter string.
#'
#' @returns Former value of the parameter.
set_dest_lang <- function(langcode = "es") {
  old <- tcats$dest_lang
  tcats$dest_lang <- langcode
  invisible(old)
}

#' Change the active destination language list for multiple translations
#'
#' Changes the value of tcats$dest_lang_list.
#'
#' @param langlist Code for the list of languages you are choosing,
#'                 typically each a two- or three-letter string.
#'
#' @returns Former value of the parameter.
set_dest_lang_list <- function(langlist = c(tcats$dest_lang)) {
  old <- tcats$dest_lang_list
  tcats$dest_lang_list <- langlist
  invisible(old)
}

