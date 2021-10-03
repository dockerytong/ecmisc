

#' A ggplot2 theme for thesis
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
thesis_theme <- function(...) {
  ggplot2::theme_bw() +
    ggplot2::theme(
      axis.title = element_text(size  = 10, color = 'black'),
      axis.text = element_text(size = 8, color = 'black'),
      panel.grid.major = element_line(linetype = 'dashed', size = 0.1),
      panel.grid.minor = element_blank(),
      panel.border = element_rect(
        fill = NA,
        linetype = 'solid',
        size = .2,
        color = 'black'
      ),
      panel.spacing = unit(0.5, 'lines'),
      axis.ticks.x.bottom = element_line(
        color = 'black',
        size = 0.2,
        linetype = 'solid'
      ),
      axis.ticks.y.left = element_line(
        color = 'black',
        size = 0.2,
        linetype = 'solid'
      ),
      strip.background = element_blank(),
      strip.text = element_text(
        color = 'black',
        size = 9,
        hjust = 0,
        face = 'bold'
      ),
      legend.background = element_rect(fill = NA),
      legend.key.size = unit(0.5, 'lines'),
      legend.title = element_text(color = 'black', size = 9),
      legend.text = element_text(color = 'black', size = 8),
      legend.justification = c('right', 'top'),
      legend.margin = margin(
        t = 0,
        r = 0,
        b = 0,
        l = 0
      ),
      legend.spacing.y = unit(0.1, 'lines'),
      ...
    )
}
