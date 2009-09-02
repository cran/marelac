\name{molweight}
\alias{molweight}
\title{Molecular Weight of a Chemical Species}
\description{Calculates the molecular weight of chemical species.}
\usage{
molweight(species)
}
\arguments{
  \item{species }{character vector with chemical species whose molecular
    weight is requested.
  }
}
\value{
  Vector with the molecular weights in g/mol.
}
\details{
  Molecular weights of chemical elements may vary due to different
  isotope compositions, depending on geology, industrial processes or
  biological activity.  Please consult the IUPAC Technical report about
  the details.  The function returns NA for elements (and their
  compounds) which have no stable isotopes (except U, Th, Pa).
}
\references{
  Wieser ME, 2006. Atomic weights of the elements 2005 (IUPAC
  Technical Report).  Pure Appl. Chem. 78(11), 2051--2066.
  doi:10.1351/pac200678112051
}
\author{Thomas Petzoldt}
\note{
  This function uses text parsing of chemical formulae, it is
  strictly case sensitive.
}
\seealso{
\code{\link{AtomicWeight}}, \code{\link{molvol}},
\code{\link{redfield}}
}
\examples{
molweight("CO2")
molweight("HCO3")
molweight("H")
molweight("H3PO4")

## eicosapentaenoic acid (EPA)
molweight("CH3CH2CHCHCH2CHCHCH2CHCHCH2CHCHCH2CHCH(CH2)3COOH")
molweight("C20H30O2")

## works also with vectors
molweight(c("C2H5OH", "CO2", "H2O"))
molweight(c("SiOH4", "NaHCO3", "C6H12O6", "Ca(HCO3)2", "Pb(NO3)2", "(NH4)2SO4"))

## note that chemical formulae are case-sensitive
molweight("Co") # cobalt
molweight("CO") # carbon monoxide


## from gram to mol
1/molweight("CO3")

}
\keyword{utilities}

