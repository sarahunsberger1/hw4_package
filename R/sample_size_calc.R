#' Calculate Sample Size
#'
#' @param delta Estimate of the difference in change in outcome annually from treatment to placebo groups. Default is set to 0.5 clinically meaningful change in CDR-SB score.
#' @param sd Estimate of the standard deviation in outcome annually for a person with mild cognitive impairment. Default is set to 1.08 (a sd of change in CDR-SB score annually).
#' @param sig.level Significance level of the test.
#' @param power Power of test (1 minus Type II error probability)
#' @param bonferonni Boolean specifying if the user wants to include a bonferonni correction for a secondary outcome.
#' @param alternative One- or two-sided test.
#'
#' @return Number of participants needed in each group.
#' @export
sample_size_calc <- function(delta = 0.5, sd = 1.08,
                       sig.level = 0.05, power = 0.9,
                       bonferonni = FALSE,
                       alternative = "two.sided") {
  if (bonferonni == FALSE){
    power.t.test(delta = delta, sd = sd, sig.level = sig.level,
                 power = 0.9, alternative = alternative)
    }
  else {
    power.t.test(delta = delta, sd = sd, sig.level = sig.level/2,
                 power = 0.9, alternative = alternative)
  }
}
