
# 自定义ggplot主题

pub_theme <-
  theme_classic() +
  theme(
    aspect.ratio = 1,
    axis.line = element_line(color = 'black', size = .25),
    axis.ticks = element_line(color = 'black', size = .25),
    axis.title = element_text(color = 'black', size = 10),
    axis.text = element_text(color = 'black', size = 8),
    strip.text = element_text(color = 'black', size = 8),
    strip.background = element_blank(),
    legend.background = element_blank(),
    legend.title = element_text(color = 'black', size = 8),
    legend.text = element_text(color = 'black', size = 8),
    legend.text.align = 0,
    panel.spacing = unit(0, 'mm'),
    plot.margin = margin(
      t = .25,
      b = .25,
      l = .25,
      r = .25,
      unit = 'cm'
    )
  )
