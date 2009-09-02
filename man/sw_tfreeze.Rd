\name{sw_tfreeze}
\alias{sw_tfreeze}
\title{Freezing Temperature of Seawater}
\description{
  Estimates the freezing temperature of seawater, using the UNESCO 1983
  polynomial.
  
  Valid for salinity 4-40
}
\usage{
sw_tfreeze(S=35, p = P-1.013253, P=1.013253 )
}
\arguments{
  \item{S }{practical salinity, -,
  }
  \item{p }{gauge or applied pressure, pressure referenced against the local
    atmospheric pressure, bar
  }
  \item{P }{true pressure, bar
  }
}
\value{
  Temperature, \eqn{^\circ}{degrees }C
}
\author{Karline Soetaert <k.soetaert@nioo.knaw.nl>}
\examples{
sw_tfreeze(S = 40,p = 50)

## Check values
sw_tfreeze(S = 10,p = 0)  #-0.542
sw_tfreeze(S = 10,p = 10) #-0.618
sw_tfreeze(S = 30,p = 0)  #-1.638
sw_tfreeze(S = 40,p = 50) #-2.589

}
\note{

  freezing temperature for S = 40, \code{p} = 50 is -2.588567 dgC.
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
\code{\link{sw_dens}},
\code{\link{sw_depth}}, \code{\link{sw_enthalpy}}, \code{\link{sw_entropy}},
\code{\link{sw_gibbs}}, \code{\link{sw_kappa}},
\code{\link{sw_kappa_t}}, \code{\link{sw_sfac}},
\code{\link{sw_svel}}, \code{\link{sw_tpot}}

}
\keyword{utilities}

