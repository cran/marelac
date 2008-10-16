\name{mol.vol}
\alias{mol.vol}
\title{Molar volume of an ideal gas}
\description{Calculates the molar volume of an ideal gas for given temperature and salinity}
\usage{mol.vol(T=25, P=1)}
\arguments{
  \item{T }{temperature, dg celsius}
  \item{P }{pressure, atmosphere}
}
\value{
  molar volume, liter, of an ideal gas
}
\author{Karline Soetaert <k.soetaert@nioo.knaw.nl>}
\examples{mol.vol() # 24.46559
plot(0:30,mol.vol(T=0:30),xlab="Temperature, dgC",ylab="Molar volume")}
\seealso{\code{\link{mol2l}} and \code{\link{l2mol}} which converts from mol to liter and vice versa for any gas}
\keyword{utilities}

