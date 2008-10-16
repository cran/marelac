\name{salconc}
\alias{salconc}
\title{Concentrations of (conservative) species in seawater}
\description{Estimates the concentration of Borate,Calcite, Sulphate and Fluoride in seawater}
\usage{salconc(S=35)}
\arguments{
  \item{S }{salinity}
}
\value{
  a data frame with the concentrations in micromol/kg
}
\author{Karline Soetaert <k.soetaert@nioo.knaw.nl>}
\examples{data.frame(salinity=1:35,salconc(1:35))}
\references{\item Millero, F.J., 1995. Thermodynamics of the carbon dioxide system in
the oceans. Geochim. Cosmochim. Acta 59: 661 677.
\item Riley, J.P., 1965. The occurrence of anomalously high fluoride
concentrations in the North Atlantic. Deep-Sea Res. 12: 219 220.
\item Morris, A.W., Riley, J.P., 1966. The bromide- chlorinity and sulphate-
chlorinity ratio in seawater. Deep-Sea Res. 13: 699 706.}
\details{The borate and calcite concentration as in Millero (1995)
  \cr Sulphate as in Morris and Riley, 1966
  \cr Fluoride as in Riley, 1965}
\keyword{utilities}

