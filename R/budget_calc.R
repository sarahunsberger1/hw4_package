#' Calculate Total Budget
#'
#' @param n_primary Number of participants in the study per group.
#' @param n_secondary Number of participants receiving an MRI per group.
#' @param n_followup_primary Number of follow up visits after the enrollment visit where CDR-SB is tested.
#' @param n_followup_secondary Number of follow up visits after the enrollment visit where an MRI is scheduled.
#'
#' @return Total budget for the specified study design.
#' @export
budget_calc <- function(n_primary, n_secondary, n_followup_primary = 1, n_followup_secondary = 1) {
  budget <- n_primary * 2 * (3000 + 2000* n_followup_primary) + n_secondary * 2 * (5000 + 5000*n_followup_secondary)
  return(budget)
}
