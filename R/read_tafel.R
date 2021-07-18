#' Read Tafel data
#'
#' @param dir a string, where Tafel data in
#'
#' @return
#' @export
#'
#' @examples
read_tafel <- function(dir) {
  setNames(
    dir,
    gsub(
      pattern = "\\.(txt)|(csv)",
      replacement = "",
      x = basename(dir)
    )
  ) %>%
    purrr::map_dfr(.,
      fread,
      col.names = c("Potential", "Current", "log(i)"),
      .id = "Sample"
    )
}
