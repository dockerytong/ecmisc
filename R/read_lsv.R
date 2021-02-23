#' Read LSV data
#'
#' @param dir directory where cv in
#'
#' @return
#' @export
#'
#' @examples
read_lsv <- function(dir) {
  setNames(dir,
           gsub(
             pattern = '\\.(txt)|(csv)',
             replacement = '',
             x = basename(dir)
           )) %>%
    purrr::map_dfr(.,
                   fread,
                   col.names = c('Time', 'Current'),
                   .id = 'Sample')
}
