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
#' rmarkdown::draft("MyArticle.Rmd", template = "pdf", package = "pinp")
#' rmarkdown::render("MyAricle.Rmd")
#' }
#'
#' @seealso
#' \code{\link[rticles]{pnas_article}}
#' @references
#' JJ Allaire, R Foundation, Hadley Wickham, Journal of Statistical Software, Yihui Xie, Ramnath
#' Vaidyanathan, Association for Computing Machinery, Carl Boettiger, Elsevier, Karl Broman,
#' Kirill Mueller, Bastiaan Quast, Randall Pruim, Ben Marwick, Charlotte Wickham, Oliver Keyes
#' and Miao Yu (2017). rticles: Article Formats for R Markdown. R package version 0.4.1.
#' \url{https://CRAN.R-project.org/package=rticles}
#'
#' JJ Allaire, Joe Cheng, Yihui Xie, Jonathan McPherson, Winston Chang, Jeff Allen, Hadley
#' Wickham, Aron Atkins, Rob Hyndman and Ruben Arslan (2017). rmarkdown: Dynamic Documents for R.
#' R package version 1.6. \url{https://CRAN.R-project.org/package=rmarkdown}
#'
#' Yihui Xie (2017). knitr: A General-Purpose Package for Dynamic Report Generation in R. R
#' package version 1.17.
pinp <- function(..., keep_tex = TRUE, citation_package = 'natbib') {

    template <- system.file("rmarkdown", "templates", "pdf", "resources", "template.tex",
                            package="pinp")
    base <- inherit_pdf_document(..., template = template,
                                 keep_tex = keep_tex, citation_package = citation_package)

    base$knitr$opts_chunk$prompt <- FALSE 	# changed from TRUE
    base$knitr$opts_chunk$comment <- '# '	# default to one hashmark
    base$knitr$opts_chunk$highlight <- TRUE  	# changed as well

    base$knitr$opts_chunk$dev.args <- list(pointsize = 11)
    base$knitr$opts_chunk$fig.width <- 4.9 # 6.125" * 0.8, as in template
    base$knitr$opts_chunk$fig.height <- 3.675 # 4.9 * 3:4
    base$knitr$opts_chunk$fig.align <- "center"

    if (!file.exists("pinp.cls"))
        file.copy(system.file("rmarkdown", "templates", "pdf", "skeleton", "pinp.cls",
                              package="pinp"))

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


