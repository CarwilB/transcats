test_that("Testing translation_available functions", {
  set_active_translation_table(gss_translation)
  set_source_lang("en")
  set_dest_lang("fr")
  expect_equal(get_translation_variables(),
               c("marital", "race", "rincome", "partyid", "relig", "denom"))
  expect_equal(translation_available_for(forcats::gss_cat, "marital"),
               c("Never married", "Divorced", "Widowed", "Married", "Separated",
                 "No answer"))
  expect_equal(num_translation_available(forcats::gss_cat, "marital"),
               length(unique(forcats::gss_cat$marital)))
  expect_equal(num_translation_available(forcats::gss_cat, "race"),
              length(unique(forcats::gss_cat$race)))
  expect_equal(all_translation_available_for(forcats::gss_cat, "rincome"),
               TRUE)
  expect_equal(all_translation_available_for(forcats::gss_cat, "marital"),
               TRUE)
  expect_equal(which_translation_unavailable_for(forcats::gss_cat, "marital"),
               character(0))
  set_dest_lang("cz") # Czech is not available
  expect_equal(all_translation_available_for(forcats::gss_cat, "marital"),
               FALSE)
  expect_equal(which_translation_unavailable_for(forcats::gss_cat, "marital"),
               c("Never married", "Divorced", "Widowed", "Married", "Separated",
                 "No answer"))
  expect_equal(translation_available_for(forcats::gss_cat, "marital"),
               NULL)
})
