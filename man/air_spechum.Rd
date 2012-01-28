\name{air_spechum}
\alias{air_spechum}
\title{Air specific humidity}
\description{
  The specific humidity of air (mass mixing ratio in wet air), in kg/kg
}
\usage{air_spechum(t = 25, rh = 50, P = 1.013253)
}
\arguments{
  \item{t }{Temperature, \eqn{^\circ}{degrees }C.}
  \item{rh }{Relative humidity, \%}
  \item{P }{True pressure, bar}
}
\value{
  The specific humidity, in kg/kg.
}
\author{Karline Soetaert <karline.soetaert@nioz.nl>,
 Lorenz Meire <lorenz.meire@nioz.nl>}
\examples{
air_spechum(t = 25, rh = 50)*1000     # 9.7778
plot(0:30, air_spechum(t = 0:30), xlab = "Temperature, dgC", ylab = "kg/kg")
plot(0:100, air_spechum(rh = 0:100), xlab = "percent humidity", ylab = "kg/kg")
}
\references{
Lowe, P.R. and J.M. Ficke, 1974: The computation of saturation vapor pressure. Tech.
Paper No. 4-74, Environmental Prediction Research Facility, Naval Postgraduate School,
Monterey, CA, 27 pp.

\url{http://www.cactus2000.de/uk/unit/masshum.shtml}
}
\seealso{
\code{\link{vapor}}, \code{\link{air_density}},
\code{\link{gas_O2sat}}, \code{\link{gas_satconc}},
\code{\link{gas_schmidt}}, \code{\link{gas_solubility}},
\code{\link{gas_transfer}}, \code{\link{atmComp}}
}
\keyword{utilities}

