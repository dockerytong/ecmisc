
#' Moving average smooth with varying window sizes
#'
#' @param x A column of data for processing
#'
#' @return
#' @export
#'
#' @examples
mav <- function(x)
{
  lseq <- function(from=1, to=100000, length.out=6) {
    # logarithmic spaced sequence
    # blatantly stolen from library("emdbook"), because need only this
    10^(seq(log10(from), log10(to), length.out = length.out))
  }

  frollmean(x = x,
            n = c(lseq(1,length(x)/1000,(as.integer(length(x)/100))),
                  lseq(length(x)/1000,length(x)/200,(as.integer(length(x)/20))),
                  lseq(length(x)/200,length(x)/5,(length(x) - as.integer(length(x)/100) - as.integer(length(x)/20)))),
            adaptive = TRUE
  )
}
