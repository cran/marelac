\name{Constants}
\docType{data}
\alias{Constants}
\title{Useful physical and chemical constants}
\description{Physical and chemical constants useful for marine and lacustrine sciences}
\usage{Constants}
\format{
  a list with, for each constant the value, the units, and a description.
}
\author{Karline Soetaert <k.soetaert@nioo.knaw.nl>}
\examples{data.frame(cbind(acronym=names(Constants),
              matrix(ncol=3,byrow=TRUE,data=unlist(Constants),
              dimnames=list(NULL,c("value","units","description")))))
}
\references{to be filled...}
\keyword{datasets}


