#' PNAS journal format.
#'
#' Format for creating submissions to PNAS journals.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Additional arguments to \code{rmarkdown::pdf_document}
#'
#' @return R Markdown output format to pass to
#'   \code{\link[rmarkdown:render]{render}}
#'
#' @examples
#' \dontrun{
#' library(rmarkdown)
#' draft("MyArticle.Rmd", template = "pnas_article", package = "rticles")
#' }
rcpp_vig <- function(..., keep_tex = TRUE) {

    fmt <- rmarkdown::pdf_document(...,
                                   keep_tex = keep_tex,
                                   template = system.file("rmarkdown", "templates", "pdf",
                                                          "resources", "template.tex",
                                                          package="rcppvig"))

    fmt$inherits <- "pdf_document"
    fmt
}

