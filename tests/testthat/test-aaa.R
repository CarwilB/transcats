test_that("Configuration variables exist", {
  expect_type(source_lang(), "character")
  expect_type(dest_lang(), "character")
  expect_type(title_lang(), "character")
  expect_type(dest_lang_list(), "character")
})

test_that("Configuration functions are quiet", {
  expect_invisible(set_source_lang())
  expect_invisible(set_dest_lang())
  expect_invisible(set_title_lang())
  expect_invisible(set_dest_lang_list())
})
