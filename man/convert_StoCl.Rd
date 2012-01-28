\name{convert_StoCl}
\alias{convert_StoCl}
\title{Salinity-Chlorinity Conversion}
\description{Estimates the chlorinity concentration based on salinity
}
\usage{convert_StoCl(S = 35)}
\arguments{
  \item{S }{salinity}
}
\value{
  The chlorinity concentration, g/kg
}
\author{Karline Soetaert <karline.soetaert@nioz.nl>}
\examples{
convert_StoCl(20)
}
\references{
Cox RA, Culkin F, Riley JP, 1967. The electrical
conductivity -- chlorinity relationship in natural seawater.
Deep--Sea Research 14, 203--220.
}
\seealso{
\code{\link{convert_AStoPS}}, \code{\link{convert_PStoAS}},
\code{\link{convert_RtoS}}, \code{\link{convert_StoR}},
\code{\link{convert_p}}, \code{\link{convert_T}},
}
\keyword{utilities}

