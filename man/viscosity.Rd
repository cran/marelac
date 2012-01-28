\name{viscosity}
\alias{viscosity}
\title{Shear Viscosity of Water}
\description{
  Calculates the shear viscosity of water, in centipoise (g/m/sec).
  Valid for 0 < t < 30 \eqn{^\circ}{degrees }C, 0 < S < 36, 1
  < P < 1000 bars.

  Based on the code "CANDI" by B.P. Boudreau
}
\usage{
viscosity(S = 35, t = 25, P = 1.013253)
}
\arguments{
  \item{S }{salinity, -,
  }
  \item{t }{temperature, \eqn{^\circ}{degrees }C,
  }
  \item{P }{True pressure, bar.
  }
}
\value{
  Shear visocisity in centipoise.
}
\author{Karline Soetaert <karline.soetaert@nioz.nl>}

\examples{
plot(0:30, viscosity(t = 0:30, S = 35, P = 1),
      xlab = "temperature", ylab = "g/m/s",
      main = "shear viscosity of water", type = "l")
lines(0:30, viscosity(t = 0:30, S = 0, P = 1), col = "red")
lines(0:30, viscosity(t = 0:30, S = 35, P = 100), col = "blue")
legend("topright", col = c("black","red","blue"), lty = 1,
        legend = c("S=35, P=1", "S=0, P=1", "S=35, P=100"))
}
\references{
  Based on the FORTRAN implementation of the diagenetic model "CANDI" of
  B.P. Boudreau:

  Boudreau BP, 1996. A method-of-lines code for carbon and
  nutrient diagenesis in aquatic sediments.  Computers & Geosciences 22
  (5), 479-496.

  Kulkula DJ, Gebhart B and Mollendorf JC, 1987. Thermodynamic and
  transport properties of pure and saline water. Adv. Heat transfer 18,
  325-363.
}
\details{
  The details given in the original code by B. Boudreau are repeated here:

  Uses the equation given by Kukulka et al. (1987).
}
\seealso{
\code{\link{coriolis}},
\code{\link{diffcoeff}}, \code{\link{ssd2rad}}, \code{\link{vertmean}},
\code{\link{gravity}}
}
\keyword{utilities}

