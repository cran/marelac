\name{convert_StoR}
\alias{convert_StoR}
\title{Salinity-Conductivity Conversion}
\description{
  Estimates the conductivity ratio from salinity, temperature and
  pressure.

  The equation is valid over ranges of temperature from -2 to 35
  \eqn{^\circ}{degrees }C, pressure of 0 - 1000 bar and salinity 2-42
  in the world ocean.
}
\usage{
convert_StoR(S = 35, t = 25, p = max(0, P-1.013253), P = 1.013253)
}
\arguments{
  \item{S }{(practical) Salinity, -,}
  \item{t }{Temperature, \eqn{^\circ}{degrees }C,}
  \item{P }{True Pressure, bar,}
  \item{p }{Gauge (or applied) pressure, the pressure referenced against the local
    atmospheric pressure, bar.}
}
\value{
  The conductivity ratio (-), this is the conductivity at (S, t, p),
  divided by the conductivity at S = 35, t = 15, p = 0.
}
\note{
  Pressure here is true pressure, 1 bar (at sea surface), in contrast to
  hydrostatic pressure in dbar of original formula.

  The conductivity ratio for Salinity = 40, t = 40, \code{p} =
  1000 is 1.888091.
}

\author{Karline Soetaert <karline.soetaert@nioz.nl>}
\examples{
convert_StoR(S = 40, t = 40, p = 1000)

convert_StoR(S = 35, t = 15, p = 0)

# Check values:
convert_StoR(S = 25, t = 10, p = 0)    #  0.654990
convert_StoR(S = 25, t = 10, p = 100)  #  0.662975
convert_StoR(S = 25, t = 10, p = 1000) #  0.712912

convert_StoR(S = 35, t = 10, p = 100) #  0.897778
convert_StoR(S = 40, t = 10, p = 100) #  1.011334

}
\seealso{
\code{\link{convert_AStoPS}}, \code{\link{convert_PStoAS}},
\code{\link{convert_RtoS}},
\code{\link{convert_StoCl}},
\code{\link{convert_p}}, \code{\link{convert_T}},
}
\references{
  Fofonoff NP and Millard RC Jr, 1983. Algorithms for computation of
  fundamental properties of seawater. UNESCO technical papers in marine
  science, 44, 53 pp.\cr
  \url{http://unesdoc.unesco.org/images/0005/000598/059832EB.pdf}
}
\keyword{utilities}

