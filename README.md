## pinp [![Build Status](https://travis-ci.org/eddelbuettel/pinp.svg)](https://travis-ci.org/eddelbuettel/pinp) [![Package-License](http://img.shields.io/badge/license-GPL--3-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-3.0.html) [![CRAN](http://www.r-pkg.org/badges/version/pinp)](https://cran.r-project.org/package=pinp) [![Downloads](http://cranlogs.r-pkg.org/badges/pinp?color=brightgreen)](http://www.r-pkg.org/pkg/pinp)

Pinp is not PNAS

### Motivation

The template provided by the PNAS Article template in the
[rticles](https://cran.r-project.org/package=rticles) package makes it very easy and convenient to
create attractive looking two-column papers.

There were however a few changes we wanted to make such as the use of standard natbib citations,
more extended use of color, a different font as well as the removal of a number of PNAS-specific
title page items as well as general code and use simplification via a single LaTeX class file.  So
this _pinp_ package started.

### Example

A complete pdf example is provided [here](https://eddelbuettel.github.io/pinp/Rcpp-introduction.pdf)
by the new introductory [Rcpp](http://dirk.eddelbuettel.com/code/rcpp.html) vignette, which is
itself based on our [PeerJ Prepint](https://peerj.com/preprints/3188/).

A screenshot of the first two pages:

![](https://eddelbuettel.github.io/pinp/Rcpp-introduction-p1+2.png)

and the next two pages, showing a two-column figure

![](https://eddelbuettel.github.io/pinp/Rcpp-introduction-p3+4.png)

followed by pages five and six

![](https://eddelbuettel.github.io/pinp/Rcpp-introduction-p5+6.png)

and the final two pages:

![](https://eddelbuettel.github.io/pinp/Rcpp-introduction-p7+8.png)

### Status

The package is working, but not yet on [CRAN](https://cran.r-project.org/).

Some float placements are a little fragile in LaTeX two-column mode.  If in doubt, add more text
around it to aid the heuristic.

### Usage 

Use your favourite tool to install from GitHub, _e.g._,

```shell
$ installGithub.r eddelbuettel/pinp          # using a script from littler
```

and then use as a Markdown template via RStudio, or call `rmarkdown::render()` directly.

and then use as a Markdown template via RStudio, or use code such as

```r
library(rmarkdown)
draft("mypaper.Rmd", template="pdf", package="pinp", edit=FALSE)
render("mypaper.Rmd")
```     

### Requirements

Beyond the R package dependencies, a working `pandoc` binary is needed. RStudio installs
its own copy, otherwise do what is needed on your OS (_i.e._, something like `sudo apt-get
install pandoc pandoc-citeproc`).

The pdf mode requires a fairly complete LaTeX installation, and has been used on Ubuntu and macOS.
On Debian/Ubuntu, the following packages should provide a working set:

```
texlive-base
texlive-binaries
texlive-fonts-extra
texlive-fonts-recommended
texlive-generic-recommended
texlive-humanities
texlive-latex-base
texlive-latex-extra
texlive-latex-recommended
texlive-pictures
texlive-publishers
texlive-science
```

### Authors

Dirk Eddelbuettel and James Balamuta, leaning on the earlier work by JJ et al in the 
[rticles](https://cran.r-project.org/package=rticles) package.

The authors of the underlying [PNAS LaTeX Style](http://www.pnas.org/site/authors/latex.xhtml) are
not explicitedly listed, but [PNAS](http://www.pnas.org) refers to
[Overleaf](https://www.overleaf.com/).

### License

GPL-3 for this package, as well as the short code taken with grateful acknowledgements from the
[rticles](https://cran.r-project.org/package=rticles) package.

The main [PNAS LaTeX](http://www.pnas.org/site/authors/latex.xhtml) style
file (and supporting files) are under the
[LPPL (LaTeX Project Public License) version 1.3 or later](https://www.latex-project.org/lppl/).
