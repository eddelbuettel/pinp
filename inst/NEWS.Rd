\name{NEWS}
\title{News for Package \pkg{pinp}}
\newcommand{\ghpr}{\href{https://github.com/eddelbuettel/pinp/pull/#1}{##1}}
\newcommand{\ghit}{\href{https://github.com/eddelbuettel/pinp/issues/#1}{##1}}

\section{Changes in tint version 0.0.2 (2017-09-20)}{
  \itemize{
    \item The YAML segment can be used to select font size, one-or-two
    column mode, one-or-two side mode, linenumbering and watermarks
    (\ghpr{21} and \ghpr{26} addressing \ghit{25})
    \item If \code{pinp.cls} or \code{jss.bst} are not present, they are
    copied in ((\ghpr{27} addressing \ghit{23})
    \item Output is now in shaded framed boxen too (\ghpr{29} addressing
    \ghit{28})
    \item Endmatter material is placed in \code{template.tex} (\ghpr{31}
    addressing \ghit{30})
    \item Expanded documentation of YAML options in \code{skeleton.Rmd}
    and clarified available one-column option (\ghpr{32}).
    \item Section numbering can now be turned on and off (\ghpr{34})
    \item The default bibliography style was changed to \code{jss.bst}.
    \item A short explanatory vignette was added.
  }
}

\section{Changes in tint version 0.0.1 (2017-09-15)}{
  \itemize{
    \item Initial CRAN release
  }
}
