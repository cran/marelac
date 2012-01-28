\name{vapor}
\alias{vapor}
\title{Saturation Water Vapor Pressure}
\description{
  The partial pressure of water in saturated air (pH20/P), as in Weiss
  and Price (1980), where P is the total atmospheric pressure, (1
  atmosphere), and pH2O is the partial pressure of the water vapor.
}
\usage{vapor(S = 35, t = 25)}
\arguments{
  \item{S }{Salinity (-),}
  \item{t }{Temperature, \eqn{^\circ}{degrees }C.}
}
\value{
  The saturation vapor pressure (-).
}
\author{Karline Soetaert <karline.soetaert@nioz.nl>}

\examples{
plot(0:30, vapor(t = 0:30), xlab = "Temperature, dgC", ylab = "pH2O/P")
}
\references{
  Sarmiento JL and Gruber N, 2006. Ocean Biogeochemical
  Dynamics. Princeton University Press, Princeton. p 74

  Weiss R and Price BA, 1980. Nitrous oxide solubility in water and
  seawater. Mar. Chem. 8, 347-359.
}
\seealso{
\code{\link{gas_O2sat}}, \code{\link{gas_satconc}},
\code{\link{gas_schmidt}}, \code{\link{gas_solubility}},
\code{\link{gas_transfer}}, \code{\link{atmComp}}
}
\keyword{utilities}

