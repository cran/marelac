\name{air_density}
\alias{air_density}
\title{Air Density}
\description{
  The density of the air, in kg/m3
}
\usage{air_density(t = 25, P = 1.013253)
}
\arguments{
  \item{t }{Temperature, \eqn{^\circ}{degrees }C.}
  \item{P }{True pressure, bar}
}
\value{
  The air density, in kg/m3
}
\author{Karline Soetaert <karline.soetaert@nioz.nl>,
 Lorenz Meire <lorenz.meire@nioz.nl>}
\examples{
air_density(t = 25) # 1.183894
plot(0:30, air_density(t = 0:30), xlab = "Temperature, dgC", ylab = "kg/m3")
plot(x= seq(0.8,1.2, 0.01), y = air_density(P = seq(0.8,1.2, 0.01)),
     xlab = "pressure, bar", ylab = "kg/m3")
}
\references{
\url{http://www.cactus2000.de/uk/unit/masshum.shtml}
}
\seealso{
\code{\link{vapor}}, \code{\link{air_spechum}},
\code{\link{gas_O2sat}}, \code{\link{gas_satconc}},
\code{\link{gas_schmidt}}, \code{\link{gas_solubility}},
\code{\link{gas_transfer}}, \code{\link{atmComp}}
}
\keyword{utilities}

