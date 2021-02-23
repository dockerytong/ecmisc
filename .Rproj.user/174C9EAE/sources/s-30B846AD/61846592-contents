#' read cv data
#'
#' @param x data filenames with full directory
#'
#' @return
#' @export
#'
#' @examples
read_cv <- function(x) {
    setNames(x,
             gsub(
               pattern = '\\.(txt)|(csv)',
               replacement = '',
               x = basename(x)
             )) %>%
    purrr::map_dfr(.,
                   fread,
                   col.names = c('Potential', 'Current'),
                   .id = 'Sample')
}
