#' Read LSV data
#'
#' @param dir directory where lsv in
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
                   col.names = c('Potential', 'Current'),
                   .id = 'Sample')
}
