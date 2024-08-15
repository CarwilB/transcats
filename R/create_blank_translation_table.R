create_blank_translation_table <-
  function(dataframe, variable,
           source_lang = tcats$source_lang,
           dest_language_list=c(tcats$dest_lang)){

  stopifnot(variable %in% colnames(dataframe))

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


