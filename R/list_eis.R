#' list EIS data files using regex
#'
#' @param dir directory where EIS data in
#'
#' @return
#' @export
#'
#' @examples
list_eis <- function(dir) {
  list.files(path = dir, pattern = "\\beis\\b|\\bEIS\\b\\.(txt)|(csv)", full.names = TRUE)
}
