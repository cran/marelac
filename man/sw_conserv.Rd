\name{sw_conserv}
\alias{sw_conserv}
\title{Concentrations of (Conservative) Species in Seawater}
\description{
  Estimates the concentration of Borate,Calcite, Sulphate and Fluoride
  in seawater, as a function of salinity.
}
\usage{
sw_conserv(S = 35)
}
\arguments{
  \item{S }{Practical salinity, (-).}
}
\value{
  A data frame with the concentrations in micromol/kg.
}
\author{Karline Soetaert <karline.soetaert@nioz.nl>}

\examples{
data.frame(salinity = 1:35, sw_conserv(1:35) )
}
\references{
  Millero FJ, 1995. Thermodynamics of the carbon dioxide system in
  the oceans. Geochim. Cosmochim. Acta 59, 661 677.

  Riley JP, 1965. The occurrence of anomalously high fluoride
  concentrations in the North Atlantic. Deep-Sea Res. 12, 219 220.

  Morris AW, Riley JP, 1966. The bromide- chlorinity and sulphate-
  chlorinity ratio in seawater. Deep-Sea Res. 13, 699 706.
}
\details{
  The borate and calcite concentration as in Millero (1995),

  Sulphate as in Morris and Riley, 1966,

  Fluoride as in Riley, 1965.
}
\seealso{
\code{\link{sw_adtgrad}}, \code{\link{sw_alpha}}, \code{\link{sw_beta}},
\code{\link{sw_comp}}, \code{\link{sw_cp}},
\code{\link{sw_dens}},
\code{\link{sw_depth}}, \code{\link{sw_enthalpy}}, \code{\link{sw_entropy}},
\code{\link{sw_gibbs}}, \code{\link{sw_kappa}},
\code{\link{sw_kappa_t}}, \code{\link{sw_sfac}},
\code{\link{sw_svel}}, \code{\link{sw_tfreeze}}, \code{\link{sw_tpot}}

}
\keyword{utilities}

