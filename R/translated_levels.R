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
#' sr_levels_es <- sr_levels %>% translated_levels("state_responsibility")
translated_levels <- function(levels_vector, variable, translation_table,
                              dest_lang="es", source_lang="en") {

  levels_tibble <- tibble::as_tibble(levels_vector)
  colnames(levels_tibble) <- c(variable)
  levels_tibble <- levels_tibble %>%
    translated_join(translation_table, variable, dest_lang, source_lang)
  levels_vector_final <- purrr::pluck(levels_tibble, paste0(variable, "_", dest_lang))
  return(levels_vector_final)
}
