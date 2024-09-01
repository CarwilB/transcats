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
    pageNextLabel = "Siguiente página"
  )
}
