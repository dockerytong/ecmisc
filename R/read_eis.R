#' Read EIS data
#'
#' @param dir
#'
#' @return
#' @export
#'
#' @examples
read_eis <- function(dir) {
  setNames(
    dir,
    gsub(
      pattern = "\\.(txt)|(csv)",
      replacement = "",
      x = basename(dir)
    )
  ) %>%
    purrr::map_dfr(
      .,
      fread,
      col.names = c("Frequency", "Re", "Im", "Magnitude", "Phase"),
      .id = "Sample"
    )
}
