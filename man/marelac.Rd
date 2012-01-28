\name{marelac-package}
\alias{marelac-package}
\alias{marelac}
\docType{package}
\title{
  Tools for Aquatic Sciences
}
\description{
  
  R-package marelac has been designed as a tool for use by scientists
  working in the MArine, Riverine, Estuarine, LAcustrine and Coastal
  sciences.

  It contains:
  \itemize{
    \item chemical and physical constants, e.g. atomic weights, gas constants.
    \item conversion factors, e.g. from salinity to chlorinity, from mol to gram,
       etc.,
    \item utility functions, e.g. to estimate concentrations of conservative
      substances as a function of salinity, ...
  }
  
  
 About the symbols used.
 
 Here we adopt the symbolism as in McDougall et al., 2009:
 
 \itemize{
 \item S for practical (-) or absolute salinity, (g/kg)
 \item P for absolute (total) pressure (bar)
 \item p for sea pressure (also called gauge or applied pressure (bar), the
 pressure relative to P0, one standard atmosphere (=1.01325 bar)
 \item t for temperature in \eqn{^\circ}{degrees }C
 \item T for absolute temperature, in \eqn{^\circ}{degrees }K; T = t + 273.15

 }
  Many of the functions are from the UNESCO 1983 paper, or from Feistel, 2008.
  Note that in these papers, pressure is expressed in dbar.
}
\details{
  \tabular{ll}{
    Package: \tab marelac\cr
    Type: \tab Package\cr
    Version: \tab 2.2\cr
    Date: \tab 2010-11-11\cr
    License: \tab GNU Public License 2 or above\cr
  }
}
\author{
  Karline Soetaert (Maintainer)

  Filip Meysman
  
  Thomas Petzoldt
  
  with contributions from Lorenz Meire
}
\references{
  
  For solubilities, atmospheric composition, gas exchange coefficients:

  Sarmiento JL and Gruber N, 2006. Ocean Biogeochemical
  Dynamics. Princeton University Press, Princeton. p 85.

  For diffusion coefficients, viscosity

  Boudreau BP, 1996.  A method-of-lines code for carbon and nutrient
  diagenesis in aquatic sediments.  Computers & Geosciences 22 (5),
  479-496.

  For many other fundamental properties of seawater, either the UNESCO
  report (1983):

  Fofonoff NP and Millard RC Jr, 1983. Algorithms for computation of
  fundamental properties of seawater. UNESCO technical papers in marine
  science, 44, 53 pp.\cr
  \url{http://unesdoc.unesco.org/images/0005/000598/059832EB.pdf}

  or the more recent report and papers:

  Feistel R, 2008. A Gibbs function for seawater thermodynamics for -6 to
  80 dgC and salinity up to 120 g/kg. Deep-Sea Research I, 55, 1639-1671.

  McDougall TJ, Feistel R, Millero FJ, Jackett DR, Wright DG,
  King BA, Marion GM, Chen C-T A and Spitzer P, 2009. Calculation
  of the Thermophysical Properties of Seawater, Global Ship-based Repeat
  Hydrography Manual, IOCCP Report No. 14, ICPO Publication Series no. 134.

  Millero FJ, Feistel R, Wright DG, and McDougall TJ, 2008.
  The composition of Standard Seawater and the definition of the
  Reference-Composition Salinity Scale, Deep-Sea Res. I, 55, 50-72.
}

\examples{
\dontrun{
## show examples (see respective help pages for details)
example(Constants)
example(molvol)

## open the directory with documents
browseURL(paste(system.file(package="marelac"), "/doc", sep=""))

}
}
\seealso{
for seawater properties:

\code{\link{sw_adtgrad}}, \code{\link{sw_alpha}}, \code{\link{sw_beta}},
\code{\link{sw_comp}}, \code{\link{sw_conserv}}, \code{\link{sw_cp}},
\code{\link{sw_dens}},
\code{\link{sw_depth}}, \code{\link{sw_enthalpy}}, \code{\link{sw_entropy}},
\code{\link{sw_gibbs}}, \code{\link{sw_kappa}},
\code{\link{sw_kappa_t}}, \code{\link{sw_sfac}},
\code{\link{sw_svel}}, \code{\link{sw_tfreeze}}, \code{\link{sw_tpot}}

for atmospheric gasses:

\code{\link{gas_satconc}}, \code{\link{gas_O2sat}},
\code{\link{gas_schmidt}}, \code{\link{gas_solubility}}, \code{\link{gas_transfer}},
\code{\link{atmComp}}, \code{\link{vapor}}, \code{\link{air_spechum}},
\code{\link{air_density}}

conversions:

\code{\link{convert_AStoPS}}, \code{\link{convert_PStoAS}},
\code{\link{convert_RtoS}},
\code{\link{convert_StoCl}}, \code{\link{convert_StoR}},
\code{\link{convert_p}}, \code{\link{convert_T}}

datasets:

\code{\link{AtomicWeight}}, \code{\link{Bathymetry}},
\code{\link{Constants}}, \code{\link{Oceans}}

physical properties:

\code{\link{earth_surf}}, \code{\link{coriolis}}, \code{\link{viscosity}},
\code{\link{diffcoeff}}, \code{\link{ssd2rad}}, \code{\link{vertmean}},
\code{\link{gravity}}

molecular properties:

\code{\link{AtomicWeight}}, \code{\link{molvol}}, \code{\link{molweight}},
\code{\link{redfield}}

}

\keyword{ package }
