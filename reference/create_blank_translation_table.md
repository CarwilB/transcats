# Create one blank translation table

Creates a blank translation table for a single variable in a data frame.

## Usage

``` r
create_blank_translation_table(
  dataframe,
  variable,
  source_lang = tcats$source_lang,
  dest_language_list = tcats$dest_lang_list
)
```

## Arguments

- dataframe:

  Dataframe whose columns are the variables

- variable:

  Single variable among the columns, passed as string

- source_lang:

  Code for source language; will head left column of output

- dest_language_list:

  Codes, as a list of strings, to be translated to

## Value

Data frame with possible values for the variable in the source language
and blank to fill in translations

## Details

Left column, named by `source_lang` has the original values. If the
variable is a factor, these are the levels of the factor. If it's a
character variable, these are the unique values of `variable` in
`dataframe`.

Each language in the `dest_language_list` gets its own column. However,
if the `source_lang` is in this list, it is removed. Duplicate values
receive a warning.

## Examples

``` r
create_blank_translation_tables(forcats::gss_cat, "relig",
    "en", c("fr", "cz"))
#>                         en fr cz
#> 1                    relig -- --
#> 2                No answer      
#> 3               Don't know      
#> 4  Inter-nondenominational      
#> 5          Native american      
#> 6                Christian      
#> 7       Orthodox-christian      
#> 8             Moslem/islam      
#> 9            Other eastern      
#> 10                Hinduism      
#> 11                Buddhism      
#> 12                   Other      
#> 13                    None      
#> 14                  Jewish      
#> 15                Catholic      
#> 16              Protestant      
#> 17          Not applicable      
```
