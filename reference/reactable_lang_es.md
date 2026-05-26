# Provide Spanish-language text for interactive Reactable interface elements

Provide Spanish-language text for interactive Reactable interface
elements

## Usage

``` r
reactable_lang_es(plural_noun = "filas")
```

## Arguments

- plural_noun:

  A word in Spanish, formulated as a plural noun that denotes what the
  rows of the table refer to, such as "observaciones" (observations),
  "eventos" (events), etc. By default, it is set to "filas" (rows).

## Value

A specialized list of interface text for the Reactable package to use.
Follows the format of
[`reactable::reactableLang()`](https://glin.github.io/reactable/reference/reactableLang.html)

## Examples

``` r
reactable_lang_es_1 <- reactable_lang_es("eventos")
```
