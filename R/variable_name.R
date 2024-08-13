# variable_name <- function(variable, lang="en", name_table = var_name_table){
#   variable <- substitute(variable)
#   row_of_names_for_language <- name_table %>% filter(language == lang)
#   if (any(names(row_of_names_for_language)==variable)){
#     pull(row_of_names_for_language[1, variable])
#     # select(row_of_names_for_language, .cols={{variable}}) %>% pull()
#   }else{
#     warning(paste0("No translation found for ", variable, "."))
#     variable
#   }
# }
variable_name_from_string <- function(variable, lang="en", name_table = var_name_table){
  row_of_names_for_language <- name_table %>% filter(language == lang)
  if (any(names(row_of_names_for_language)==variable)){
    pull(row_of_names_for_language[1, variable])
    # select(row_of_names_for_language, .cols={{variable}}) %>% pull()
  }else{
    warning(paste0("No translation found for ", variable, "."))
    variable
  }
}

variable_name <- function(variable, lang="en", name_table = var_name_table){
  variable <- as_label(enquo(variable))
  variable_name_from_string(variable, lang, name_table)
}

lang_chosen <- "es" # using Spanish as the default target language

var_lang <- function(...){
  variable_name(..., lang = lang_chosen, name_table = var_name_table)
}

var_lang_str <- function(...){
  variable_name_from_string(..., lang = lang_chosen, name_table = var_name_table)
}

variable_names_vector <- function(dataframe, lang="en", name_table = var_name_table){
  purrr::map(colnames(dataframe), lang, var_name_table) %>%
    purrr::list_simplify()
}
