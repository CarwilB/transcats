# Translated levels

Translate the levels vector for a categorical factor.

## Usage

``` r
translated_levels(
  levels_vector,
  variable,
  translation_table,
  dest_lang = "es",
  source_lang = "en"
)
```

## Arguments

- levels_vector:

  One-dimensional vector of levels of a factor

- variable:

  The variable involved, passed as a string.

- translation_table:

  Consolidated translation table to be used (translation_table\$variable
  should be a translation table for the variable involved).

- dest_lang:

  Language to be translated to, typically as a short code.

- source_lang:

  Language to be translated from, typically as a short code.

## Value

A one-dimensional levels vector for the factor.

## Examples

``` r
sr_levels_es <- translated_levels(sr_levels, "state_responsibility",
                                uc_translation,
                                dest_lang="es", source_lang="en")
```
