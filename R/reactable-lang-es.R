#' Provide Spanish-language text for interactive Reactable interface elements
#'
#' @param plural_noun A word in Spanish, formulated as a plural noun
#'     that denotes what the rows of the table refer to, such as
#'     "observaciones" (observations), "eventos" (events), etc.
#'     By default, it is set to "filas" (rows).
#'
#' @return A specialized list of interface text for the Reactable
#'     package to use. Follows the format of [reactable::reactableLang()]
#' @export
#'
#' @examples
#' reactable_lang_es_1 <- reactable_lang_es("eventos")
reactable_lang_es <- function(plural_noun="filas"){
  assertthat::assert_that(rlang::is_installed("reactable"))
  page_text <- paste0("{rowStart} a {rowEnd} de {rows} ", plural_noun)
  reactable::reactableLang(
    searchPlaceholder = "Busqueda",
    noData = "Sin coincidencias",
    pageInfo = page_text,
    pagePrevious = "\u276e",
    pageNext = "\u276f",
    pageSizeOptions = "Mostrar {rows}",
    # Accessible labels for assistive technologies such as screen readers.
    # These are already set by default, but don't forget to update them when
    # changing visible text.
    pagePreviousLabel = "Página anterior",
    pageNextLabel = "Siguiente página",
    pageNumberLabel = "Página {page}",
    pageJumpLabel = "Ir a página",
    pageSizeOptionsLabel = paste0(stringr::str_to_title(plural_noun), "por página"),
    groupExpandLabel = "Ver/ocultar grupo",
    detailsExpandLabel = "Ver/ocultar detalles",
    selectAllRowsLabel = "Seleccionar todas las filas",
    selectAllSubRowsLabel = "Seleccionar todas las filas del grupo",
    selectRowLabel = "Seleccionar fila"
  )
}

#' Provide English-language text for interactive Reactable interface elements
#'
#' @param plural_noun A word in English, formulated as a plural noun
#'     that denotes what the rows of the table refer to, such as
#'     "observations", "events", etc.
#'     By default, it is set to "rows."
#'
#' @return A specialized list of interface text for the Reactable
#'     package to use. Follows the format of [reactable::reactableLang()]
#' @export
#'
#' @examples
#' reactable_lang_en_1 <- reactable_lang_es("events")
reactable_lang_en <- function(plural_noun="rows"){
  assertthat::assert_that(rlang::is_installed("reactable"))
  assertthat::assert_that(assertthat::is.string(plural_noun))

  page_text <- paste0("{rowStart}\u2013{rowEnd} of {rows} ", plural_noun)
  options_text <- paste0(stringr::str_to_title(plural_noun), " per page")

  reactable::reactableLang(
    pageInfo = page_text,
    pageSizeOptionsLabel = options_text
    # all other settings remain at their defaults
  )
}
