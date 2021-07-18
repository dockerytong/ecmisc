#' plot tafel data
#'
#' @param data data used for plot
#' @param color color for different samples
#' @param asp aspect ratio of plot
#'
#' @return
#' @export
#'
#' @examples
plot_tafel <- function(data, color = "Sample", asp = 1) {
  p <- ggplot(data) +
    geom_path(aes(x = Potential, y = `log(i)`, color = .data[[color]])) +
    labs(
      x = "Potential (V) vs SCE",
      y = "log(i) (A)"
    ) +
    pub_theme(asp)
  return(p)
}
