test_that("Translation works", {
  load(test_path("fixtures", "gss-vars.Rdata"))
  expect_equal(dplyr::pull(translated_join_vars(gss_cat, gss_cat_trans_variables, gss_translation, "fr", "en")[5,"relig_fr"]),
               "Aucune religion")
  expect_equal(dplyr::pull(translated_join_vars(gss_cat, gss_cat_trans_variables, gss_translation, "es", "en")[5,"relig_es"]),
               "Ninguno")
  expect_snapshot(translated_join_vars(gss_cat, gss_cat_trans_variables, gss_translation, "fr", "en"))
})

test_that("Output options order columns as expected", {
  load(test_path("fixtures", "gss-vars.Rdata"))
  expect_equal(translated_join_vars(gss_cat, gss_cat_trans_variables, gss_translation, "es", "en"),
               translated_join_vars(gss_cat, gss_cat_trans_variables, gss_translation, "es", "en", .location="right"))
  expect_equal(names(translated_join_vars(gss_cat, gss_cat_trans_variables, gss_translation, "es", "en", .location="right")),
               c("year", "marital", "age", "race", "rincome", "partyid", "relig",
                 "denom", "tvhours", "marital_es", "race_es", "rincome_es", "partyid_es",
                 "relig_es", "denom_es"))
  expect_equal(names(translated_join_vars(gss_cat, gss_cat_trans_variables, gss_translation,"es", "en", .location="beside")),
               c("year", "marital", "marital_es", "age", "race", "race_es",
                 "rincome", "rincome_es", "partyid", "partyid_es", "relig", "relig_es",
                 "denom", "denom_es", "tvhours"))
  expect_equal(names(translated_join_vars(gss_cat, gss_cat_trans_variables, gss_translation, "es", "en", .location="replace")),
               c("year", "marital_es", "age", "race_es", "rincome_es", "partyid_es",
                 "relig_es", "denom_es", "tvhours"))
  expect_equal(names(translated_join_vars(gss_cat, gss_cat_trans_variables, gss_translation, "es", "en", .location="right")),
               c("year", "marital", "age", "race", "rincome", "partyid", "relig",
                 "denom", "tvhours", "marital_es", "race_es", "rincome_es", "partyid_es",
                 "relig_es", "denom_es"))
})

test_that("get_translation_variables returns appropriate list", {
  old <- set_active_translation_table(uc_translation)
  expect_equal(get_translation_variables(), names(uc_translation))
  expect_true("protest_domain" %in% get_translation_variables())

  set_active_translation_table(gss_var_table)
  expect_equal(get_translation_variables(), names(gss_var_table))
  expect_equal(get_translation_variables(),
               c("year", "marital", "age", "race", "rincome", "partyid", "relig",
                 "denom", "tvhours", "language"))
  expect_true("marital" %in% get_translation_variables())
  set_active_translation_table(old)
})
