\name{vapor.hPa}
\alias{vapor.hPa}
\title{Vapor Pressure}
\description{
  The vapor pressure of water, in hPa.
}
\usage{vapor.hPa(t = 25)}
\arguments{
  \item{t }{Temperature, \eqn{^\circ}{degrees }C.}
}
\value{
  The vapor pressure of water, in hecto Pascal; valid for temperature of
   [-50,100] dgC.
}
\author{Karline Soetaert <karline.soetaert@nioz.nl>,
 Lorenz Meire <lorenz.meire@nioz.nl>}
\examples{
vapor.hPa(t = 25)
plot(0:30, vapor.hPa(t = 0:30), xlab = "Temperature, dgC", ylab = "hPa")
}
\references{
Lowe, P.R. and J.M. Ficke, 1974: The computation of saturation vapor pressure. Tech.
Paper No. 4-74, Environmental Prediction Research Facility, Naval Postgraduate School,
Monterey, CA, 27 pp.

\url{http://www.cactus2000.de/uk/unit/masshum.shtml}
}
\seealso{
\code{\link{vapor}}, \code{\link{air_spechum}}, \code{\link{air_density}},
\code{\link{gas_O2sat}}, \code{\link{gas_satconc}},
\code{\link{gas_schmidt}}, \code{\link{gas_solubility}},
\code{\link{gas_transfer}}, \code{\link{atmComp}}
}
\keyword{utilities}

