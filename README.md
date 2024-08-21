
<!-- README.md is generated from README.Rmd. Please edit that file -->

# transcats

<!-- badges: start -->
<!-- badges: end -->

The goal of transcats is to **trans**late the variable names and titles
and values of dataframes containing containing **cat**egorical and other
data. These translations are made using editable translation tables to
allow users to edit and verify translations.

## Installation

You can install the development version of transcats from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("CarwilB/transcats")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(transcats)
## basic example code
names(forcats::gss_cat)
#> [1] "year"    "marital" "age"     "race"    "rincome" "partyid" "relig"  
#> [8] "denom"   "tvhours"
```

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

## Translating tabular data

There’s a longer workflow for translating categorical data (see the
vignette “A workflow for creating translation tables”), but the net
result is full translation of categorical data.

| year | marital       | age | race  | rincome         | partyid            | relig              | denom             | tvhours |
|-----:|:--------------|----:|:------|:----------------|:-------------------|:-------------------|:------------------|--------:|
| 2000 | Never married |  26 | White | \$8000 to 9999  | Ind,near rep       | Protestant         | Southern baptist  |      12 |
| 2000 | Divorced      |  48 | White | \$8000 to 9999  | Not str republican | Protestant         | Baptist-dk which  |      NA |
| 2000 | Widowed       |  67 | White | Not applicable  | Independent        | Protestant         | No denomination   |       2 |
| 2000 | Never married |  39 | White | Not applicable  | Ind,near rep       | Orthodox-christian | Not applicable    |       4 |
| 2000 | Divorced      |  25 | White | Not applicable  | Not str democrat   | None               | Not applicable    |       1 |
| 2000 | Married       |  25 | White | \$20000 - 24999 | Strong democrat    | Protestant         | Southern baptist  |      NA |
| 2000 | Never married |  36 | White | \$25000 or more | Not str republican | Christian          | Not applicable    |       3 |
| 2000 | Divorced      |  44 | White | \$7000 to 7999  | Ind,near dem       | Protestant         | Lutheran-mo synod |      NA |

| year | marital_fr     | age | race_fr  | rincome_fr      | partyid_fr                             | relig_fr           | denom_fr                     | tvhours |
|-----:|:---------------|----:|:---------|:----------------|:---------------------------------------|:-------------------|:-----------------------------|--------:|
| 2000 | Jamais marié.e |  26 | Blanc.he | \$8000 à 9999   | Indépendant.e, proche du républicain.e | Protestant         | Baptiste du Sud              |      12 |
| 2000 | Divorcé.e      |  48 | Blanc.he | \$8000 à 9999   | Républicain.e, pas fort.e              | Protestant         | Baptiste, ne sait pas lequel |      NA |
| 2000 | Veuf/Veuve     |  67 | Blanc.he | Non applicable  | Indépendant.e                          | Protestant         | Aucune dénomination          |       2 |
| 2000 | Jamais marié.e |  39 | Blanc.he | Non applicable  | Indépendant.e, proche du républicain.e | Chrétien orthodoxe | Sans objet                   |       4 |
| 2000 | Divorcé.e      |  25 | Blanc.he | Non applicable  | Démocrate, pas fort.e                  | Aucune religion    | Sans objet                   |       1 |
| 2000 | Marié.e        |  25 | Blanc.he | \$20000 à 24999 | Démocrate fort.e                       | Protestant         | Baptiste du Sud              |      NA |
| 2000 | Jamais marié.e |  36 | Blanc.he | \$25000 ou plus | Républicain.e, pas fort.e              | Chrétien           | Sans objet                   |       3 |
| 2000 | Divorcé.e      |  44 | Blanc.he | \$7000 à 7999   | Indépendant.e, proche du démocrate     | Protestant         | Synode luthérien-Missouri    |      NA |
