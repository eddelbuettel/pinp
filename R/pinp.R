#' PNAS-alike two-column journal format.
#'
#' Format suitable for attractive two-column pdf vignettes
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Additional arguments to \code{rmarkdown::pdf_document}
#'
#' @return R Markdown output format to pass to
#' \code{\link[rmarkdown:render]{render}}
#'
#' @examples
#' \dontrun{
#' library(rmarkdown)
#' draft("MyArticle.Rmd", template = "pinp", package = "pinp")
#' }
pinp <- function(..., keep_tex = TRUE) {
    file <- system.file("rmarkdown", "templates", "pdf", "resources", "template.tex", package="pinp")
    fmt <- rmarkdown::pdf_document(..., keep_tex = keep_tex, template = file)
    fmt$inherits <- "pdf_document"
    fmt
}

