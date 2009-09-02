\name{convert_RtoS}
\alias{convert_RtoS}
\title{Conductivity-Salinity Conversion}
\description{ 
  Estimates the salinity of seawater from conductivity, temperature and
  pressure. The equation is valid over ranges: temperature from -2 to 35
  \eqn{^\circ}{degrees }C, pressure from 0 to 1000 bar, and salinity
  from 2 to 42.  
}
\usage{
convert_RtoS(R = 1, t = 25, p = max(0, P-1.013253), P = 1.013253)
}
\arguments{
  \item{R }{Conductivity ratio, the conductivity at (S, t, P) divided
    by the conductivity at S = 35, t = 15, p = 0 [-]}
  \item{t }{Temperature, \eqn{^\circ}{degrees }C}
  \item{p }{Gauge (or applied) pressure, the pressure referenced against the local
    atmospheric pressure, bar}
  \item{P }{True pressure, bar}
}
\value{
  The salinity.
}
\note{
  The conductivity ratio for Salinity = 40.0000, t = 40, p = 1000 is
  1.888091.
}
\author{Karline Soetaert <k.soetaert@nioo.knaw.nl>}
\examples{
convert_RtoS(R = 1.888091, t = 40, p = 1000)

## Salinity = 40.0000, t = 40, p = 1000, cond = 1.888091
convert_RtoS(R = 1, t = 15, p = 0)

## Check values
convert_RtoS(R = 0.6990725, t = 10, p = 0)  # 26.8609
convert_RtoS(R = 0.6990725, t = 10, p = 100)  # 26.5072
convert_RtoS(R = 1.1651206, t = 20, p = 100)  # 36.3576

}
\references{
  Fofonoff NP and Millard RC Jr, 1983. Algorithms for computation of
  fundamental properties of seawater. UNESCO technical papers in marine
  science, 44, 53 pp.\cr
  \url{http://unesdoc.unesco.org/images/0005/000598/059832EB.pdf}
}
\seealso{
\code{\link{convert_AStoPS}}, \code{\link{convert_PStoAS}},
\code{\link{convert_StoR}},
\code{\link{convert_StoCl}},
\code{\link{convert_p}}, \code{\link{convert_T}},
}
\keyword{utilities}

