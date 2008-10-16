\name{mol.weight}
\alias{mol.weight}
\title{Molecular weight of a species}
\description{Calculates the molecular weight of a (biogeochemically active) species}
\usage{mol.weight(species)}
\arguments{
  \item{species }{chemical species whose molecular weight should be estimated}
}
\value{
  g/mol
}
\author{Karline Soetaert <k.soetaert@nioo.knaw.nl>}
\examples{mol.weight("CO3")
mol.weight("HCO3")
mol.weight("H")}
\note{This function includes only some biogeochemically active species}
\keyword{utilities}

