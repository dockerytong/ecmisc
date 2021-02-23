#' plot cv
#'
#' @param data data used for plot
#' @param color color for different sample
#' @param asp aspect ratio of plot
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
plot_cv <- function(data, color = 'Sample', asp = 1, ...) {
  p <- ggplot(data) +
    geom_path(
      aes(x = Potential, y = Current, color = .data[[color]]),...) +
    labs(
      x = 'Potenial (V) vs SCE',
      y = 'Current (A)'
    ) +
    pub_theme(asp)
  return(p)
}
