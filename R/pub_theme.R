
#' A ggplot2 theme for journal article
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
#'
pub_theme <- function(...) {
  ggplot2::theme_classic() +
    ggplot2::theme(
      axis.line = element_line(color = "black", size = .25),
      axis.ticks = element_line(color = "black", size = .25),
      axis.title = element_text(color = "black", size = 10),
      axis.text = element_text(color = "black", size = 8),
      strip.text = element_text(color = "black", size = 8, hjust = 0),
      strip.background = element_blank(),
      legend.background = element_blank(),
      legend.title = element_text(color = "black", size = 8),
      legend.text = element_text(color = "black", size = 8),
      legend.text.align = 0,
      panel.spacing = unit(2, "mm"),
      plot.margin = margin(
        t = 5,
        b = 5,
        l = 5,
        r = 5
      ),
      ...
    )
}
