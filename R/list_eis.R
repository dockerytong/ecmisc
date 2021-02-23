#' list EIS data files using regex
#'
#' @param dir directory where EIS data in
#'
#' @return
#' @export
#'
#' @examples
list_eis <- function(dir) {
  list.files(path = dir, pattern = '(?i)(eis)\\.(txt)|(csv)', full.names = TRUE)
}
