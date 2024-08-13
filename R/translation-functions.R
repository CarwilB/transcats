source(here::here("src", "02-load-translation-tables.R"))

# translation: A compound list of all the translation tables,
#              labeled by the corresponding variable
# Here's its structure…
# translation <- list(protest_domain = domain_trans_table,
#                     pres_admin = pres_trans_table,
#                     dec_affiliation = affil_trans_table,
#                     perp_affiliation = affil_trans_table, # This duplicate makes referencing easier
#                     cause_death = cause_trans_table,
#                     state_responsibility = sresp_trans_table, 
#                     intentionality = intent_trans_table,
#                     event_title = event_trans_table
# )

# Also creates this…
# variable_name <- function(variable, lang="en", name_table = var_name_table){
#   variable <- substitute(variable)
#   row_of_names_for_language <- name_table %>% filter(language == lang)
#   if (any(names(row_of_names_for_language)==variable)){
#     pull(row_of_names_for_language[1, variable])
#   }else{
#     substitute(variable)
#   }
# }

lang_chosen <- "es" # using Spanish as the default target language

var_lang <- function(...){
  variable_name(..., lang = lang_chosen, name_table = var_name_table)
}


translated_join <- function(dataframe, translation_table, variable, 
                            dest_lang="es", origin_lang="en"){
  # variable <- enquo(variable)
  renamed_variable <- str_c(variable, dest_lang, sep="_")
  left_join(dataframe, pluck(translation_table, variable),
            by = setNames(origin_lang, variable)) %>%
    rename_with(~ paste0(variable, "_", .x, recycle0 = TRUE), .cols =any_of(c(dest_lang)))
}

translated_join_vars <- function(dataframe, translation_table, variables=c(""), ...){
  for (i in 1:length(variables)){
    dataframe <- translated_join(dataframe, translation_table, variables[i])
  }
  return(dataframe)
}

translated_levels <- function(levels_vector, translation_table, variable,
                              dest_lang="es", origin_lang="en") {
  
  levels_tibble <- as_tibble(levels_vector)
  colnames(levels_tibble) <- c(variable)
  levels_tibble <- levels_tibble %>%
    translated_join(translation, variable, dest_lang, origin_lang)
  levels_vector_final <- pluck(levels_tibble, paste0(variable, "_", dest_lang))
  return(levels_vector_final)
}


