\name{sw_svel}
\alias{sw_svel}
\title{Velocity of the Sound in Seawater}
\description{
  Computes the velocity of the sound in seawater,
  using the UNESCO 1983 polynomial or based on the Gibbs function.

  Valid for salinity from 0 to 40, temperature from 0 to 40 dgC, pressure
  from 1 to 1000 bars.
}
\usage{
sw_svel(S = 35, t = 25, p = P-1.013253, P = 1.013253,
  method=c("Gibbs","UNESCO"))
}
\arguments{
  \item{S }{Salinity, when \code{method} = \code{"UNESCO"}: practical salinity (-)
    else absolute salinity (g/kg),}
  \item{t }{Temperature, \eqn{^\circ}{degrees }C,}
  \item{p }{gauge or applied pressure, pressure referenced against the local
    atmospheric pressure, bar
  }
  \item{P }{true pressure, bar}
  \item{method }{When "UNESCO", uses the UNESCO (1983) polynomial,
                when "Gibbs", based on the gibbs functions as in Feistel, 2008 }
}
\value{
  Sound velocity, in m / sec.
}
\note{
  Sound velocity for S = 40, t = 40, p = 1000 is 1731.995 using UNESCO
  polynomial.
}
\author{Karline Soetaert <k.soetaert@nioo.knaw.nl>}
\examples{
sw_svel(t = 40, S = 40, p = 10:20, method="UNESCO")

# Check value UNESCO
sw_svel(t = 40, S = 40, p = 1000, method="UNESCO")  # 1731.995
sw_svel(t = 0, S = 40, p = 0, method="UNESCO")      # 1455.8

sw_svel(t = 40, S = 25, p = 1000, method="UNESCO")  # 1719.2
sw_svel(t = 40, S = 25, p = 0, method="UNESCO")     # 1553.4
sw_svel(t = 0, S = 25, p = 0, method="UNESCO")      # 1435.8


# Check value Gibbs
sw_svel(S = 35.7, t = 25.5, p = 102.3)              # 1552.93372863425

}
\references{
  Fofonoff NP and Millard RC Jr, 1983. Algorithms for computation of
  fundamental properties of seawater. UNESCO technical papers in marine
  science, 44, 53 pp.\cr
  \url{http://unesdoc.unesco.org/images/0005/000598/059832EB.pdf}

  Feistel R, 2008. A Gibbs function for seawater thermodynamics for -6 to
  80 dgC and salinity up to 120 g/kg. Deep-Sea Research I, 55, 1639-1671.

  McDougall TJ, Feistel R, Millero FJ, Jackett DR, Wright DG,
  King BA, Marion GM, Chen C-T A and Spitzer P, 2009. Calculation
  of the Thermophysical Properties of Seawater, Global Ship-based Repeat
  Hydrography Manual, IOCCP Report No. 14, ICPO Publication Series no. 134.

}
\seealso{
\code{\link{sw_adtgrad}}, \code{\link{sw_alpha}}, \code{\link{sw_beta}},
\code{\link{sw_comp}}, \code{\link{sw_conserv}}, \code{\link{sw_cp}},
\code{\link{sw_dens}},
\code{\link{sw_depth}}, \code{\link{sw_enthalpy}}, \code{\link{sw_entropy}},
\code{\link{sw_gibbs}}, \code{\link{sw_kappa}},
\code{\link{sw_kappa_t}}, \code{\link{sw_sfac}},
\code{\link{sw_tfreeze}}, \code{\link{sw_tpot}}

\code{\link{convert_PStoAS}}, to convert from practical salinity (-) to
absolute salinity (g/kg)

\code{\link{convert_AStoPS}}, to convert from absolute salinity (g/kg) to
practical salinity (-)

}

\keyword{utilities}

