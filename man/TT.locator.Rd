% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/soiltexture.R
\name{TT.locator}
\alias{TT.locator}
\title{Interactive (mouse clic) retrieval the CLAY SILT SAND coordinate of points
on a texture triangle.}
\usage{
TT.locator(
  geo,
  css.names = NULL,
  text.tol = NULL,
  tri.sum.tst = NULL,
  tri.pos.tst = FALSE,
  set.par = FALSE,
  n = 512,
  type = "n",
  ...
)
}
\arguments{
\item{geo}{See \code{\link[soiltexture]{TT.plot}}}

\item{css.names}{See \code{\link[soiltexture]{TT.plot}}}

\item{text.tol}{See \code{\link[soiltexture]{TT.plot}}}

\item{tri.sum.tst}{See \code{\link[soiltexture]{TT.plot}}}

\item{tri.pos.tst}{See \code{\link[soiltexture]{TT.plot}}}

\item{set.par}{If TRUE parameters are set automatically to their defualt value}

\item{n}{Passed to \code{\link[graphics]{locator}}}

\item{type}{Passed to \code{\link[graphics]{locator}}}

\item{\dots}{Further argumets passed to locator()}
}
\description{
Interactive (mouse clic) retrieval the CLAY SILT SAND coordinate of points
on a texture triangle.
}
\author{
Julien Moeys [aut, cre], Wei Shangguan [ctb], Rainer Petzold [ctb],
Budiman Minasny [ctb], Bogdan Rosca [ctb], Nic Jelinski [ctb], Wiktor
Zelazny [ctb], Rodolfo Marcondes Silva Souza [ctb], Jose Lucas Safanelli
[ctb], Alexandre ten Caten [ctb]
}
