# r4ds_process_convos produces expected results

    Code
      sample_df <- readRDS(test_path("sample_df.rds"))
      dplyr::glimpse(r4ds_process_convos(sample_df))
    Output
      Rows: 6
      Columns: 22
      $ channel_name      <chr> "help-r--general", "help-r--general", "help-r--gener~
      $ channel_id        <chr> "C6VCZPGPR", "C6VCZPGPR", "C6VCZPGPR", "C6VCZPGPR", ~
      $ text              <chr> "Requesting Help with Cross Table,\nIs there a funct~
      $ files             <list> [["F04RTEPGRJR", 1677691293, 1677691293, "image.png~
      $ user              <chr> "U020UFASMHR", "U03UW9QNDMW", "U015BBV4XH7", "U039E4~
      $ ts                <chr> "1677691311.974929", "1677689940.625379", "167761478~
      $ blocks            <list> [["rich_text", "JDXoc", [["rich_text_section", [["t~
      $ client_msg_id     <chr> "8c0e794d-c02f-4379-a84f-71194f675f85", "30987c63-e1~
      $ thread_ts         <chr> "1677691311.974929", "1677689940.625379", NA, "16775~
      $ reply_count       <int> 2, 6, 0, 7, 3, 9
      $ reply_users_count <int> 2, 3, 0, 4, 2, 6
      $ latest_reply      <chr> "1677691556.286839", "1677691540.462349", NA, "16776~
      $ reply_users       <list> ["ULGBAGS6P", "U020UFASMHR"], ["ULGBAGS6P", "U03UW9Q~
      $ reactions         <list> [["question-answered", ["ULGBAGS6P"], 1]], [["questi~
      $ edited            <lgl> FALSE, FALSE, TRUE, FALSE, FALSE, FALSE
      $ edited_at         <chr> NA, NA, "1677614914.000000", NA, NA, NA
      $ attachments       <list> <NULL>, <NULL>, <NULL>, <NULL>, <NULL>, <NULL>
      $ pinned_to         <chr> NA, NA, NA, NA, NA, NA
      $ pinned_by         <chr> NA, NA, NA, NA, NA, NA
      $ pinned_ts         <int> NA, NA, NA, NA, NA, NA
      $ replies           <list> [<tbl_df[2 x 7]>], [<tbl_df[6 x 7]>], [<tbl_df[0 x ~
      $ status            <chr> "answered", "answered", "unknown", "needs more info~

