## code to prepare `DATASET` dataset goes here
translation.tables.filename <- "translation-tables.rds"
uc_translation <- readr::read_rds(paste0("data-raw/", translation.tables.filename))

usethis::use_data(uc_translation, overwrite = TRUE)

vt.filename <- "variable-names.rds"
uc_var_table <- readr::read_rds(paste0("data-raw/", vt.filename))

usethis::use_data(uc_var_table)
