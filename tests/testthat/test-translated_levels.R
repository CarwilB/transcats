test_that("translated_levels works", {
  expect_snapshot(
    translated_levels(sr_levels, "state_responsibility",
                                    uc_translation,
                                    dest_lang="es", source_lang="en")
  )
})

test_that("add_translated_levels works", {
  p_domain <- list(
    levels = c("Coca", "Contraband", "Education")
  )

  expect_equal(
    add_translated_levels(p_domain, variable = "protest_domain", uc_translation),
    list(levels = c("Coca", "Contraband", "Education"),
         levels_es = c("Coca",  "Contrabando", "Educación")))
})
