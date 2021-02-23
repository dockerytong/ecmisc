#' plot EIS data
#'
#' @param data EIS data for plot
#' @param type plot type desired, N for Nyquist plot and B for Bode plot, default as Nyquist
#' @param size point size, default as 1
#' @param asp aspect ratio of plot
#' @param color point color, default as blue
#'
#' @return
#' @export
#'
#' @examples
plot_eis <- function(data, type = 'N', size = 1, asp = 1, color = 'Sample') {
  p <- ggplot(data = data) + pub_theme(asp)
  if (type == 'N') {
    p + geom_point(
      aes(x = Re,y = -Im, color = .data[[color]]),
      shape = 21,
      size = size) +
      labs(
        x = 'Re (ohm)',
        y = '-Im (ohm)'
      )
  } else if (type == 'B') {
    p1 <- p + geom_point(aes(x = Frequency, y = Magnitude, color = .data[[color]]),
      shape = 21,
      size = size) +
      scale_x_log10(
        breaks = scales::trans_breaks("log10", function(x)
          10 ^ x),
        labels = scales::trans_format("log10", scales::math_format(10 ^ .x))
      ) +
      scale_y_log10(
        breaks = scales::trans_breaks("log10", function(x)
          10 ^ x),
        labels = scales::trans_format("log10", scales::math_format(10 ^ .x))
      ) +
      labs(x = 'Frequency (Hz)',
           y = 'Magnitude (ohm)')

    p2 <- p +
      geom_point(
        aes(x = Frequency, y = -Phase, color = .data[[color]]),
        shape = 21,
        size = size) +
      scale_x_log10(
        breaks = scales::trans_breaks("log10", function(x) 10^x),
        labels = scales::trans_format("log10", scales::math_format(10^.x))
      ) +
      labs(
        x = 'Frequency (Hz)',
        y = '-Phase (degree)'
      )

    p <- p1 + p2 + plot_layout(guides = 'collect')
    p
  }
}
