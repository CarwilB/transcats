require(forcats)
forcats::gss_cat

gss_translation_combined <-
  readr::read_csv(fs::path_package("extdata", "gss_cat_transtable_complete.csv",
                                   package = "transcats"))
gss_translation <-parse_combined_translation_table(gss_translation_combined)
gss_cat_num_variables <- gss_cat %>% dplyr::select(where(~ is.numeric(.x))) %>%
  names()
gss_cat_trans_variables <- gss_cat %>% dplyr::select(where(~ is.factor(.x) || is.character(.x))) %>%
  names()

save(gss_cat, gss_translation, gss_cat_num_variables, gss_cat_trans_variables,
     file= test_path("fixtures", "gss-vars.Rdata"))
