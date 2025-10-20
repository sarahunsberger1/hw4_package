#' Make a heatmap showing the number of participants needed for different delta and sd values
#'
#' @param power The power for the test you want to achieve
#' @param delta_start Starting value of the values of deltas plotted.
#' @param delta_end Ending value of the values of deltas plotted.
#' @param sd_start Starting value of the values of standard deviations plotted.
#' @param sd_end Ending value of the values of standard deviations plotted.
#' @param length_vec Number of values of delta and sd plotted.
#'
#' @return Heatmap of the n value needed to get the power value specified at different values of delta and sd.
#' @export
plot_n <- function(power = 0.9, delta_start = 0.1, delta_end = 1.0, sd_start = 0.5, sd_end = 1.5, length_vec = 20){

  grid <- expand.grid(
    delta = seq(delta_start, delta_end, length.out = length_vec),
    std_dev = seq(sd_start, sd_end, length.out = length_vec))
  n_vals <- rep(NA, length_vec^2)

  for (i in 1:(length_vec^2)){
    x <- sample_size_calc(delta = grid$delta[i], sd = grid$std_dev[i], power = power)
    n_vals[i] <- x$n
  }

  grid$n <- n_vals

  ## make it so that there are not weird notes
  delta = NULL; std_dev = NULL;
  rm(list=c("delta", "std_dev"))

  ggplot2::ggplot(grid, ggplot2::aes(delta, std_dev, fill = n_vals)) +
    ggplot2::geom_tile() + ggplot2::theme_bw()
}
