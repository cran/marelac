\name{g2mol}
\alias{g2mol}
\title{Conversion from gram to mol}
\description{Converts gram to mol of a chemical species}
\usage{g2mol(species)}
\arguments{
  \item{species }{grams of a chemical species whose weight must be converted to mol}
}
\value{
  mol/g
}
\author{Karline Soetaert <k.soetaert@nioo.knaw.nl>}
\examples{g2mol("CO3")
g2mol("hCO3")
g2mol("H")}
\note{This function includes only some biogeochemically active species}
\keyword{utilities}

