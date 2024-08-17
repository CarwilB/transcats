## code to prepare `DATASET` dataset goes here
gss_var_table <- readr::read_csv("data-raw/gss_cat_variables.csv")

usethis::use_data(gss_var_table, overwrite = TRUE)
