#' list lsv data files using regex
#'
#' @param dir directory where lsv data in
#'
#' @return
#' @export
#'
#' @examples
list_lsv <- function(dir) {
  list.files(path = dir, pattern = "\\blsv\\b|\\bLSV\\b\\.(txt)|(csv)", full.names = TRUE)
}
