test_that("Error on mismatch", {
  n_trans_table_0 <- tibble::tribble(
    ~language, ~date,
    #--|--|----
    "en", "Date",
    "fr", "Date",
    "r_variable", "date"
  )
  expect_warning(append_to_var_name_table(n_trans_table_0, uc_var_table))
  expect_equal(suppressWarnings(append_to_var_name_table(n_trans_table_0, uc_var_table)), uc_var_table)
})


test_that("Appending works as expected", {
  n_trans_table <- tibble::tribble(
    ~language, ~date, ~age, ~n, ~n_state_perp, ~n_state_victim, ~n_state_separate, ~deaths,
    #--|--|----
    "en", "Date", "Age", "Confirmed", "State Perp", "State Victim", "Sep from State", "Deaths",
    "es", "Fecha", "Edad", "Confirmado", "Perp x Estado", "Víctima Estatal", "Ajeno del Estado", "Muertes",
    "r_variable", "date", "age", "n", "n_state_perp", "n_state_victim", "n_state_separate", "deaths"
  )
  expect_no_error(append_to_var_name_table(n_trans_table, uc_var_table))
  expect_snapshot(append_to_var_name_table(n_trans_table, uc_var_table))
  expect_equal(append_to_var_name_table(n_trans_table, uc_var_table)$n, c("Confirmed", "Confirmado", "n"))
})

test_that("Languages can be reordered", {
  # This version switches the order of "en" and "es"; should have no effect on output
  n_trans_table_2 <- tibble::tribble(
    ~language, ~date, ~age, ~n, ~n_state_perp, ~n_state_victim, ~n_state_separate, ~deaths,
    #--|--|----
    "es", "Fecha", "Edad", "Confirmado", "Perp x Estado", "Víctima Estatal", "Ajeno del Estado", "Muertes",
    "en", "Date", "Age", "Confirmed", "State Perp", "State Victim", "Sep from State", "Deaths",
    "r_variable", "date", "age", "n", "n_state_perp", "n_state_victim", "n_state_separate", "deaths"
  )
  expect_no_warning(append_to_var_name_table(n_trans_table_2, uc_var_table))
  expect_equal(append_to_var_name_table(n_trans_table_2, uc_var_table)$n, c("Confirmed", "Confirmado", "n"))
})

test_that("Overwriting is functional", {
  # This version adds another variable 'year' that is already in uc_var_table
  n_trans_table_3 <- tibble::tribble(
    ~language, ~date, ~age, ~n, ~n_state_perp, ~n_state_victim, ~n_state_separate, ~deaths, ~year,
    #--|--|----
    "es", "Fecha", "Edad", "Confirmado", "Perp x Estado", "Víctima Estatal", "Ajeno del Estado", "Muertes", "Año de Muerte",
    "en", "Date", "Age", "Confirmed", "State Perp", "State Victim", "Sep from State", "Deaths", "Year of Death",
    "r_variable", "date", "age", "n", "n_state_perp", "n_state_victim", "n_state_separate", "deaths", "year"
  )
  expect_no_warning(append_to_var_name_table(n_trans_table_3, uc_var_table))
  expect_equal(append_to_var_name_table(n_trans_table_3, uc_var_table)$year, c("Year", "Año", "year"))
  expect_equal(append_to_var_name_table( n_trans_table_3, uc_var_table, overwrite=TRUE)$year, c("Year of Death", "Año de Muerte", "year"))
})

test_that("Works with variables where extension has extra languages", {
  expect_no_warning(append_to_var_name_table(gss_var_table, uc_var_table))
  expect_snapshot(append_to_var_name_table(gss_var_table, uc_var_table)[c(1,6,71)])
  expect_equal(append_to_var_name_table(gss_var_table, uc_var_table)$tvhours, c("hours per day watching tv", "horas diarias viendo televisión",
    "tvhours"))
})
