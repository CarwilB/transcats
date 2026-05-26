# Provide English-language text for interactive Reactable interface elements

Provide English-language text for interactive Reactable interface
elements

## Usage

``` r
reactable_lang_en(plural_noun = "rows")
```

## Arguments

- plural_noun:

  A word in English, formulated as a plural noun that denotes what the
  rows of the table refer to, such as "observations", "events", etc. By
  default, it is set to "rows."

## Value

A specialized list of interface text for the Reactable package to use.
Follows the format of
[`reactable::reactableLang()`](https://glin.github.io/reactable/reference/reactableLang.html)

## Examples

``` r
reactable_lang_en_1 <- reactable_lang_es("events")
```
