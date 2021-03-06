% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/autolink_html.R
\name{autolink_html}
\alias{autolink_html}
\title{Automatically link references and articles in an HTML page}
\usage{
autolink_html(input, output = input, local_packages = character())
}
\arguments{
\item{input, output}{Input and output paths for HTML file}

\item{local_packages}{A named character vector providing relative paths
(value) to packages (name) that can be reached with relative links
from the target HTML document.}
}
\description{
The autolinker is built around two XPath expressions:
\itemize{
\item \verb{//pre[contains(@class, 'r')]}:
this finds all \verb{<div>}s with class \code{sourceCode} and \code{r}. The contents
must be syntax-highlighted using \href{http://pygments.org/}{pygments}.
(This is default in \code{\link[rmarkdown:html_document]{rmarkdown::html_document()}} when \code{theme = NULL}.)
\item \verb{.//code[count(*) = 0]}: this finds all \verb{<code>} that contain only
text (and no other tags).
}
}
\details{
Currently the following expressions are linked:
\itemize{
\item Function calls, \code{foo()}
\item Function calls qualified with the package name, \code{bar::foo()}
\item Symbols qualified with the package name, \code{bar::baz}
\item \code{library()}, \code{require()} and \code{requireNamespace()} calls.
\item Help calls, \code{?foo}, \code{package?foo}, \code{?bar::foo}, \code{help(foo)},
\code{help(foo, package = bar)}, \code{help(package = bar)}.
\item Vignette calls, \code{vignette(baz)}, \code{vignette(baz, package = "bar")}
}

Calls to \code{library()} and \code{require()} are used to find the topics connected
to unqualified references.
}
\examples{
\dontrun{
autolink_html("path/to/file.html",
  local_packages = c(
    shiny = "shiny",
    shinydashboard = "shinydashboard"
  )
)
}
}
