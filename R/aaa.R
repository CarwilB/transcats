tcats <- new.env(parent = emptyenv())
tcats$dest_lang <- "es"
tcats$source_lang <- "en"
tcats$title_lang <- "en"

gss_var_table <- read_csv("data/gss_cat_variables.csv")

tcats$var_name_table <- gss_var_table

#' Report the active destination language for translation
#' @export
dest_lang <- function() {
  tcats$dest_lang
}

#' Report the active source language for translation
#' @export
source_lang <- function() {
  tcats$source_lang
}

#' Report the active language for names of variables
#' @export
title_lang <- function() {
  tcats$title_lang
}

#' Change the active destination language for translation
#' @export
set_dest_lang <- function(langcode = "es") {
  old <- tcats$dest_lang
  tcats$dest_lang <- langcode
  invisible(old)
}

#' Change the active source language for translation
#' @export
set_dest_lang <- function(langcode = "en") {
  old <- tcats$source_lang
  tcats$source_lang <- langcode
  invisible(old)
}

#' Change the active language for names of variables
#' @export
set_title_lang <- function(langcode = "en") {
  old <- tcats$title_lang
  tcats$title_lang <- langcode
  invisible(old)
}
