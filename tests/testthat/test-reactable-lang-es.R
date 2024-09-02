test_that("reactable_lang_es works", {
  expect_no_error(reactable_lang_es())
  expect_snapshot(reactable_lang_es("eventos"))
})

test_that("reactable_lang_es works", {
  expect_no_error(reactable_lang_en())
  expect_snapshot(reactable_lang_en("books"))
  expect_equal(reactable_lang_en("books")$pageSizeOptionsLabel, c("Books per page"))
})
