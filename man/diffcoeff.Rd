\name{diffcoeff}
\alias{diffcoeff}
\title{Molecular Diffusion Coefficients}
\description{
  Calculates the molecular and ionic diffusion coefficients in 
  \eqn{m^2 s^{-1}}{m2/sec}, for several inorganic species in seawater 
  at a given salinity, temperature, and pressure.

  Based on Chapter 4 in Boudreau (1997)
}
\usage{diffcoeff(S = 35, t = 25, P = 1.013253,
      species = c("H2O", "O2", "CO2", "H2", "CH4", "DMS",
      "He", "Ne", "Ar", "Kr", "Xe", "Rn",
      "N2", "H2S", "NH3", "NO", "N2O", "CO", "SO2",
      "OH", "F", "Cl", "Br", "I",
      "HCO3", "CO3", "H2PO4", "HPO4", "PO4",
      "HS", "HSO3", "SO3", "HSO4", "SO4", "IO3", "NO2", "NO3",
      "H", "Li", "Na", "K", "Cs","Ag","NH4",
      "Ca", "Mg", "Fe", "Mn", "Ba", "Be", "Cd", "Co",
      "Cu", "Hg", "Ni", "Sr", "Pb", "Ra", "Zn", "Al", "Ce",
      "La", "Pu", "H3PO4", "BOH3", "BOH4", "H4SiO4"))
}
\arguments{
  \item{S }{Salinity, -,
  }
  \item{t }{Temperature, \eqn{^\circ}{degrees }C,
  }
  \item{P }{True pressure, bar,
  }
  \item{species }{character vector with the names of the chemical species whose
   diffusion coefficient should be calculated.
  }
}
\value{
  A data.frame with the diffusion coefficients \eqn{m^2 s^{-1}}{m2/sec}
  of the selected chemical species.
}

\author{Filip Meysman <filip.meysman@nioz.nl>,
  Karline Soetaert <karline.soetaert@nioz.nl>
}

\examples{
diffcoeff(S = 15, t = 15)*1e4*3600*24         # cm2/day
diffcoeff(t = 10, species = "O2")             # m2/s
difftemp <- diffcoeff(t = 0:30)[,1:13]
matplot(0:30, difftemp, xlab = "temperature", ylab = "m2/s",
        main = "Molecular/ionic diffusion", type = "l")
legend("topleft", ncol = 2, cex = 0.8, title = "mean", col = 1:13, lty = 1:13,
       legend = cbind(names(difftemp),
       format(colMeans(difftemp), digits = 4)))

select <- c("O2", "CO2", "NH3", "NH4", "NO3")
diffsal <- diffcoeff(S = 0:35, species = select)
matplot(0:35, diffsal,xlab = "salinity", ylab = "m2/s",
         main = "Molecular/ionic diffusion", type = "l")
legend("topleft", ncol = 2, cex = 0.8, title = "mean",
       col = 1:length(select), lty = 1:length(select),
       legend = cbind(select, format(colMeans(diffsal), digits = 4)))
}
\references{
  Based on Chapter 4 in Boudreau (1997) :

  Boudreau BP, 1997. Diagenetic Models and their Implementation. Modelling
    Transport and Reactions in Aquatic Sediments. Springer. Berlin.

  who cites:

  for self-diffusion coefficient H2O:

  Cohen MH and Turnbull D. 1959. Molecular transport in liquids and
  glasses.  Journal of chemical physics 31 (5): 1164-1169

  Krynicki K, Green CD and Sawyer DW, 1978.  Pressure and
  temperature-dependence of self-diffusion in water.  Faraday
  discussions 66: 199-208

  for gases O2 and CO2:

  Novel relation by Boudreau (1997) based on new compilation of data

  for gases He, Ne, Kr, Xe, Rn, H2, CH4:

  Jahne B, Heinz G, and Dietrich W, 1987. Measurements of the
  diffusion coefficients of sparingly soluble gases in water.
  J. Geophys. Res., 92:10,767-10,776.

  for Ar:

  Ohsumi T and Horibe Y, 1984. Diffusivity of He and Ar in deep-sea sediments,
  Earth and Planetary Science Letters 70, 61-68.

  for DMS:

  Saltzman ES, King DB, Holmen K, and Leck C, 1993. Experimental Determination
  of the Diffusion Coefficient of Dimethylsulfide in Water, J. Geophys. Res.,
  98(C9), 16, 481-486.

  for other gases (N2, H2S, NH3, NO, N2O, CO, SO2):

  Wilke CR and Chang P, 1955. Correlation of diffusion coefficients in
  dilute solutions. Aiche journal 1 (2): 264-270

  with the correction proposed by

  Hayduk W and Laudie H, 1974.  Prediction of diffusion-coefficients for
  nonelectrolytes in dilute aqueous-solutions. Aiche journal 20 (3):
  611-615

  for ions:

  Hayduk W and Laudie H, 1974.  Prediction of diffusion-coefficients for
  nonelectrolytes in dilute aqueous-solutions. Aiche journal 20 (3):
  611-615


  for H3PO4, B(OH)3, B(OH)4, H4SiO4 : see details

}

\details{

  To correct for salinity, the Stokes-Einstein relationship is used.
  This is not quite accurate, but is at least consistent.

  \eqn{H_3PO_4} : Least (1984) determined D(H3PO4) at 25 deg C and 0 S.
  Assume that this value can be scaled by the Stokes-Einstein
  relationship to any other temperature.

  \eqn{B(OH)_3} : Mackin (1986) determined D(B(OH)3) at 25 deg C and
  about 29.2 S. Assume that this value can be scaled by the
  Stokes-Einstein relationship to any other temperature.

  \eqn{B(OH)_4} : No information on this species.  Boudreau and Canfield
  (1988) assume it is 12.5\% smaller than B(OH)3.

  \eqn{H_4SiO_4} : Wollast and Garrels (1971) found D(H4SiO4) at 25 deg
  C and 36.1 ppt S.  Assume that this value can be scaled by the
  Stokes-Einstein relationship to any other temperature.
  
}
\seealso{
\code{\link{coriolis}}, \code{\link{viscosity}},
\code{\link{ssd2rad}}, \code{\link{vertmean}},
\code{\link{gravity}}
}
\keyword{utilities}

