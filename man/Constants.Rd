\name{Constants}
\docType{data}
\alias{Constants}
\title{Useful Physical and Chemical Constants}
\description{
  Physical and chemical constants useful for aquatic sciences.
}
\usage{Constants}
\format{
  A list specifying the value, the units, and a description for each
  physical constant.
}
\author{Karline Soetaert <k.soetaert@nioo.knaw.nl>}
\examples{

data.frame(cbind(acronym = names(Constants),
           matrix(ncol = 3, byrow = TRUE, data = unlist(Constants),
           dimnames = list(NULL, c("value", "units", "description")))))
}
\references{
  Mohr PJ and Taylor BN, 2005.
  CODATA recommended values of the fundamental physical constants: 2002,
  Review of Modern Physics 77, 1 - 107.
}
\seealso{
\code{\link{AtomicWeight}}, \code{\link{Bathymetry}},
\code{\link{Oceans}}
}

\keyword{datasets}
