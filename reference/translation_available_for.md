# Check whether translations are available for all values in a vector/column

`translation_available_for` checks if the values in a vector or column
to see which have translations available in the translation table.

`num_translation_available` returns the number of values that have
translations available, from zero to length(unique(vector)).

`all_translation_available_for` checks if all values in the vector have
translations available in the translation table.

`which_translation_unavailable_for` returns a vector with the values
that do not have translations available in the translation table.

## Usage

``` r
translation_available_for(
  dataframe,
  variable_name,
  translation_table = tcats$translation_table,
  dest_lang = tcats$dest_lang,
  source_lang = tcats$source_lang,
  verbose = FALSE
)

num_translation_available(
  dataframe,
  variable_name,
  translation_table = tcats$translation_table,
  dest_lang = tcats$dest_lang,
  source_lang = tcats$source_lang,
  verbose = FALSE
)

all_translation_available_for(
  dataframe,
  variable_name,
  translation_table = tcats$translation_table,
  dest_lang = tcats$dest_lang,
  source_lang = tcats$source_lang,
  verbose = FALSE
)

which_translation_unavailable_for(
  dataframe,
  variable_name,
  translation_table = tcats$translation_table,
  dest_lang = tcats$dest_lang,
  source_lang = tcats$source_lang,
  verbose = FALSE
)
```

## Arguments

- dataframe:

  A vector or dataframe to be checked. If a dataframe, it should contain
  the variable specified in `variable`.

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

A list of values with available translation
