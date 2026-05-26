# Language-specific names for variables

This function outputs a string naming a variable based on a multilingual
translation table. If you want to output the names of multiple variables
at once, you can use this function with map() (and you cannot use
variable_name()).

## Usage

``` r
variable_name_from_string(
  variable,
  lang = tcats$title_lang,
  name_table = tcats$var_name_table
)
```

## Arguments

- variable:

  Name of the variable, passed as a string, in quotes

- lang:

  Language to be used; use `r_variable` for the variable itself.

- name_table:

  A horizontal translation table whose column names correspond to
  variables

## Value

A text string that is the title of the variable, or the name of the
variable in r.

## Examples

``` r
set_var_name_table(gss_var_table)
variable_name_from_string("relig", lang="es")
#> [1] "religión"
variable_name_from_string("partyid", lang="en")
#> [1] "party affiliation"
purrr::map(colnames(forcats::gss_cat), var_lang_str)
#> [[1]]
#> [1] "year of survey"
#> 
#> [[2]]
#> [1] "marital status"
#> 
#> [[3]]
#> [1] "age"
#> 
#> [[4]]
#> [1] "race"
#> 
#> [[5]]
#> [1] "reported income"
#> 
#> [[6]]
#> [1] "party affiliation"
#> 
#> [[7]]
#> [1] "religion"
#> 
#> [[8]]
#> [1] "denomination"
#> 
#> [[9]]
#> [1] "hours per day watching tv"
#> 

```
