
#' list cv data files using regex
#'
#' @param x dierectory where cv data in
#'
#' @return
#' @export
#'
#' @examples
list_cv <- function(x) {
  list.files(x, pattern = '(?i)(cv)\\.(txt)|(csv)')
}
