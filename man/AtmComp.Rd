\name{atmComp}
\alias{atmComp}
\title{Atmospheric Gas Composition}
\description{
  Provides the global average atmospheric composition at present day conditions
  (year 1998). The mixing ratio is generally defined as the ratio of the mass
  of an atmospheric constituent to the total mass of dry air. If not otherwise
  indicated, the term mixing ratio normally refers to water vapor. Here however
  the mixing ratio is provided for all constituents other than water. The mixing
  ratio is given as a mole fraction, i.e. the mass of each constituent gas
  (expressed in moles) divided by the total mass of dry air (also expressed
  in moles).
}
\usage{
atmComp(species = c("He", "Ne", "N2", "O2", "Ar", "Kr", "CH4", "CO2",
  "N2O", "H2", "Xe", "CO", "O3"))
}
\arguments{
  \item{species}{character vector selecting the gases whose composition should be
    provided.
  }
}
\value{
  A vector providing the mixing ratio of the selected gases.
}
\references{
  Sarmiento JL and Gruber N, 2006. Ocean Biogeochemical
  Dynamics. Princeton University Press, Princeton. p 85.


  They cite Weast
  and Astle (1982) for all gasses except CO2, CH4 and N2O. For the latter
  three greenhouse gases, the 1998 concentrations are taken from Ramaswamy
  et al., 2001. Note that the sum of all mixing ratios is slightly larger
  than one, presumably due to the use of increased greenhouse gases values
  as compared to Weast and Astle (1982). In fact, the mixing ratio are
  changing slightly each year due to increases in greenhouse gas
  concentrations.
}
\author{Karline Soetaert <karline.soetaert@nioz.nl>, Filip Meysman <filip.meysman@nioz.nl>}

\examples{
atmComp("O2")
atmComp(c("O2", "CH4", "CO2", "N2O"))
atmComp()
sum(atmComp()) # note this is not =1!
}
\seealso{
\code{\link{gas_O2sat}}, \code{\link{gas_satconc}},
\code{\link{gas_schmidt}}, \code{\link{gas_solubility}},
\code{\link{gas_transfer}}, \code{\link{vapor}}
}

\keyword{utilities}
