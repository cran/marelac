\name{sw_tpot}
\alias{sw_tpot}
\title{Potential Temperature of Seawater}
\description{
  Estimates the potential temperature of seawater, using the UNESCO 1983
  polynomial.

  It is the temperature an element of seawater would have if raised
  adiabatically with no change of salinity, to atmospheric pressure.
}
\usage{sw_tpot(S = 35, t = 25, p, pref = 0)}
\arguments{
  \item{t }{temperature, \eqn{^\circ}{degrees }C,
  }
  \item{S }{practical salinity, -,
  }
  \item{p }{gauge or applied pressure, pressure referenced against the local
    atmospheric pressure, bar
  }
  \item{pref }{reference hydrostatic pressure, bar.
  }
}
\value{
  Temperature, \eqn{^\circ}{degrees }C.
}
\author{Karline Soetaert <karline.soetaert@nioz.nl>}

\examples{
sw_tpot(S = 40, t = 40:45, p = 1000)

## check values
sw_tpot(S = 25, t = 40, p = 0)      #40
sw_tpot(S = 25, t = 40, p = 100)    #36.6921
sw_tpot(S = 25, t = 10, p = 1000)   #8.4684
sw_tpot(S = 25, t = 0, p = 100)     #-0.0265

sw_tpot(S = 40, t = 40, p = 1000)  #36.89073
}
\references{
  Fofonoff NP and Millard RC Jr, 1983. Algorithms for computation of
  fundamental properties of seawater. UNESCO technical papers in marine
  science, 44, 53 pp.\cr
  \url{http://unesdoc.unesco.org/images/0005/000598/059832EB.pdf}
}
\note{
\code{sw_tpot} for S = 40, t = 40, p = 1000 is 36.89073 dgC
}
\seealso{
\code{\link{sw_adtgrad}}, \code{\link{sw_alpha}}, \code{\link{sw_beta}},
\code{\link{sw_comp}}, \code{\link{sw_conserv}}, \code{\link{sw_cp}},
\code{\link{sw_dens}},
\code{\link{sw_depth}}, \code{\link{sw_enthalpy}}, \code{\link{sw_entropy}},
\code{\link{sw_gibbs}}, \code{\link{sw_kappa}},
\code{\link{sw_kappa_t}}, \code{\link{sw_sfac}},
\code{\link{sw_svel}}, \code{\link{sw_tfreeze}}

}
\keyword{utilities}

