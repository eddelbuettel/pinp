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
#' @param collapse A boolean toggle to enable the \code{\link{knitr}}
#' option \code{collapse}, defaults to \code{FALSE}
#' @return R Markdown output format to pass to
#' \code{\link[rmarkdown:render]{render}}
#'
#' @section Document options: Various aspects of pdf document can be
#' customized by setting either standard \pkg{rmarkdown} options,
#' or any of the following options (which are shown in
#' alphabetical order) in the document metadata:
#'
#' \describe{
#'   \item{\code{abstract}}{(Optional but recommended) A free-format
#'   abstract summarizing the document.}
#'   \item{\code{acknowledgements}}{(Optional) A free-format entry
#'   which will be placed at the end of the document.}
#'   \item{\code{address}}{(Mandatory) YAML list with entries for
#'   \code{code} and \code{address}.  The former matches the
#'   \code{affiliation} field of the \code{author} entry; the letter
#'   can be a free-format text giving, say, department and university
#'   along with an email address.}
#'   \item{\code{author}}{(Mandatory) YAML list with entries for
#'   \code{name} and \code{affiliation}.  The latter is matched to the
#'   \code{code} entry in \code{address} option.}
#'   \item{\code{bibliography}}{(Optional) Name of a \code{.bib} file,
#'   suffix can be omitted; defaut is no bibliography.}
#'   \item{\code{doi}}{(Optional but recommended) A free-format entry
#'   suitable for a doi or url referencing the document or its
#'   underlying code.}  \item{\code{fontsize}}{(Optional) Document
#'   fontsize, default is 9pt.}
#'   \item{\code{footer_contents}}{(Optional) A free-format entry for
#'   text placed in the footer, useful to associate with a package or
#'   volume, default is \sQuote{Package Vignette}.}
#'   \item{\code{headercolor}}{(Optional) Color code (in hexadecimal
#'   notation) for the title and section headers, default is blue tone
#'   matching the R logo: \code{185FAF}.}
#'   \item{\code{keywords}}{(Optional) Keywords describing the
#'   document, supplied as a list.}
#'   \item{\code{lead_author_surnames}}{(Optional but recommended) A
#'   free-format entry for a short author description placed in the
#'   footer.}  \item{\code{lineno}}{(Optional) Logical value to select
#'   line number display, may only work in one-column mode, default is
#'   false.}  \item{\code{linkcolor}}{(Optional) Color code (in
#'   hexadecimal notation) for the urls and reference links, default
#'   is a light blue tone from the PNAS style: \code{000065}.}
#'   \item{\code{numbersections}}{(Optional) Logical value to select
#'   numbered section headers, default is false.}
#'   \item{\code{one_column}}{(Optional) Logical value to select
#'   one-column mode, default is false.}
#'   \item{\code{one_sided}}{(Optional) Logical value to select
#'   one-sided format, default is false.}
#'   \item{\code{output}}{(Mandatory) Entry to tell \code{rmarkdown}
#'   to render via \code{pinp}; must be \code{pinp::pinp}.}
#'   \item{\code{secnumdepth}}{(Optional) Level of (LaTeX) section
#'   levels to number, default is 5.}
#'   \item{\code{skip_final_break}}{(Optional) Logical value to skip a
#'   final (force) page that is part of the PNAS style, default is
#'   false i.e. break is inserted as with PNAS.}
#'   \item{\code{title}}{(Mandatory) document title, no default.}
#'   \item{\code{watermark}}{(Optional) Logical value to select a
#'   \sQuote{Draft} watermark to be added (though figures tend to
#'   render above it, default is false.}  }
#'
#' The vignette source shows several of these options in use, and also
#' describes some of the options.
#'
#' @examples
#' \dontrun{
#' rmarkdown::draft("MyArticle.Rmd", template = "pdf", package = "pinp")
#' rmarkdown::render("MyArticle.Rmd")
#' }
#'
#' @seealso
#' \code{\link[rticles]{pnas_article}}
#'
#' @references
#' JJ Allaire, R Foundation, Hadley Wickham, Journal of Statistical
#' Software, Yihui Xie, Ramnath Vaidyanathan, Association for
#' Computing Machinery, Carl Boettiger, Elsevier, Karl Broman, Kirill
#' Mueller, Bastiaan Quast, Randall Pruim, Ben Marwick, Charlotte
#' Wickham, Oliver Keyes and Miao Yu (2017). rticles: Article Formats
#' for R Markdown. R package version 0.4.1.
#' \url{https://CRAN.R-project.org/package=rticles}
#'
#' JJ Allaire, Joe Cheng, Yihui Xie, Jonathan McPherson, Winston
#' Chang, Jeff Allen, Hadley Wickham, Aron Atkins, Rob Hyndman and
#' Ruben Arslan (2017). rmarkdown: Dynamic Documents for R.  R package
#' version 1.6. \url{https://CRAN.R-project.org/package=rmarkdown}
#'
#' Yihui Xie (2017). knitr: A General-Purpose Package for Dynamic
#' Report Generation in R. R package version 1.17.
pinp <- function(..., keep_tex = TRUE, citation_package = 'natbib', collapse = FALSE) {

    template <- system.file("rmarkdown", "templates", "pdf", "resources", "template.tex",
                            package="pinp")
    base <- inherit_pdf_document(..., template = template,
                                 keep_tex = keep_tex,
                                 citation_package = citation_package)

    base$knitr$opts_chunk$prompt <- FALSE 	# changed from TRUE
    base$knitr$opts_chunk$comment <- '# '	# default to one hashmark
    base$knitr$opts_chunk$highlight <- TRUE  	# changed as well

    base$knitr$opts_chunk$collapse <- collapse 	# allow override

    base$knitr$opts_chunk$dev.args <- list(pointsize = 9)  # from 11
    base$knitr$opts_chunk$fig.width <- 3.5 	# from 4.9 # 6.125" * 0.8, as in template
    base$knitr$opts_chunk$fig.height <- 3.5	# from 3.675 # 4.9 * 3:4
    base$knitr$opts_chunk$fig.align <- "center"

    hook_output <- function(x, options) {
        paste('\\begin{ShadedResult}\n\\begin{verbatim}\n', x,
              '\\end{verbatim}\n\\end{ShadedResult}\n', sep = '')
    }
    if (!collapse) base$knitr$knit_hooks$output  <- hook_output
    base$knitr$knit_hooks$message <- hook_output
    base$knitr$knit_hooks$warning <- hook_output

    for (f in c("pinp.cls", "jss.bst"))
        if (!file.exists(f))
            file.copy(system.file("rmarkdown", "templates", "pdf", "skeleton", f, package="pinp"),
                      ".")

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


