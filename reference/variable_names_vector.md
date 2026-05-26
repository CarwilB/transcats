# Produce a list of display names for each variables

Using the active variable name table, produce a list of display names
for each variable, in the language currently specified as
tcats\$title_lang (set by
[`set_title_lang()`](https://carwilb.github.io/transcats/reference/set_title_lang.md)).

## Usage

``` r
variable_names_vector(dataframe)
```

## Arguments

- dataframe:

  Dataframe whose columns are the variables to be listed.

## Value

A vector of strings wit the display names.

## Examples

``` r
set_title_lang("es")
set_var_name_table(gss_var_table)
variable_names_vector(forcats::gss_cat)
#> [1] "año de la encuesta"              "estado civil"                   
#> [3] "edad"                            "raza"                           
#> [5] "ingresos declarados"             "afiliación partidaria"          
#> [7] "religión"                        "denominación"                   
#> [9] "horas diarias viendo televisión"
```
