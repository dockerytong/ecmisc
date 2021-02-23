#' list electrochemical data files using regex
#'
#' @param dir directory where ec data in
#' @param type a character, what data to list
#'
#' @return
#' @export
#'
#' @examples
list_ec <- function(dir, type) {
  if (type %in% c('CV','cv')) {
    list_cv(dir)
  } else if (type %in% c('LSV','lsv')) {
    list_lsv(dir)
  } else if (type %in% c('EIS','eis')) {
    list_eis(dir)
  } else {
    echo('Data file not found')
  }
}
