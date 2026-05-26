# Ultimate Consequences Variable Name Translation Tables

These are translation tables for the Ultimate Consequences data project,
which documents deaths in Bolivian political conflict.

## Usage

``` r
uc_var_table

n_trans_table

uc_var_table_ext

uc_translation_tables_2025_aug
```

## Format

- uc_var_table:

  A tibble with three rows and 63 columns. Each row corresponds to a
  single language: "en" (English), "es" (Spanish), and "r_variable" (the
  variable names in R).

- n_trans_table:

  A tibble with three rows and 9 columns. Each row corresponds to a
  single language: "en" (English), "es" (Spanish), and "r_variable" (the
  variable names in R). This add variables not included in the deaths
  entries page to the translation set: date, age, n, n_state_perp,
  n_state_victim, n_state_separate, r_variable, deaths, event. All its
  values are included in uc_var_table_ext.

- uc_var_table_ext:

  A tibble with three rows and 74 columns, extending the translation
  table in `uc_var_table` with additional variables used in summary
  tables.

- uc_translation_tables_2025_aug:

  A list of eight tibbles, each with two columns named "en" and "es".
  Their names correspond to the categorical variables involved:
  `protest_domain`, `pres_admin`, `dec_affiliation`, `perp_affiliation`,
  `cause_death`, `state_responsibility`, `intentionality`,
  `event_title`.

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with 3
rows and 9 columns.

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with 3
rows and 74 columns.

An object of class `list` of length 8.

## Source

<https://ultimateconsequences.github.io/>
