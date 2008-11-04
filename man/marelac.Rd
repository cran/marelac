\name{marelac-package}
\alias{marelac-package}
\alias{marelac}
\docType{package}
\title{
Datasets, constants, conversion factors, and utilities for the marine and lacustrine
sciences
}
\description{
R-package marelac has been designed as a tool for use by scientists working in the marine and
lacustrine sciences.

It contains:

\item data sets. These are mainly used in the lecture notes "Using R for scientific computing", written
as an introduction to R for students that follow our course in ecological modelling.

\item chemical and physical constants, e.g. atomic weights, gas constants.

\item conversion factors, e.g. from salinity to chlorinity, from mol to gram, etc..

\item functions, e.g. to estimate concentrations of conservative substances as a function of salinity, ...

}
\details{
  \tabular{ll}{
    Package: \tab marelac\cr
    Type: \tab Package\cr
    Version: \tab 1.2\cr
    Date: \tab 2008-11-031\cr
    License: \tab GNU Public License 2 or above\cr
  }

The package contains lecture notes for novice R-users. These have been written as
an introduction to \R , to prepare our students for the ecological modelling course
(given by K. Soetaert and F. Meysman) in which \R is used to implement and solve the
models.

To open the lecture notes, copy-paste this sentence to R:

\code{browseURL(paste(system.file(package="marelac"), "/lecture/UsingR.pdf", sep=""))}

which will open a PDF generated with WORD (microsoft)

or type \code{vignette("UsingR")} which will open a LaTeX-generated file.
}
\author{
  Karline Soetaert (Maintainer)
  
  Filip Meysman
}
%\references{
%% to be filled
%}

\examples{
\dontrun{
## show examples (see respective help pages for details)
example(Bathymetry)
example(Constants)
example(SCOC)
example(mol.vol)

## open the directory with documents
browseURL(paste(system.file(package="marelac"), "/doc", sep=""))


## show document with the introduction to R - one file, a pdf generated with WORD:
browseURL(paste(system.file(package="marelac"), "/lecture/UsingR.pdf", sep=""))

## the introduction to R - a vignette
vignette("UsingR")

## and the answers
vignette("Answers")

edit(vignette("UsingR"))
edit(vignette("Answers"))

}
}

\keyword{ package }