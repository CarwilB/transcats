# Reformat a combined translation table into a standard one

Part of the import sequence for a combined translation table, which can
be produced by `create_blank_translation_table` and edited externally
(for example, as a CSV file). This function takes a single data frame
and splits it into as many smaller translation tables as are indicated
by the number. of headers.

## Usage

``` r
parse_combined_translation_table(combined_table)
```

## Arguments

- combined_table:

  A combined translation table with as many columns as languages
  involved. This table must be sectioned off for each variable. Each
  header line takes the form "variable_name", "–", "–", with as many
  "–"s as needed to cover all but the first column.

## Value

A translation table list, `translation_list`, each member of which is a
translation table for a given categorical variable.

## Details

It returns the translation table list used as the main translation table
format by `transcats`.

## Examples

``` r
gss_translation_combined <- readr::read_csv(
                       fs::path_package("extdata", "gss_cat_transtable_complete.csv",
                                        package = "transcats"))
#> Rows: 86 Columns: 3
#> ── Column specification ────────────────────────────────────────────────────────
#> Delimiter: ","
#> chr (3): en, es, fr
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
gss_translation <- parse_combined_translation_table(gss_translation_combined)
```
