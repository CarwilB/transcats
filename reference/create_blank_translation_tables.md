# Create a composite translation table

Creates a blank translation table for a multiple variables in a data
frame.

## Usage

``` r
create_blank_translation_tables(
  dataframe,
  variable_list,
  source_lang = tcats$source_lang,
  dest_language_list = tcats$dest_lang_list,
  incl_header = TRUE,
  combine_tables = TRUE
)
```

## Arguments

- dataframe:

  Dataframe whose columns are the variables

- variable_list:

  List of variables

- source_lang:

  Code for source language; will head left column of output

- dest_language_list:

  Codes, as a list of strings, to be translated to

- incl_header:

  If true, put the name of the variable at the top of each translation
  table.

- combine_tables:

  If true, combine all the translation tables into a single data frame.
  If false, return a single list of translation tobles, with the
  variable names as the names of the list elements.

## Value

A single dataframe or a list of dataframes

## Details

If `combine_tables` is TRUE, all the translation tables are stacked and
bound together in a single table. If FALSE, they are returned in the
preferred `transcats` form, a list of translation tables.

The left column of each table, named by `source_lang` has the original
values. If the variable is a factor, these are the levels of the factor.
If it's a character variable, these are the unique values of `variable`
in `dataframe`.

Each language in the `dest_language_list` gets its own column. However,
if the `source_lang` is in this list, it is removed. Duplicate values
receive a warning.

## Examples

``` r
create_blank_translation_tables(forcats::gss_cat, c("marital", "race", "relig"),
    "en", c("fr", "cz"))
#>                         en fr cz
#> 1                  marital -- --
#> 2                No answer      
#> 3            Never married      
#> 4                Separated      
#> 5                 Divorced      
#> 6                  Widowed      
#> 7                  Married      
#> 8                     race -- --
#> 9                    Other      
#> 10                   Black      
#> 11                   White      
#> 12          Not applicable      
#> 13                   relig -- --
#> 14               No answer      
#> 15              Don't know      
#> 16 Inter-nondenominational      
#> 17         Native american      
#> 18               Christian      
#> 19      Orthodox-christian      
#> 20            Moslem/islam      
#> 21           Other eastern      
#> 22                Hinduism      
#> 23                Buddhism      
#> 24                   Other      
#> 25                    None      
#> 26                  Jewish      
#> 27                Catholic      
#> 28              Protestant      
#> 29          Not applicable      
create_blank_translation_tables(vcd::DanishWelfare, c("Status", "Urban"),
                                source_lang = "en",
                                dest_language_list = c("en-complete", "dk"))
#>               en en-complete dk
#> 1         Status          -- --
#> 2          Widow               
#> 3        Married               
#> 4      Unmarried               
#> 5          Urban          -- --
#> 6     Copenhagen               
#> 7  SubCopenhagen               
#> 8      LargeCity               
#> 9           City               
#> 10       Country               
```
