
#' list cv data files using regex
#'
#' @param dir directory where cv data in
#'
#' @return
#' @export
#'
#' @examples
list_cv <- function(dir) {
  list.files(path = dir, pattern = '(?i)(cv)\\.(txt)|(csv)', full.names = TRUE)
}
