
#' @title Calculate and generate 2D COS with corr2D and ggplot2
#'
#' @param x input matrix for 2D COS calculation
#' @param type Re for Synchronous and Im for asynchronous 2D correlation spectra
#'
#' @return
#' @export
#'
#' @examples
plot_corr <- function(x, type = 'Re') {
  # 计算相关性矩阵
  corr2D::corr2d(Mat1 = x) -> d1
  # 求同步矩阵
  d1$FT %>% Re() %>% as.data.frame() -> d2
  colnames(d2) <- d1$Wave1
  rownames(d2) <- d1$Wave2
  # 求异步矩阵
  d1$FT %>% Im() %>% as.data.frame() -> d3
  colnames(d3) <- d1$Wave1
  rownames(d3) <- d1$Wave2
  # 绘图
  if (type == 'Re') {
    # plot（Re是同步）
    plot <-  d2 %>%
      tibble::rownames_to_column() %>%
      tidyr::pivot_longer(., cols = -1) %>%
      dplyr::mutate_all(., function(x) as.numeric(x)) %>%
      ggplot(data = .,aes(x = rowname, y = name, z = value)) +
      # geom_contour_filled(bins = 30) +
      geom_contour(aes(colour = after_stat(level)),show.legend = FALSE, bins = 30) +
      geom_abline(slope = 1, color = 'white') +
      scale_color_gradient2(low = 'blue', high = 'red', midpoint = 0) +
      # scale_color_steps2 (low = "blue", mid = "white", high = "brown", midpoint = 0, space = "Lab")+
      # scale_color_gradientn(colours = pal)+
      geom_raster(aes(fill=value), show.legend = FALSE, interpolate = TRUE, alpha=.8)+
      # scale_fill_gradientn(colours = pal)+
      # scale_fill_steps2 (low = "blue", mid = "white", high = "darkred", midpoint = 0, space = "Lab")+
      scale_fill_gradient2(low = 'blue', high = 'red', midpoint = 0) +
      # geom_contour(colour = 'black', alpha=.2) +
      pub_theme() +
      theme(
        legend.position = 'none'
      )
  } else {

    # plot(只要不输入Re就是异步)
    plot <-  d3 %>%
      tibble::rownames_to_column() %>%
      tidyr::pivot_longer(., cols = -1) %>%
      dplyr::mutate_all(., function(x) as.numeric(x)) %>%
      ggplot(data = .,aes(x = rowname, y = name, z = value)) +
      # geom_contour_filled(bins = 30) +
      geom_contour(aes(colour = after_stat(level)), bins = 30) +
      geom_abline(slope = 1, color = 'white') +
      scale_color_gradient2(low = 'blue', high = 'red', midpoint = 0) +
      # scale_color_steps2 (low = "blue", mid = "white", high = "brown", midpoint = 0, space = "Lab")+
      # scale_color_gradientn(colours = pal)+
      geom_raster(aes(fill=value), show.legend = FALSE, interpolate = TRUE, alpha=.8)+
      # scale_fill_gradientn(colours = pal)+
      # scale_fill_steps2 (low = "blue", mid = "white", high = "darkred", midpoint = 0, space = "Lab")+
      scale_fill_gradient2(low = 'blue', high = 'red', midpoint = 0) +
      # geom_contour(colour = 'black') +
      pub_theme() +
      theme(
        legend.position = 'none'
      )
  }
  return(plot)
}
