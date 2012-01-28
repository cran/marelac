\encoding{latin1}
\name{sw_gibbs}
\alias{sw_gibbs}
\title{Gibbs Function of Seawater}
\description{
  Calculates the seawater specific gibbs free energy, including
  derivatives up to order 2, for a
  given temperature, salinity and pressure.
  
  The Gibbs function of seawater g(S,t,p) is related to the specific
  enthalpy h and entropy s, by g = h - (273.15 K + t) s
}
\usage{
sw_gibbs(S = 35, t = 25, p = P-1.013253, 
         P = 1.013253, dS = 0, dt = 0, dp = 0)}
\arguments{
  \item{S }{Absolute salinity (g/kg),}
  \item{t }{Temperature, \eqn{^\circ}{degrees }C,}
  \item{p }{gauge or applied pressure, pressure referenced against the local
    atmospheric pressure, bar
  }
  \item{P }{true pressure, bar}
  \item{dS }{order of the S derivative}
  \item{dt }{order of the t derivative}
  \item{dp }{order of the p derivative}
}
\value{
   The Gibbs function, J/kg, or its derivative
}
\author{Karline Soetaert <karline.soetaert@nioz.nl>}

\examples{
# table 22 Feistel 2008
sw_gibbs(0, 0, 0)                             #= 101.34274
sw_gibbs(0, 0, 0, dS = 1)                     # 0
sw_gibbs(0, 0, 0, dt = 1)                     #0.147643376
sw_gibbs(0, 0, 0, dp = 1)                     #0.1000015694e-2
sw_gibbs(0, 0, 0, dS = 1, dp = 1)             #0
sw_gibbs(0, 0, 0, dt = 1, dp = 1)             #-0.677700318e-7

sw_gibbs(0, 79.85, 0)                         #-0.446114969e5 differs (see note)
sw_gibbs(0, 79.85, 0, dt = 1)                 #-0.107375993e4 differs
sw_gibbs(0, 79.85, 0, dp = 1)                 #0.102892956e-2 differs
sw_gibbs(0, 79.85, 0, dS = 1, dp = 1)         #0
sw_gibbs(0, 79.85, 0, dt = 1, dp = 1)         #0.659051552e-6


sw_gibbs(0, 0, 998.98675)                     #0.977303862e5
sw_gibbs(0, 0, 998.98675, dt = 1)             #0.851466502e1
sw_gibbs(0, 0, 998.98675, dp = 1)             #0.956683329e-3
sw_gibbs(0, 0, 998.98675, dS = 1, dp = 1)     #0
sw_gibbs(0, 0, 998.98675, dt = 1, dp = 1)     #0.199079571e-6

# table 21 Feistel 2008
sw_gibbs(35.16504, 0, 0)                      #=0
sw_gibbs(35.16504, 0, 0, dS = 1)              #0.639974067e2      differs
sw_gibbs(35.16504, 0, 0, dt = 1)              #=0
sw_gibbs(35.16504, 0, 0, dp = 1)              #0.972661217e-3
sw_gibbs(35.16504, 0, 0, dS = 1, dp = 1)      #-0.759615412e-6
sw_gibbs(35.16504, 0, 0, dt = 1, dp = 1)      #0.515167556e-7    !!!

sw_gibbs(100, 79.85, 0)                       #=-0.295243229e5   differs
sw_gibbs(100, 79.85, 0, dS = 1)               #0.251957276e3
sw_gibbs(100, 79.85, 0, dt = 1)               #-0.917529024e3    differs
sw_gibbs(100, 79.85, 0, dp = 1)               #0.971006828e-3    differs
sw_gibbs(100, 79.85, 0, dS = 1, dp = 1)       #-0.305957802e-6
sw_gibbs(100, 79.85, 0, dt = 1, dp = 1)       #0.146211315e-5

sw_gibbs(35.16504, 0, 998.98675)                 #=0.951294557e5
sw_gibbs(35.16504, 0, 998.98675, dS = 1)         #-0.545861581e1
sw_gibbs(35.16504, 0, 998.98675, dt = 1)         #0.160551219e2
sw_gibbs(35.16504, 0, 998.98675, dp = 1)         #0.933770945e-3
sw_gibbs(35.16504, 0, 998.98675, dS = 1, dp = 1) #-0.640757619e-6
sw_gibbs(35.16504, 0, 998.98675, dt = 1, dp = 1) #0.245708012e-6

}
\note{
  The gibbs functgion is defined as the sum of a pure water part and the
  saline part (IAPWS-08)

  The coefficients from McDougall et al., 2009 were used.
  For temperature, they differ slightly from Feistel 2003 and Feistel 2008,
  which is why, for temperatures different from 0, there is a slight offset
  from the estimates as from table 22 or 21 from Feistel (2008).


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
\code{\link{sw_adtgrad}}, \code{\link{sw_alpha}}, \code{\link{sw_beta}},
\code{\link{sw_comp}}, \code{\link{sw_conserv}}, \code{\link{sw_cp}},
\code{\link{sw_dens}},
\code{\link{sw_depth}}, \code{\link{sw_enthalpy}}, \code{\link{sw_entropy}},
\code{\link{sw_kappa}},
\code{\link{sw_kappa_t}}, \code{\link{sw_sfac}},
\code{\link{sw_svel}}, \code{\link{sw_tfreeze}}, \code{\link{sw_tpot}}

\code{\link{convert_PStoAS}}, to convert from practical salinity (-) to
absolute salinity (g/kg)
}
\keyword{utilities}

