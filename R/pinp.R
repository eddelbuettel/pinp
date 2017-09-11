#' PNAS-alike two-column journal format.
#'
#' Format suitable for attractive two-column pdf vignettes
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Additional arguments to \code{rmarkdown::pdf_document}
#' @param keep_tex A boolean toggle to select whether intermediate
#' LaTeX files are to be kept, defaults to \code{TRUE}
#' @param citation_package A character variable selecting the LaTeX
#' citation package; defaults to \code{natbib}.
#' @return R Markdown output format to pass to
#' \code{\link[rmarkdown:render]{render}}
#'
#' @examples
#' \dontrun{
#' library(rmarkdown)
#' draft("MyArticle.Rmd", template = "pinp", package = "pinp")
#' }
pinp <- function(..., keep_tex = TRUE, citation_package = 'natbib') {

    template <- system.file("rmarkdown", "templates", "pdf", "resources", "template.tex",
                            package="pinp")
    base <- inherit_pdf_document(
        ..., template = template, keep_tex = keep_tex, citation_package = citation_package
    )

    base$knitr$opts_chunk$prompt <- FALSE # TRUE
    base$knitr$opts_chunk$comment <- NA
    base$knitr$opts_chunk$highlight <- TRUE  # changed

    base$knitr$opts_chunk$dev.args <- list(pointsize = 11)
    base$knitr$opts_chunk$fig.width <- 4.9 # 6.125" * 0.8, as in template
    base$knitr$opts_chunk$fig.height <- 3.675 # 4.9 * 3:4
    base$knitr$opts_chunk$fig.align <- "center"

    base
}


# Call rmarkdown::pdf_documet and mark the return value as inheriting pdf_document
inherit_pdf_document <- function(...) {
    fmt <- rmarkdown::pdf_document(...)
    fmt$inherits <- "pdf_document"
    fmt
}

knitr_fun <- function(name) utils::getFromNamespace(name, 'knitr')

output_asis <- knitr_fun('output_asis')


