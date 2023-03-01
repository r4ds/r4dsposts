#' Add R4DS-specific information
#'
#' For R4DS, we use an emoji language to tag questions, and combine that
#' information with other post properties to assign a status.
#'
#' @param convos_tbl Tidy conversations.
#'
#' @return A tbl with additional column `status`. Probably other things soon.
#' @export
r4ds_process_convos <- function(convos_tbl) {
  return(
    convos_tbl |>
      .tag_status()
  )
}

.tag_reactions <- function(convos_tbl) {
  if (
    "reactions" %in% colnames(convos_tbl) &&
    "user" %in% colnames(convos_tbl)
  ) {
    mentors <- .get_channel_members("GAJ8D7YKA")

    convos_tbl <- convos_tbl |>
      dplyr::mutate(
        reaction_answered = .has_reaction(
          reactions = .data$reactions,
          reaction_name = "question-answered",
          posters = .data$user,
          valid_users = mentors
        ),
        reaction_more_info = .has_reaction(
          reactions = .data$reactions,
          reaction_name = c("question-more-info", "speech_balloon"),
          posters = .data$user,
          valid_users = mentors
        ),
        reaction_nevermind = .has_reaction(
          reactions = .data$reactions,
          reaction_name = c("question-nevermind", "octagonal_sign", "nevermind"),
          posters = .data$user,
          valid_users = mentors
        ),
        reaction_checkmark = .has_reaction(
          reactions = .data$reactions,
          reaction_name = c("heavy_check_mark", "white_check_mark"),
          posters = .data$user,
          valid_users = mentors
        ),
        reaction_thread = .has_reaction(
          reactions = .data$reactions,
          reaction_name = "thread",
          posters = .data$user,
          valid_users = mentors
        )
      )
  } else {
    convos_tbl$reaction_answered <- NA
    convos_tbl$reaction_more_info <- NA
    convos_tbl$reaction_nevermind <- NA
    convos_tbl$reaction_checkmark <- NA
    convos_tbl$reaction_thread <- NA
  }

  return(convos_tbl)
}

.tag_final_reply <- function(convos_tbl) {
  return(
    convos_tbl |>
      dplyr::rowwise() |>
      dplyr::mutate(
        user_replied_last = .data$reply_count > 0 &&
          .data$user %in% .data$reply_users &&
          .tag_final_reply_single(.data$user, .data$replies)
      ) |>
      dplyr::ungroup()
  )
}

.tag_final_reply_single <- function(user, replies) {
  return(
    replies |>
      dplyr::arrange(dplyr::desc(.data$ts)) |>
      head(1) |>
      dplyr::pull(.data$user) == user
  )
}

.tag_status <- function(convos_tbl) {
  # TODO: Confirm that we have all the info that we need.

  # TODO: Add "failed" status for old questions that should have been
  # answerable?

  return(
    convos_tbl |>
      .tag_reactions() |>
      .tag_final_reply() |>
      dplyr::mutate(
        status = dplyr::case_when(
          .data$reaction_nevermind ~ "nevermind",
          .data$reaction_answered &
            (.data$reply_count > 0 | .data$edited) ~ "answered",
          .data$reaction_thread ~ "should be thread",
          .data$reaction_checkmark ~ "non-question",
          .data$reaction_answered ~ "mistagged",
          .data$reaction_more_info &
            .data$reply_count > 0 &
            !.data$user_replied_last ~ "needs more info",
          .data$reaction_more_info &
            .data$reply_count > 0 &
            .data$user_replied_last ~ "answerable",
          TRUE ~ "unknown"
        )
      ) |>
      # Drop columns that we added for this purpose.
      dplyr::select(-dplyr::starts_with("reaction_"), -"user_replied_last")
  )
}
