# Show values with available translations

`which_translation_available` returns the values for which there is an
available translation in the translation table.

Note that unlike functions like `translation_available_for`,
`which_translation_available` does not check the values within a
dataframe or vector, but looks directly at the translation table and
returns all possible values that can be translated.

## Usage

``` r
which_translation_available(
  variable_name,
  translation_table = tcats$translation_table,
  dest_lang = tcats$dest_lang,
  source_lang = tcats$source_lang,
  verbose = FALSE
)
```

## Arguments

- variable_name:

  The name of the variable to be checked, as a string.

- translation_table:

  A translation table, by default this is the active translation table.

- dest_lang:

  The destination language code, by default this is the current source
  language, set by set_dest_lang().

- source_lang:

  The source language code, by default this is the current source
  language, set by set_source_lang().

- verbose:

  If TRUE, prints messages about the process.

## Value

A character vector with the values that have translations available.
