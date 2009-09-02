\name{gas_schmidt}
\alias{gas_schmidt}
\title{The Schmidt Number for Gases in Seawater}
\description{
  The Schmidt number as a function of temperature (0-30dgC) and for a
  salinity of 35.

  \eqn{Sc = v/D = Mu/(rho+D)}

  where v is the kinematic viscosity of the water and D is the mass
  diffusivity, rho is density and mu is the viscosity.

  Schmidt numbers are used to estimate the gas transfer velocity.
}
\usage{
gas_schmidt(t = 25, species = c("He", "Ne", "N2", "O2", "Ar",
        "Kr", "Rn", "CH4","CO2", "N2O", "CCl2F2", "CCL3F",
        "SF6", "CCl4"))
}
\arguments{
  \item{t }{Temperature in \eqn{^\circ}{degrees }C,}
  \item{species }{character vector with gasses whose schmidt number
    should be estimated.
  }
}
\value{
  The Schmidt number, a dimensionless quantity.
}

\author{Karline Soetaert <k.soetaert@nioo.knaw.nl>}
\examples{
gas_schmidt(species = "CO2", t=20) # about660
}
\references{
  Sarmiento JL and Gruber N, 2006. Ocean Biogeochemical
  Dynamics. Princeton University Press, Princeton. p 85.

  who cite:

  Wanninkhof R, 1992. Relationship between wind speed and gas exchange
  over the ocean. Journ. Geophys. Res. 97, 7373-7383.

  except for \eqn{O_2}{O2}:

  Keeling et al., 1998. Seasonal variation in the atmospheric O2/N2 ratio
  in relation to the kinetics of air-sea gas exchange. Global
  Biogeochemical Cycles 12, 141-164.

  CFC-11 (\eqn{CCl_2F_2}{CCl2F2}), and CFC-12 (\eqn{CCl_3F}{CCl3F}):

  Zheng et al., 1998. Measurements of the diffusion coefficients of
  CF-11 and CF-12 in pure water and seawater.  Journ. Geophys. Res. 103,
  1375-1379.

  and \eqn{CCl_4}{CCl3} (Wanninkhof, pers.comm).
}
\seealso{
\code{\link{gas_O2sat}}, \code{\link{gas_satconc}},
\code{\link{gas_solubility}}, \code{\link{gas_transfer}},
\code{\link{atmComp}}, \code{\link{vapor}}
}
\keyword{utilities}

