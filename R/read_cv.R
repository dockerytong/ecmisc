#' Read CV data
#'
#' @param dir directory where cv in
#'
#' @return
#' @export
#'
#' @examples
read_cv <- function(dir) {
    setNames(x,
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
