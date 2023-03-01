test_that("A silly success.", {
  succeed("Adding a success as a starting point to beat.")
})

test_that("r4ds_process_convos produces expected results", {
  skip_if(Sys.getenv("SLACK_API_TOKEN") == "")
  expect_snapshot({
    # I saved the head of a real pull. Ideally simplify that in the future.
    sample_df <- readRDS(test_path("sample_df.rds"))
    r4ds_process_convos(sample_df) |>
      dplyr::glimpse()
  })
})
