\name{sw_dens}
\alias{sw_dens}
\title{Density of Sea Water}
\description{
  Density of sea water in \eqn{kg m^{-3}}{kg m^{-3}}
}
\usage{
sw_dens(S = 35, t = 25, p = max(0, P-1.013253), P = 1.013253,
        method=c("Gibbs","UNESCO","Chen"))
}
\arguments{
  \item{S }{Salinity, when \code{method} = \code{"UNESCO"}: practical
    salinity (-) else absolute salinity (g/kg),} 
  \item{t }{Temperature, \eqn{^\circ}{degrees }C,}
  \item{p }{gauge or applied pressure, pressure referenced against the
            local atmospheric pressure, bar}
  \item{P }{true pressure, bar}
  
  \item{method }{When "UNESCO", uses the UNESCO (1983) polynomial, when
     "Gibbs", based on the Gibbs functions as in Feistel, 2008 "Chen"
     for the limnological range (i.e. fresh water systems).  }
	      
}

\value{
  Density of water in \eqn{kg m^{-3}}{kg m^-3}.
}
\details{
  To avoid confusion between the arguments (S, t, p) it is advisable to
  use named arguments in general (e.g. \code{rho(t = 4)}.
  The UNESCO formula is imported from package \pkg{seacarb}.
}
\note{
  Pressure used here is 1 bar (true pressure), in contrast to
  hydrostatic pressure (0 bar at surface) in original formula.

  The coefficients from McDougall et al., 2009 were used.
  For temperature, they differ slightly from Feistel 2003 and Feistel 2008,
  which is why, for temparatures different from 0, there is a slight offset
  from the estimates as from table 22 or 21 from Feistel (2008).
}

\references{
  Chen Ch.-T. and Millero FJ, 1986. Precise thermodynamic properties
  of natural waters covering only the limnological
  range. Limnol. Oceanogr. 31 No. 3, 657 - 662.

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

\seealso{\code{\link[seacarb]{rho}} in package seacarb.

\code{\link{sw_adtgrad}}, \code{\link{sw_alpha}}, \code{\link{sw_beta}},
\code{\link{sw_comp}}, \code{\link{sw_conserv}}, \code{\link{sw_cp}},
\code{\link{sw_depth}}, \code{\link{sw_enthalpy}}, \code{\link{sw_entropy}},
\code{\link{sw_gibbs}}, \code{\link{sw_kappa}},
\code{\link{sw_kappa_t}}, \code{\link{sw_sfac}},
\code{\link{sw_svel}}, \code{\link{sw_tfreeze}}, \code{\link{sw_tpot}}

\code{\link{convert_PStoAS}}, to convert from practical salinity to
absolute salinity

\code{\link{convert_AStoPS}}, to convert from absolute salinity to
practical salinity
}
\examples{
# table 22 Feistel 2008
sw_dens(0, 0, 0)               #0.999843086e3
sw_dens(0, 79.85, 0)           #0.97188383e3   - deviates
sw_dens(0, 0,998.98675)        #0.104527796e4

# table 21 Feistel 2008
sw_dens(35.16504, 0, 0)        #0.10281072e4
sw_dens(100, 79.85, 0)         #0.102985888e4
sw_dens(35.16504, 0,998.98675) #0.10709264e4

sw_dens(35.7, 25.5, 102.3)     #1027.95249315662

S <- 0:40
plot(S, sw_dens(S = S, t = 4, method = "UNESCO"))

lines(S, sw_dens(S = S, t = 4, method = "Gibbs"), col = "red")

lines(S, sw_dens(S = S, t = 4, method = "Chen"), col = "blue")

}
\keyword{ misc }
