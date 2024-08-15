tcats <- new.env(parent = emptyenv())
tcats$dest_lang <- "es"
tcats$source_lang <- "en"
tcats$title_lang <- "en"

gss_var_table <- readr::read_csv("data/gss_cat_variables.csv")

tcats$var_name_table <- gss_var_table

#' Report the active destination language for translation
dest_lang <- function() {
  tcats$dest_lang
}

#' Report the active source language for translation
source_lang <- function() {
  tcats$source_lang
}

#' Report the active language for names of variables
title_lang <- function() {
  tcats$title_lang
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
