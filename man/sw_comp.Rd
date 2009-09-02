\name{sw_comp}
\alias{sw_comp}
\title{Reference Sea Salt Composition}
\description{
  The sea salt composition definition for reference salinity of the standard
  ocean at 25 dgC and 1.01325 bar (atmospheric pressure),
  given in mass fractions).
}
\usage{
sw_comp(species=c("Na","Mg","Ca","K","Sr","Cl","SO4","HCO3",
            "Br","CO3","BOH4","F","OH","BOH3","CO2"))
}
\arguments{
  \item{species}{character vector with components whose composition should be
    estimated.
  }
}
\value{
  A vector with the mass fractions.
}
\references{
  Millero FJ, Waters J, Woosley R, Huang F and Chanson M, 2008.
  The effect of composition of the density of Indian Ocean waters,
  Deep-Sea Res. I, 55, 960-470.
}

\author{Karline Soetaert <k.soetaert@nioo.knaw.nl>}

\examples{
sw_comp("CO2")
sw_comp()
sum(sw_comp())
}
\seealso{
\code{\link{sw_adtgrad}}, \code{\link{sw_alpha}}, \code{\link{sw_beta}},
\code{\link{sw_conserv}}, \code{\link{sw_cp}},
\code{\link{sw_dens}},
\code{\link{sw_depth}}, \code{\link{sw_enthalpy}}, \code{\link{sw_entropy}},
\code{\link{sw_gibbs}}, \code{\link{sw_kappa}},
\code{\link{sw_kappa_t}}, \code{\link{sw_sfac}},
\code{\link{sw_svel}}, \code{\link{sw_tfreeze}}, \code{\link{sw_tpot}}

}
\keyword{utilities}
