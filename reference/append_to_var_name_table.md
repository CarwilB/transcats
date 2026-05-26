# Append new entries to variable_name_table

Adds an extension translation table to an existing one. Put the
extension first (this makes piping the function easier). By default, the
active translation table is the one appended to. However, you must pipe
to
[`set_var_name_table()`](https://carwilb.github.io/transcats/reference/set_var_name_table.md)
if you want to put the extended table into use.

## Usage

``` r
append_to_var_name_table(
  extension,
  table = tcats$var_name_table,
  overwrite = FALSE
)
```

## Arguments

- extension:

  A matching variable translation table with one column named `language`
  that has the same languages as `table'`, not necessarily in the same
  order. (The extension may have additional languages, which will be
  dropped.)

- table:

  A variable translation table with one column named `language`

- overwrite:

  A flag indicating whether entries that overlap between the two tables
  should be overwritten by the value in extension. Default value is
  FALSE, indicating no change should be made.

## Value

A longer variable translation table

## Examples

``` r
n_trans_table <- tibble::tribble(
 ~language, ~date, ~age, ~n, ~n_state_perp, ~n_state_victim, ~n_state_separate, ~deaths,
 "en", "Date", "Age", "Confirmed", "State Perp", "State Victim", "Sep from State", "Deaths",
 "es", "Fecha", "Edad", "Confirmado", "Perp x Estado", "Víctima Estatal",
   "Ajeno del Estado", "Muertes",
 "r_variable", "date", "age", "n", "n_state_perp", "n_state_victim",
   "n_state_separate", "deaths")
append_to_var_name_table(n_trans_table, uc_var_table)
#> # A tibble: 3 × 70
#>   language   event_title    unconfirmed year  month day   later_year later_month
#>   <chr>      <chr>          <chr>       <chr> <chr> <chr> <chr>      <chr>      
#> 1 en         Event identif… Unconfirme… Year  Month Day   Year of D… Month of D…
#> 2 es         Identificador… No confirm… Año   Mes   Día   Año de Mu… Mes de Mue…
#> 3 r_variable event_title    unconfirmed year  month day   later_year later_month
#> # ℹ 62 more variables: later_day <chr>, dec_firstname <chr>,
#> #   dec_surnames <chr>, id_indiv <chr>, dec_age <chr>, dec_alt_age <chr>,
#> #   dec_gender <chr>, dec_ethnicity <chr>, dec_residence <chr>,
#> #   dec_nationality <chr>, dec_affiliation <chr>, dec_spec_affiliation <chr>,
#> #   dec_title <chr>, cause_death <chr>, cause_medical <chr>, munition <chr>,
#> #   weapon <chr>, victim_armed <chr>, perp_category <chr>, perp_group <chr>,
#> #   perp_firstname <chr>, perp_surname <chr>, perp_pol_stalemate <chr>, …
append_to_var_name_table(gss_var_table, uc_var_table)[c(1,6,71)]
#> # A tibble: 3 × 3
#>   language   day   tvhours                        
#>   <chr>      <chr> <chr>                          
#> 1 en         Day   hours per day watching tv      
#> 2 es         Día   horas diarias viendo televisión
#> 3 r_variable day   tvhours                        
```
