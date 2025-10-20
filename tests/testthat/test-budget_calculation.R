test_that("Budget calculation is correct", {
  expect_equal(budget_calc(100, 50), 2e+06)
  expect_equal(budget_calc(100, 50, 2, 1), 2400000)
})
