#' Translated levels
#'
#' Translate the levels vector for a categorical factor.
#'
#' @param levels_vector One-dimensional vector of levels of a factor
#' @param variable The variable involved, passed as a string.
#' @param translation_table Consolidated translation table to be used
#'   (translation_table$variable should be a translation table for
#'   the variable involved).
#' @param dest_lang Language to be translated to, typically as a short code.
#' @param source_lang Language to be translated from, typically as a short code.
#'
#' @returns A one-dimensional levels vector for the factor.
#'
#' @examples
#' sr_levels_es <- translated_levels(sr_levels, "state_responsibility",
#'                                 uc_translation,
#'                                 dest_lang="es", source_lang="en")
#'
#' @export
translated_levels <- function(levels_vector, variable,
                              translation_table,
                              dest_lang="es", source_lang="en") {

  levels_tibble <- tibble::as_tibble(levels_vector)
  colnames(levels_tibble) <- c(variable)
  levels_tibble <- levels_tibble %>%
    translated_join(variable, translation_table, dest_lang, source_lang)
  levels_vector_final <- purrr::pluck(levels_tibble, paste0(variable, "_", dest_lang))
  return(levels_vector_final)
}

#' Add translated levels to a list object
#'
#' Translate the `levels` vector for a categorical factor and add it to a list object.
#'
#' @param list_obj A list object containing the levels to be translated.
#' @param ... Additional arguments passed to the `translated_levels` function.
#'
#' @export
#'
#' @return A modified version of a variable description list object
#'   with the translated levels added.
#'
#' @examples
#' p_domain <- list(
#'  levels = c("Coca", "Contraband", "Education")
#' )
#' add_translated_levels(p_domain, variable = "protest_domain", uc_translation)
add_translated_levels <- function(list_obj, ...) {
  list_obj$levels_es <- transcats::translated_levels(list_obj$levels, ...)
  return(list_obj)
}
