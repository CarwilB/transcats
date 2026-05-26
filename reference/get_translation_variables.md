# Get list of variables in the active translation table

Returns a list of variables in the active translation table.

## Usage

``` r
get_translation_variables()
```

## Value

A character vector with the names of the variables in the active
translation table.

## Examples

``` r
set_active_translation_table(uc_translation)
get_translation_variables()
#> [1] "protest_domain"       "pres_admin"           "dec_affiliation"     
#> [4] "perp_affiliation"     "cause_death"          "state_responsibility"
#> [7] "intentionality"       "event_title"         
```
