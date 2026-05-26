# Check if a language is available in a variable name table

This function returns a simple logical result, TRUE or FALSE, as to
whether a given language appears in the active variable name table, or
in a language table passed as the second parameter.

## Usage

``` r
var_name_language_available(
  lang = tcats$title_lang,
  name_table = tcats$var_name_table
)
```

## Arguments

- lang:

  A language code.

- name_table:

  A variable name table. Defaults to the active var_name_table.

## Value

Logical true or false

## Examples

``` r
var_name_language_available("fr") # examines active variable table
#> [1] TRUE
var_name_language_available("es", uc_var_table)
#> [1] TRUE
```
