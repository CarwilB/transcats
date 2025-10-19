## code to prepare `DATASET` dataset goes here
#
# Load UC translation table from data-raw
#
# This file can be copied from the ultimateconsequences GitHub repository
# using:
# cp ../ultimate-consequences/data/translation-tables.rds data-raw/translation-tables.rds
translation.tables.filename <- "translation-tables.rds"
uc_translation <- readr::read_rds(paste0("data-raw/", translation.tables.filename))

usethis::use_data(uc_translation, overwrite = TRUE)

vt.filename <- "variable-names.rds"
uc_var_table <- readr::read_rds(paste0("data-raw/", vt.filename))
uc_var_table <- uc_var_table %>% dplyr::relocate(language) # put language guide on the left

usethis::use_data(uc_var_table, overwrite = TRUE)

n_trans_table <- dplyr::tribble(
  ~date, ~age, ~n, ~n_state_perp, ~n_state_victim, ~n_state_separate, ~language, ~deaths, ~event,
  #--|--|----
  "Date", "Age", "Confirmed", "State Perp", "State Victim", "Sep from State", "en", "Deaths", "Event",
  "Fecha", "Edad", "Confirmado", "Perp x Estado", "Víctima Estatal", "Ajeno del Estado", "es", "Muertes", "Evento",
  "date", "age", "n", "n_state_perp", "n_state_victim", "n_state_separate", "r_variable", "deaths", "event"
)
usethis::use_data(n_trans_table, overwrite = TRUE)

grouping_trans_table <- dplyr::tribble(
  ~n_, ~domain, ~unknown_domain, ~language,
  #--|--|----
  "Deaths", "Domain", "Unknown", "en",
  "Muertes", "Dominio", "Dominio desconocido", "es",
  "n_", "domain", "unknown_domain", "r_variable"
)

# Add the new translation tables to the existing variable name table
uc_var_table_ext <- transcats::append_to_var_name_table(uc_var_table, n_trans_table)
uc_var_table_ext <- transcats::append_to_var_name_table(uc_var_table_ext, grouping_trans_table)
uc_var_table_ext <- uc_var_table_ext %>% dplyr::relocate(language) # put language guide on the left
usethis::use_data(uc_var_table_ext, overwrite = TRUE)

translation.tables.filename <- "translation-tables.rds"
uc_translation_tables_2025_aug <- readr::read_rds(here::here("data-raw", translation.tables.filename))
usethis::use_data(uc_translation_tables_2025_aug)

