test_that("Sample size calculation is correct", {
  result <- sample_size_calc()
  expect_equal(result$n, 99.01715)

  result2 <- sample_size_calc(bonferonni = TRUE)
  expect_equal(result2$n, 117.077625)
})
