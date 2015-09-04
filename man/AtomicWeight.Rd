\name{AtomicWeight}
\docType{data}
\alias{AtomicWeight}
\alias{atomicweight}
\title{The Atomic Weights of Chemical Elements}
\description{
  Atomic weights of chemical elements according to the IUPAC table.
}
\usage{
AtomicWeight
atomicweight
}
\format{
  The capitalized version \code{AtomicWeight} is a data frame containing
  the IUPAC table of atomic weights.
  This data frame has following colums: Number, Name,
  Symbol, Weight, Footnotes.

  Note that as in the IUPAC table, the Weight is
  given as a text rather than as numeric objects. It comprises the standard
  values and the uncertainties (in parentheses, following the last significant
  figure to which they are attributed).
  See IUPAC report for explanation of the Footnotes.

  The lower case version \code{atomicweight} is a simplified list that only
  contains the weights (as numeric values) and allows symbolic
  computations with elements to arrive at molecular weights.
}
\author{Thomas Petzoldt}
\details{
  Molecular weights of chemical elements may vary due to different isotope
  compositions, depending on geology, industrial processes or biological activity.
  Please consult the IUPAC Technical report about the details.
  The data set contains \code{NA} for elements that have no stable isotopes
  (except U, Th, Pa).
}
\examples{
## assess the data in the IUPAC table (with all footnotes)
AtomicWeight[1:20,]
AtomicWeight[AtomicWeight$Symbol == "C",]

## use the lower case version for simple calculations:
atomicweight$C
with(atomicweight, C)

## it can also be used to calculate molecular weights
## via symbolic computation
with(atomicweight, H * 2 + O)
}
\references{
  Wieser ME, 2006. Atomic weights of the elements 2005 (IUPAC
  Technical Report). Pure Appl. Chem. 78 (11), 2051--2066.,
  2006. DOI: 10.1351/pac200678112051
}
\seealso{
other datasets:  \code{\link{Bathymetry}},
\code{\link{Constants}}, \code{\link{Oceans}},

\code{\link{molweight}} for molecular weight calculations with
  molecular formulae.
}

\keyword{datasets}


