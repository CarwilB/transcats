gss_translation_combined <-
       readr::read_csv("inst/extdata/gss_cat_transtable_complete.csv")
gss_translation <-
  transcats::parse_combined_translation_table(gss_translation_combined)

usethis::use_data(gss_translation, overwrite = TRUE)
