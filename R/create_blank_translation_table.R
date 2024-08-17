#' Create one blank translation table
#'
#' Creates a blank translation table for a single variable in a data frame.
#'
#' Left column, named by `source_lang` has the original values. If the
#' variable is a factor, these are the levels of the factor. If it's a
#' character variable, these are the unique values of `variable` in
#' `dataframe`.
#'
#' Each language in the `dest_language_list` gets its own column. However,
#' if the `source_lang` is in this list, it is removed. Duplicate values
#' receive a warning.
#'
#' @param dataframe Dataframe whose columns are the variables
#' @param variable Single variable among the columns, passed as string
#' @param source_lang Code for source language; will head left column of output
#' @param dest_language_list Codes, as a list of strings, to be translated to
#'
#' @return Data frame with possible values for the variable in the source
#'   language and blank to fill in translations
#' @export
#'
#' @examples
#' create_blank_translation_tables(forcats::gss_cat, "relig",
#'     "en", c("fr", "cz"))
create_blank_translation_table <-
  function(dataframe, variable,
           source_lang = tcats$source_lang,
           dest_language_list=tcats$dest_lang_list){

  stopifnot(variable %in% colnames(dataframe))

  if (is.character(dest_language_list)){
    dest_language_list <- c(dest_language_list)
  }

  datacolumn <- dplyr::select(dataframe, all_of(variable))

  stopifnot(!is.numeric(datacolumn))
  if (source_lang %in% dest_language_list){
    dest_language_list <- dest_language_list[dest_language_list != source_lang]
    warning("source_lang removed from dest_language_list")
    } # remove source_lang from destination list

  stopifnot(length(dest_language_list) > 0)

  if (is.factor(datacolumn)) {
    translation_table <- as.data.frame(levels(datacolumn))
  } else {
    translation_table <- unique(datacolumn)
  }
  names(translation_table) <- source_lang

  translation_table[,dest_language_list] <- ""
  lang_list <- names(translation_table)
  dupl_langs <- lang_list[anyDuplicated(lang_list)]
  if (length(dupl_langs)>0){
    warning(paste("Duplicated languages in table:", dupl_langs))
  }
  translation_table
}

#' Create a composite translation table
#'
#' Creates a blank translation table for a multiple variables in a data frame.
#'
#' If `combine_tables` is TRUE, all the translation tables are stacked and
#' bound together in a single table. If FALSE, they are returned in the
#' preferred `transcats` form, a list of translation tables.
#'
#' The left column of each table, named by `source_lang` has the original values. If the
#' variable is a factor, these are the levels of the factor. If it's a
#' character variable, these are the unique values of `variable` in
#' `dataframe`.
#'
#' Each language in the `dest_language_list` gets its own column. However,
#' if the `source_lang` is in this list, it is removed. Duplicate values
#' receive a warning.
#'
#' @param dataframe Dataframe whose columns are the variables
#' @param variable_list List of variables
#' @param source_lang Code for source language; will head left column of output
#' @param dest_language_list Codes, as a list of strings, to be translated to
#' @param incl_header If true, put the name of the variable at the top of each
#'   translation table.
#' @param combine_tables If true, combine all the translation tables into a
#'   single data frame. If false, return a single list of translation tobles,
#'   with the variable names as the names of the list elements.
#'
#' @return A single dataframe or a list of dataframes
#' @export
#'
#' @examples
#' create_blank_translation_tables(forcats::gss_cat, c("marital", "race", "relig"),
#'     "en", c("fr", "cz"))
create_blank_translation_tables <-
  function(dataframe,
           variable_list,
           source_lang = tcats$source_lang,
           dest_language_list=tcats$dest_lang_list,
           incl_header = TRUE,
           combine_tables = TRUE){

    if (is.character(variable_list)){
      variable_list <- c(variable_list)
    }

    if (is.character(dest_language_list)){
      dest_language_list <- c(dest_language_list)
    }

    blank_trans_tables <-
      purrr::map(variable_list,
                 ~ create_blank_translation_table(dataframe, .x)) %>%
      purrr::set_names(variable_list)

    if (incl_header){
      header_block <- as.data.frame(variable_list)
      header_block[,dest_language_list] <- "--"
      names(header_block) <- names(purrr::pluck(blank_trans_tables, variable_list[1]))

      blank_trans_tables <-
        purrr::map(1:length(variable_list),
                   ~ add_row(purrr::pluck(blank_trans_tables, variable_list[.x]),
                             header_block[.x,], .before = 1)) %>%
        purrr::set_names(variable_list)
    }

    if (combine_tables) {
      blank_trans_tables_combined <- purrr::list_rbind(blank_trans_tables_h)
      return(blank_trans_tables_combined)
    } else {
      return(blank_trans_tables)
    }
}
