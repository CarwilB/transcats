# Language-specific names for variables

Language-specific names for variables

## Usage

``` r
variable_name(
  variable,
  lang = tcats$title_lang,
  name_table = tcats$var_name_table
)
```

## Arguments

- variable:

  Name of the variable, without quotes

- lang:

  Language to be used; use `r_variable` for the variable itself.

- name_table:

  A horizontal translation table whose column names correspond to
  variables

## Value

A text string that is the title of the variable, or the name of the
variable in r.

## Examples

``` r
variable_name(relig, "es", gss_var_table)
#> [1] "religión"
variable_name(partyid, "en", gss_var_table)
#> [1] "party affiliation"
```
