\name{sw_cp}
\alias{sw_cp}
\title{Heat Capacity of Sea Water}
\description{
  Estimates the heat capacity of seawater.

  Valid for S = 0 to 40, T = 0 to 35 dg C
}
\usage{
sw_cp(S = 35, t = 25, p = P-1.013253, P=1.013253,
  method=c("Gibbs","UNESCO"))
}
\arguments{
  \item{S }{Salinity, when \code{method} = \code{"UNESCO"}: practical salinity (-)
    else absolute salinity (g/kg),}
  \item{t }{Temperature, \eqn{^\circ}{degrees }C,}
  \item{p }{gauge or applied pressure, pressure referenced against the local
    atmospheric pressure, bar}
  \item{P }{true pressure, bar}
  \item{method }{When "UNESCO", uses the UNESCO (1983) polynomial,
                when "Gibbs", based on the gibbs functions as in Feistel, 2008 }
}
\value{
  Heat capacity, in \eqn{J kg^{-1} dgC^{-1}}
}
\author{Karline Soetaert < k.soetaert@nioo.knaw.nl > }
\examples{
sw_cp(S = 40, t = 40, p = 1000, method="UNESCO")  # 3849.5

# Check value Gibbs function
sw_cp(35.7,25.5,102.3)#3974.42541259729

# Check values UNESCO
sw_cp(S = 25, t = 10, p = 0,    method="UNESCO")  # 4041.8
sw_cp(S = 25, t = 10, p = 1000, method="UNESCO")  # 3842.3
sw_cp(S = 25, t = 30, p = 0,    method="UNESCO")  # 4049.1

sw_cp(S = 40, t = 10, p = 0, method="UNESCO")  # 3959.3

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
\note{
  \code{p} is applied pressure, 0 bar at sea surface.

  when using UNESCO polynomial, \code{cp} for S = 40, T = 40, P = 1000
  is 3849.5 J/(kg dg C).
}
\seealso{
\code{\link{sw_adtgrad}}, \code{\link{sw_alpha}}, \code{\link{sw_beta}},
\code{\link{sw_comp}}, \code{\link{sw_conserv}}, \code{\link{sw_dens}},
\code{\link{sw_depth}}, \code{\link{sw_enthalpy}}, \code{\link{sw_entropy}},
\code{\link{sw_gibbs}}, \code{\link{sw_kappa}},
\code{\link{sw_kappa_t}}, \code{\link{sw_sfac}},
\code{\link{sw_svel}}, \code{\link{sw_tfreeze}}, \code{\link{sw_tpot}}

\code{\link{convert_PStoAS}}, to convert from practical salinity (-) to
absolute salinity (g/kg)

\code{\link{convert_AStoPS}}, to convert from absolute salinity (g/kg) to
practical salinity (-)
}
\keyword{utilities}

