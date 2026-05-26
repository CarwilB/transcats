# Add translated levels to a list object

Translate the `levels` vector for a categorical factor and add it to a
list object.

## Usage

``` r
add_translated_levels(list_obj, ...)
```

## Arguments

- list_obj:

  A list object containing the levels to be translated.

- ...:

  Additional arguments passed to the `translated_levels` function.

## Value

A modified version of a variable description list object with the
translated levels added.

## Examples

``` r
p_domain <- list(
 levels = c("Coca", "Contraband", "Education")
)
add_translated_levels(p_domain, variable = "protest_domain", uc_translation)
#> $levels
#> [1] "Coca"       "Contraband" "Education" 
#> 
#> $levels_es
#> [1] "Coca"        "Contrabando" "Educación"  
#> 
```
