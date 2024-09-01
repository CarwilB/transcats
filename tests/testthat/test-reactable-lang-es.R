test_that("reactable_lang_es works", {
  expect_no_error(reactable_lang_es())
  expect_snapshot(reactable_lang_es("eventos"))
})
