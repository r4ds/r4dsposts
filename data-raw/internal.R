# We don't care about archiving bot-style messages.
.bad_subtypes <- c(
  "channel_join",
  "channel_name",
  "channel_purpose", # Long term we might want this but not at first.
  "channel_topic", # Long term we might want this but not at first.
  "bot_add",
  "bot_message",
  "thread_broadcast"
)
usethis::use_data(
  .bad_subtypes,
  internal = TRUE,
  overwrite = TRUE
)

rm(.bad_subtypes)
