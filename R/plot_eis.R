#' plot EIS data
#'
#' @param data EIS data for plot
#' @param type plot type desired, N for Nyquist plot and B for Bode plot, default as Nyquist
#' @param size point size, default as 1
#' @param asp plot aspect ratio default as 1
#' @param color point color, default as blue
#'
#' @return
#' @export
#'
#' @examples
plot_eis <- function(data, type = 'N', size = 1, color = 'blue', asp = 1) {
  if (type == 'N') {
    ggplot(data = data) +
      geom_point(aes(Re, -Im), shape = 21, size = size, color = color) +
      labs(x = 'Re (ohm)',
           y = '-Im (ohm)') +
      pub_theme(asp)
  } else if (type == 'B') {
    p1 <- ggplot(data = data) +
      geom_point(aes(Frequency,Magnitude),shape = 21,size = size, color = color) +
      scale_x_log10(
        breaks = scales::trans_breaks("log10", function(x) 10^x),
        labels = scales::trans_format("log10", scales::math_format(10^.x))
      ) +
      scale_y_log10(
        breaks = scales::trans_breaks("log10", function(x) 10^x),
        labels = scales::trans_format("log10", scales::math_format(10^.x))
      ) +
      labs(
        x = 'Frequency (Hz)',
        y = 'Magnitude (ohm)'
      ) +
      pub_theme(asp)
    p2 <- ggplot(data = data) +
      geom_point(aes(Frequency,-Phase),shape = 21,size = size, color = color) +
      scale_x_log10(
        breaks = scales::trans_breaks("log10", function(x) 10^x),
        labels = scales::trans_format("log10", scales::math_format(10^.x))
      ) +
      labs(
        x = 'Frequency (Hz)',
        y = '-Phase (degree)'
      ) +
      pub_theme(asp)
    p1+p2
  } else {
    echo('Wrong plot type input!')
  }
}
