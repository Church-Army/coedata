# WARNING - Generated by {fusen} from dev/flat_get-deprivation-data-for-parishes.Rmd: do not edit by hand

test_that("coe_parish_deprivation() returns a tibble", {
  result <- coe_parish_deprivation()
  expect_s3_class(result, "tbl_df")
})
