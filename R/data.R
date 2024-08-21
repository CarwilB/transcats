#' Ultimate Consequences Translation Table
#'
#' A translation table for the Ultimate Consequences data project,
#' which documents deaths in Bolivian political conflict.
#'
#'
#' @format
#' `uc_translation` is a list of eight tibbles, each with two columns named "en" and "es".
#' Their names correspond to the categorical variables involved:
#' `protest_domain`, `pres_admin`, `dec_affiliation`, `perp_affiliation`,
#' `cause_death`, `state_responsibility`, `intentionality`, `event_title`
#'
#' @details
#' uc_translation <- `list(protest_domain = domain_trans_table,
#'                     pres_admin = pres_trans_table,
#'                     dec_affiliation = affil_trans_table,
#'                     perp_affiliation = affil_trans_table,
#'                     cause_death = cause_trans_table,
#'                     state_responsibility = sresp_trans_table,
#'                     intentionality = intent_trans_table,
#'                     event_title = event_trans_table)`
#'
#' Note that the duplicate between two variables is intentional,
#' since these two variables (for the affiliation of the perpetrator
#' and victim of political violence) use the same set of possible categories.
#'
#' @source <https://ultimateconsequences.github.io/>
"uc_translation"

#' Ultimate Consequences Translation Table
#'
#' A translation table for the Ultimate Consequences data project,
#' which documents deaths in Bolivian political conflict.
#'
#' @format A tibble with three rows and 63 columns. Each row corresponds
#' to a single language, "en" (English), "es" (Spanish), and "r_variable"
#' (the variable names in R).
#'
#' @source <https://ultimateconsequences.github.io/>
"uc_var_table"

#' Variable name table for gss_cat
#'
#' A variable name translation table for the variable gss_cat,
#' a data source from the General Social Survey that is included
#' in the package `forcats` and used for examples in `transcats`.
#'
#' @format ## `gss_var_table`
#' A data frame with 4 rows and 10 columns. The rows correspond to
#' English, Spanish, French and the r_variable. The final row matches the
#' names of the columns. Rows are indexted by language codes in the variable
#' language.
#'
#' @source Created as part of `transcats`
"gss_var_table"

#' State Responsibility Levels
#'
#' A vector ordering the levels for the variable `state_responsibility` in
#' the Ultimate Consequences database.
#'
#' @format
#' `sr_levels` is a vector with six values.
#'
#' @details
#' sr_levels <- c("Perpetrator", "Victim", "Involved", "Separate",
#'                "Unintentional", "Unknown")
#'
#' @source <https://ultimateconsequences.github.io/>
"sr_levels"
