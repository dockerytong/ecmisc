
#' Customed ggplot theme for publication
#'
#' @param asp control the aspect ratio of plot, default to 1.
#'
#' @return
#' @export
#'
#' @examples
pub_theme <- function(asp = 1, legend.position = c(.5,.5)) {
  theme_classic() +
    theme(
      aspect.ratio = asp,
      axis.line = element_line(color = "black", size = .25),
      axis.ticks = element_line(color = "black", size = .25),
      axis.title = element_text(color = "black", size = 10),
      axis.text = element_text(color = "black", size = 8),
      strip.text = element_text(color = "black", size = 8),
      strip.background = element_blank(),
      legend.background = element_blank(),
      legend.position = legend.position,
      legend.title = element_text(color = "black", size = 8),
      legend.text = element_text(color = "black", size = 8),
      legend.text.align = 0,
      panel.spacing = unit(2, "mm"),
      plot.margin = margin(
        t = .25,
        b = .25,
        l = .25,
        r = .25,
        unit = "cm"
      )
    )
}
