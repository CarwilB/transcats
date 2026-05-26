# Translated Join

Adds one column (`translated_join`) or several columns
(`translated_join_vars`) to the right side of a data table, filled with
translations of one or several categorical variables.

## Usage

``` r
translated_join(
  dataframe,
  variable,
  translation_table = tcats$translation_table,
  dest_lang = tcats$dest_lang,
  source_lang = tcats$source_lang,
  .location = "right"
)

translated_join_vars(dataframe, variables = c(""), ...)
```

## Arguments

- dataframe:

  Data table being changed

- variable:

  Name of the variable to be translated, as a string.

- translation_table:

  Consolidated translation table to be used (translation_table\$variable
  should be a translation table for the variable involved).

- dest_lang:

  Language to be translated to, typically as a short code.

- source_lang:

  Language to be translated from, typically as a short code.

- .location:

  If location is "right", the translated columns are added on the right
  of dataframe. If "beside" they are added next to the the translated
  variable. If "replace", they supplant the translated variable.

- variables:

  A list of variables in c("firstvar", "secondvar") format.

- ...:

  is used to pass translation_table, dest_lang, source_lang on from
  translated_join_vars to translated_join

## Value

A modified version of the data table with extra columns

## Details

Translated variables take the name of the original variable, plus an
underscore, and the code of the destination language.
