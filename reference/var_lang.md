# Language-specific names for variables (shortened call)

This functions provides a shortened call to variable_name using preset
values for the language and variable name table.

## Usage

``` r
var_lang(...)
```

## Arguments

- ...:

  Name of the variable, without quotes

## Value

A text string that is the title of the variable

## Examples

``` r
var_lang(tvhours)
#> Warning: No translation found for tvhours.
#> [1] "tvhours"
```
