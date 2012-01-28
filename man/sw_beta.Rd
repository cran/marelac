\name{sw_beta}
\alias{sw_beta}
\title{Haline Contraction Coefficient of Seawater}
\description{
  Computes the seawater haline contraction coefficient with respect
  to constant, in situ temperature, kg/g
}
\usage{
sw_beta(S = 35, t = 25, p = P-1.013253, P = 1.013253)
}
\arguments{
  \item{S }{Absolute salinity (g/kg),}
  \item{t }{Temperature, \eqn{^\circ}{degrees }C,}
  \item{p }{gauge or applied pressure, pressure referenced against the
            local atmospheric pressure, bar}
  \item{P }{true pressure, bar}
}
\value{
  Haline contraction coefficient, kg/g.
}
\author{Karline Soetaert <karline.soetaert@nioz.nl>}

\examples{
sw_beta(35.7, 25.5, 102.3)    #0.000725729797838666
}
\references{
  Feistel R, 2008. A Gibbs function for seawater thermodynamics for -6 to
  80 dgC and salinity up to 120 g/kg. Deep-Sea Research I, 55, 1639-1671.

  McDougall TJ, Feistel R, Millero FJ, Jackett DR, Wright DG,
  King BA, Marion GM, Chen C-T A and Spitzer P, 2009. Calculation
  of the Thermophysical Properties of Seawater, Global Ship-based Repeat
  Hydrography Manual, IOCCP Report No. 14, ICPO Publication Series no. 134.
}
\seealso{
\code{\link{sw_adtgrad}}, \code{\link{sw_alpha}},
\code{\link{sw_comp}}, \code{\link{sw_conserv}}, \code{\link{sw_cp}},
\code{\link{sw_dens}},
\code{\link{sw_depth}}, \code{\link{sw_enthalpy}}, \code{\link{sw_entropy}},
\code{\link{sw_gibbs}}, \code{\link{sw_kappa}},
\code{\link{sw_kappa_t}}, \code{\link{sw_sfac}},
\code{\link{sw_svel}}, \code{\link{sw_tfreeze}}, \code{\link{sw_tpot}}

\code{\link{convert_PStoAS}}, to convert from practical salinity (-) to
absolute salinity (g/kg)
}
\keyword{utilities}

