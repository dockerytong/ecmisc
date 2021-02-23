#' Read electrochemical data
#'
#' @param dir directory where ec data in
#' @param type a character, what data to read
#'
#' @return
#' @export
#'
#' @examples
read_ec <- function(dir, type) {
  if (type %in% c('CV','cv')) {
    read_cv(dir)
  } else if (type %in% c('LSV','lsv')) {
    read_lsv(dir)
  } else if (type %in% c('EIS','eis')) {
    read_eis(dir)
  } else {
    echo('Data file not found')
  }
}
