#' Check for a Reaction in Reactions
#'
#' @param reactions A list of reaction lists.
#' @param reaction_name A character vector with the name of one or more target
#'   reactions.
#' @param posters An optional character vector of user ids of the person who
#'   posted each message. If provided, reactions from this user count as valid.
#' @param valid_users An optional character vector of user ids whose reactions
#'   always count as valid. If this and posters are both omitted, all reactions
#'   are considered valid.
#'
#' @return A logical vector the same length as reactions.
#' @keywords internal
.has_reaction <- function(reactions, reaction_name,
                          posters,
                          valid_users) {
  if (!missing(posters) || !missing(valid_users)) {
    if (missing(posters)) {
      posters <- rep(NA_character_, length(reactions))
    }
    return(
      purrr::map2_lgl(
        reactions, posters,
        \(reaction_set, poster) {
          .has_reaction_individual_filter(
            reaction_set, reaction_name,
            poster, valid_users
          )
        }
      )
    )
  }
}

.has_reaction_individual_filter <- function(reaction_set,
                                            reaction_name,
                                            poster,
                                            valid_users = NA_character_) {
  if (all(is.na(reaction_set))) {
    return(FALSE)
  } else {
    return(
      any(
        purrr::map_lgl(
          reaction_set,
          function(reaction) {
            reaction$name %in% reaction_name &&
              (
                !length(valid_users) ||
                  poster %in% reaction$users ||
                  any(reaction$users %in% valid_users)
              )
          }
        )
      )
    )
  }
}

.get_channel_members <- function(channel_id) {
  channel_members <- slackcalls::post_slack(
    "conversations.members",
    channel = channel_id
  )

  if (channel_members$ok && "members" %in% names(channel_members)) {
    return(unlist(channel_members$members))
  } else {
    return(character())
  }
}
