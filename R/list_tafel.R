#' list cv data files using regex
#'
#' @param dir a string, directory where cv data in
#'
#' @return
#' @export
#'
#' @examples
list_tafel <- function(dir) {
  list.files(path = dir, pattern = "\\btafel\\b|\\bTafel\\b\\.(txt)|(csv)", full.names = TRUE)
}
