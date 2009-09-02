\name{sw_depth}
\alias{sw_depth}
\title{Water Depth}
\description{
  Computes the water depth for water of salinity 35, and temperature 0
  dg C, based on latitude and hydrostatic pressure, using the UNESCO 1983
  polynomial.
}
\usage{
sw_depth(p = P-1.013253, P=1.013253, lat = 0)
}
\arguments{
  \item{p }{gauge or applied pressure, pressure referenced against the local
    atmospheric pressure, bar
  }
  \item{P }{true pressure, bar}
  \item{lat }{latitude (-90 to +90), -,}
}
\value{
  Water depth in m.
}
\note{

  \code{sw_depth} for  p = 1000, lat = 30 is 9712.653 m.
}
\author{Karline Soetaert <k.soetaert@nioo.knaw.nl>}
\examples{
sw_depth(p = 1000, lat = 30:40)

## Check values
sw_depth(p = 1000, lat = 30)     #9712.65
sw_depth(p = 50,  lat = 30)       #496.00
sw_depth(p = 50,  lat = 60)       #494.69
sw_depth(p = 500, lat = 60)       #4895.60

}
\references{
  Fofonoff NP and Millard RC Jr, 1983. Algorithms for computation of
  fundamental properties of seawater. UNESCO technical papers in marine
  science, 44, 53 pp.\cr
  \url{http://unesdoc.unesco.org/images/0005/000598/059832EB.pdf}
}
\seealso{
\code{\link{sw_adtgrad}}, \code{\link{sw_alpha}}, \code{\link{sw_beta}},
\code{\link{sw_comp}}, \code{\link{sw_conserv}}, \code{\link{sw_cp}},
\code{\link{sw_dens}}, \code{\link{sw_enthalpy}}, \code{\link{sw_entropy}},
\code{\link{sw_gibbs}}, \code{\link{sw_kappa}},
\code{\link{sw_kappa_t}}, \code{\link{sw_sfac}},
\code{\link{sw_svel}}, \code{\link{sw_tfreeze}}, \code{\link{sw_tpot}}

}
\keyword{utilities}

