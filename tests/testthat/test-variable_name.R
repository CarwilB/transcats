old_vartable <- set_var_name_table(gss_var_table)

test_that("Configuration functions are quiet", {
  expect_invisible(set_var_name_table(gss_var_table))
})

test_that("Variable names are found", {
  expect_equal(variable_name_from_string("relig", lang="es", gss_var_table),
               "religión")
  expect_equal(variable_name_from_string("marital", lang="fr", gss_var_table),
               "état matrimonial")
  expect_equal(variable_name_from_string("tvhours", lang="r_variable", gss_var_table),
               "tvhours")
})

test_that("Variable names are found", {
  expect_equal(variable_name(relig, lang="es", gss_var_table),
               "religión")
  expect_equal(variable_name(marital, lang="fr", gss_var_table),
               "état matrimonial")
  expect_equal(variable_name(tvhours, lang="r_variable", gss_var_table),
               "tvhours")
})

test_that("Variable names vector is correct type and length", {
  old_var_table <- set_var_name_table(gss_var_table)
  old_title_lang <- set_title_lang("es")
  expect_type(variable_names_vector(forcats::gss_cat), "character")
  # expect_equal(length(variable_names_vector(forcats::gss_cat)), ncol(forcats::gss_cat))
  set_var_name_table(old_var_table)
  set_title_lang(old_title_lang)
})

test_that("Variable names vector is accurate", {
  old_var_table <- set_var_name_table(gss_var_table)
  old_title_lang <- set_title_lang("es")
  expect_equal(variable_names_vector(forcats::gss_cat)[3], "edad")
  set_title_lang("r_variable")
  expect_equal(variable_names_vector(forcats::gss_cat), colnames(forcats::gss_cat))
  set_var_name_table(old_var_table)
  set_title_lang(old_title_lang)
})

test_that("var_lang shortcut works accurately", {
  old_var_table <- set_var_name_table(gss_var_table)
  old_title_lang <- set_title_lang("es")
  expect_equal(var_lang(age), "edad")
  set_title_lang("r_variable")
  expect_equal(var_lang(tvhours), "tvhours")
  set_var_name_table(old_var_table)
  set_title_lang(old_title_lang)
})


test_that("Invalid language handled correctly", {
  expect_error(variable_name_from_string("age", "f0", gss_var_table))
})

test_that("Invalid variable handled correctly", {
  expect_warning(variable_name_from_string("nonexistent.variable", "es", gss_var_table))
  expect_equal(suppressWarnings(variable_name_from_string("nonexistent.variable", "es", gss_var_table)),
               "nonexistent.variable")
})

test_that("var_name_language_available function produces correct results", {
  expect_false(var_name_language_available("cz"))
  expect_true(var_name_language_available("es", uc_var_table))
  expect_true(var_name_language_available("en", uc_var_table))
  expect_true(var_name_language_available("r_variable", uc_var_table))
  expect_false(var_name_language_available("fr", uc_var_table))
})

set_var_name_table(old_vartable)
