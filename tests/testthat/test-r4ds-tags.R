test_that("r4ds_process_convos produces expected results", {
  expect_snapshot(
    {
      # I saved the head of a real pull. Ideally simplify that in the future.
      sample_df <- readRDS(test_path("sample_df.rds"))
      r4ds_process_convos(sample_df) |>
        dplyr::glimpse()
    }
  )
})
