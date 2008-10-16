\name{diffcoeff}
\alias{diffcoeff}
\title{Molecular diffusion coefficients}
\description{Calculates molecular and ionic diffusion coefficients (cm2/hour),
 for several species at given salinity (S) temperature (T) and pressure (P).

 Based on the code "CANDI" by B.P. Boudreau}
\usage{diffcoeff(S=35, T=25, P=1)}
\arguments{
  \item{S }{Salinity, -}
  \item{T }{Temperature, degrees C}
  \item{P }{Pressure, atm}
}
\value{
   a data.frame with the diffusion coefficients (cm2//hour) of:
  \item{O2 }{ oxygen   }
  \item{CO2 }{carbon dioxide   }
  \item{NH3 }{ammonia }
  \item{H2S }{ sulfide  }
  \item{CH4 }{ methane  }
  \item{HCO3 }{bicarbonate ion  }
  \item{CO3 }{ carbonate ion  }
  \item{NH4 }{ ammonium ion  }
  \item{HS }{  sulfide ion  }
  \item{NO3 }{ nitrate ion  }
  \item{H2PO4 }{phosphate ion \eqn{H_2PO_4^-} }
  \item{HPO4 }{ phosphate ion \eqn{HPO_4^{2-}}  }
  \item{PO4 }{ \eqn{PO_4^{3-}}  }
  \item{H }{  proton   }
  \item{OH }{ hydroxyl ion   }
  \item{Ca }{ calcium ion  }
  \item{Mg }{ magnesium ion  }
  \item{Fe }{ iron ion   }
  \item{Mn }{ manganese ion   }
  \item{SO4 }{ sulphate ion  }
  \item{H3PO4 }{phosphate }
  \item{BOH3 }{borate ion  }
  \item{B0H4 }{borate  }
  \item{H4SiO4 }{silicate}
}
\author{Karline Soetaert <k.soetaert@nioo.knaw.nl>}
\examples{
diffcoeff(S=15,T=15)*24  # cm2/day
diffcoeff(T=10)$O2
difftemp <- diffcoeff(T=0:30)[,1:13]
matplot(0:30,difftemp,xlab="temperature",ylab="cm2/hour",
         main="Molecular/ionic diffusion",type="l")
legend("topleft",ncol=2,cex=0.8,title="mean",col=1:13,lty=1:13,
         legend=cbind(names(difftemp),format(colMeans(difftemp),digits=4)))
diffsal <- diffcoeff(S=0:35)[,1:13]
matplot(0:35,diffsal,xlab="salinity",ylab="cm2/hour",
         main="Molecular/ionic diffusion",type="l")
legend("topleft",ncol=2,cex=0.8,title="mean",col=1:13,lty=1:13,
         legend=cbind(names(diffsal),format(colMeans(diffsal),digits=4)))}
\references{Based on the FORTRAN implementation of the diagenetic model "CANDI" of B.P. Boudreau:

Boudreau BP, 1996.
A method-of-lines code for carbon and nutrient diagenesis in aquatic sediments. 
Computers and Geosciences 22 (5): 479-496 
  
who cites:  

Cohen MH, Turnbull D. 1959.
Molecular transport in liquids and glasses.
Journal of chemical physics 31 (5): 1164-1169

Krynicki K, Green CD, Sawyer DW, 1978.
pressure and temperature-dependence of self-diffusion in water.
Faraday discussions 66: 199-208

Wilke CR, Chang P, 1955.
Correlation of diffusion coefficients in dilute solutions.
Aiche journal 1 (2): 264-270

Hayduk W, Laudie H, 1974.
Prediction of diffusion-coefficients for nonelectrolytes in dilute aqueous-solutions.
Aiche journal 20 (3): 611-615}
\details{The details given in the original code by B. Boudreau are repeated here:

To correct for salinity, the Stokes-Einstein relationship is used.
This is not quite accurate, but is at least consistent.

Diffusion coefficient of Water : from Cohen and Turnbull (1959) and Krynicki et al. (1978)

Dissolved gases : from Wilke and Chang (1955)

molar volumes \eqn{cm^3/mol} (Sherwood et al., 1975)

The coefficients in pure water for the following species:

\eqn{NO_3^-}, \eqn{HS^-}, \eqn{H_2PO_4^-}, \eqn{CO3^{2-}}, \eqn{SO_4{2-}}, \eqn{Ca^{++}}, \eqn{Mg^{++}}, \eqn{Mn^{++}},
\eqn{Fe^{++}},\eqn{NH_4^+}, \eqn{H^+}, \eqn{OH^-}, \eqn{HCO_3^-}, \eqn{HPO_4^{2-}}, \eqn{PO_4^{3-}}
are calculated as linear functions of temperature (deg C). The coefficients as in Boudreau (1996).

\eqn{H_3PO_4} : Least (1984) determined D(H3PO4) at 25 deg C and 0 S.
Assume that this value can be scaled by the Stokes-Einstein relationship to any other temperature.

\eqn{B(OH)_3} : Mackin (1986) determined D(B(OH)3) at 25 deg C and about 29.2 S.
Assume that this value can be scaled by the Stokes-Einstein relationship to any other temperature.

\eqn{B(OH)_4} : No information on this species ! Boudreau and Canfield (1988) assume it is 12.5\% smaller than B(OH)3.

\eqn{H_4SiO_4} : Wollast and Garrels (1971) found D(H4SiO4) at 25 deg C and 36.1 ppt S.
Assume that this value can be scaled by the Stokes-Einstein relationship to any other temperature.}
\seealso{\code{\link{viscosity}} the shear viscosity of water}
\keyword{utilities}

