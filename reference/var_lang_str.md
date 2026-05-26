# Language-specific names for variables (shortened call)

This functions provides a shortened call to variable_name using preset
values for the language and variable name table.

## Usage

``` r
var_lang_str(...)
```

## Arguments

- ...:

  Name of the variable, passed as a string, in quotes

## Value

A text string that is the title of the variable

## Examples

``` r
var_lang_str("tvhours")
#> Warning: No translation found for tvhours.
#> [1] "tvhours"

```
