\name{NEWS}
\title{News for Package \pkg{pinp}}
\newcommand{\ghpr}{\href{https://github.com/eddelbuettel/pinp/pull/#1}{##1}}
\newcommand{\ghit}{\href{https://github.com/eddelbuettel/pinp/issues/#1}{##1}}

\section{Changes in pinp version 0.0.7 (2019-01-11)}{
  \itemize{
    \item Added some more documentation for different YAML header fields.
    \item A new option has been added for a 'date_subtitle' (Ilya
    Kashnitsky in \ghpr{64} fixing \ghit{63}).
    \item 'doi' YAML option renamed to 'doi_footer' to permit DOIs in
    refs, 'doi' header still usable (Dirk in \ghpr{66} fixing \ghit{65}). 
    \item The 'doi' macro was redefined to create a hyperlink.
  }
}

\section{Changes in pinp version 0.0.6 (2018-07-16)}{
  \itemize{
    \item Added YAML header option 'papersize' (Saghir Bashir in \ghpr{54}
    and \ghpr{58} fixing \ghit{24}).
    \item Added YAML header option 'collapse' with default 'false'
    (\ghpr{59}).
  }
}

\section{Changes in pinp version 0.0.5 (2018-06-08)}{
  \itemize{
    \item \code{pandoc} version 2 or later, in its wisdom, no longer
    lets us embed a bibliography in the header, so the vignette was
    altered by a CRAN request
  }
}

\section{Changes in pinp version 0.0.4 (2017-11-04)}{
  \itemize{
    \item Correct NEWS headers from 'tint' to 'pinp' (\ghit{45}).
    \item New front-matter variables \sQuote{skip_final_break} skips the
    \code{pnasbreak} on final page which back as default (\ghpr{47}).
    \item Support option to collapse code and result blocks.
  }
}

\section{Changes in pinp version 0.0.3 (2017-10-28)}{
  \itemize{
    \item Section 'Acknowledgements' now conditional on a frontmatter
    setting, section 'Matmethods' has been removed, \code{pnasbreak} 
    no longer used which stabilizes LaTeX float formatting. References
    are now shown in the column just like other content (Dirk in \ghpr{36}). 
    \item Vignette now uses new numbered sections frontmatter switch
    which improves the pdf outline.
    \item New front-matter options for title/section header colors, and
    link colors (Dirk in \ghpr{39}).
    \item YAML frontmater options are now documented in the help page
    for \code{pinp} as well (Dirk in \ghpr{41}).
    \item Some typos were fixed (Michael in \ghpr{42} and \ghpr{43}).
  }
}

\section{Changes in pinp version 0.0.2 (2017-09-20)}{
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

\section{Changes in pinp version 0.0.1 (2017-09-15)}{
  \itemize{
    \item Initial CRAN release
  }
}
