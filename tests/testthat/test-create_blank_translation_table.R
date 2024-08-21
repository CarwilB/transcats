test_that("Translation table includes all levels", {
  gss_race <- create_blank_translation_table(forcats::gss_cat, "race")
  expect_equal(nrow(gss_race), 4)
  expect_equal(gss_race[1,1], "Other")
  expect_equal(gss_race[,1], levels(forcats::gss_cat$race))
})

test_that("create_blank_translation_tables handles errors", {
  expect_error(create_blank_translation_table(forcats::gss_cat, "nonexistent.variable"))
  expect_warning(create_blank_translation_table(forcats::gss_cat, "race",
                                                "es", c("en","es","fr")))
})

test_that("Translation table is consistent", {
  forcats::gss_cat %>% dplyr::select(where(~ is.factor(.x) || is.character(.x))) %>%
    names() -> gss_cat_trans_variables
  gss_btt <- create_blank_translation_tables(forcats::gss_cat, gss_cat_trans_variables,
                                             incl_header=FALSE , combine_tables=FALSE)
  expect_snapshot(gss_btt)
  expect_equal(length(gss_btt), length(gss_cat_trans_variables))
  rm(gss_cat_trans_variables)
})

test_that("Combined translation table is consistent", {
  forcats::gss_cat %>% dplyr::select(where(~ is.factor(.x) || is.character(.x))) %>%
    names() -> gss_cat_trans_variables
  gss_btt_combined <- create_blank_translation_tables(forcats::gss_cat, gss_cat_trans_variables,
                                             source_lang = "en",
                                             dest_language_list = c("es"),
                                             incl_header=TRUE, combine_tables=TRUE)
  # expect_snapshot(gss_btt_combined)
  # how to test two different snapshots!
  expect_equal(nrow(dplyr::filter(gss_btt_combined, es=="--")), length(gss_cat_trans_variables))
  rm(gss_cat_trans_variables)
})

test_that("Header row generated", {
  forcats::gss_cat %>% dplyr::select(where(~ is.factor(.x) || is.character(.x))) %>%
    names() -> gss_cat_trans_variables
  gss_btt <- create_blank_translation_tables(forcats::gss_cat, gss_cat_trans_variables,
                                             incl_header=TRUE , combine_tables=FALSE)
  gss_btt_race <- as.data.frame(gss_btt["race"])
  expect_equal(nrow(gss_btt_race), length(levels(forcats::gss_cat$race))+1)
  expect_equal(gss_btt_race[1,1], "race")
  expect_equal(gss_btt_race[1,2], "--")
  rm(gss_btt_race)
  rm(gss_btt)
})


test_that("String column gets appropriate translation table", {
   numerical_sequence <- c(1, 1:3, 1:9, 1:12)
   months_dataframe <- data.frame( numerical_sequence, month.name[numerical_sequence])
   names(months_dataframe) <- c("number", "month")
   months_btt <- create_blank_translation_table(months_dataframe, "month", "en", c("es", "fr"))
   expect_equal(nrow(months_btt), 12)
})

test_that("Duplicated translation warned",{
  expect_warning(create_blank_translation_table(forcats::gss_cat, "race",
                                 source_lang = "en", dest_language_list = c("en","es")))
  expect_warning(create_blank_translation_table(forcats::gss_cat, "race",
                                                source_lang = "en", dest_language_list = c("es", "fr", "cz", "es")))
})

test_that("Works with custom language list",{
  skip_if_not_installed("vcd")
  expect_no_condition(create_blank_translation_tables(vcd::DanishWelfare, c("Status", "Urban"),
                                  source_lang = "en",
                                  dest_language_list = c("en-complete", "dk")))
  dwtt <- create_blank_translation_tables(vcd::DanishWelfare, c("Status", "Urban"),
                                  source_lang = "en",
                                  dest_language_list = c("en-complete", "dk"))
  expect_equal(dwtt[1, 2], "--")
  expect_equal(names(dwtt), c("en", "en-complete", "dk"))
})
