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
#' translation <- `list(protest_domain = domain_trans_table,
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
