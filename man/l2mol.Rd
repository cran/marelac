\name{l2mol}
\alias{l2mol}
\title{liter to mol conversion for a gas}
\description{Converts from liter to moles for a gas}
\usage{l2mol(x=1, T=25, P=1, a=0, b=0)}
\arguments{
  \item{x }{Volume of the gas, liter}
  \item{T }{Temperature, dg celsius}
  \item{P }{Pressure, atmosphere}
  \item{a }{Species-specific coefficient, \eqn{dm^6*bar/mol^2}}
  \item{b }{Species-specific coefficient, \eqn{dm^3/mol}}
}
\value{
   mol 
}
\author{Karline Soetaert <k.soetaert@nioo.knaw.nl>}
\examples{#22.4 Liters of Oxygen = 1.00 moles of Oxygen
l2mol(x=8,a=1.382,b=0.03186,T=0)*1000
plot(x<-seq(1,8,by=0.1),l2mol(x=x,a=1.382,b=0.03186,T=0)*1000,
     xlab="ml/l",type="l",ylab="mmol/m3",main="Oxygen conversion")}
\seealso{\code{\link{mol2l}} the inverse function}
\note{the coefficients a and b are species-specific; values of 0 in general give good estimates

  Some values of a and b:
       \tabular{rlll}{
           \tab He \tab 0.034598   \tab 0.023733  \cr
           \tab H2 \tab 0.24646    \tab 0.026665   \cr
           \tab N2 \tab 1.3661     \tab 0.038577  \cr
           \tab oxygen \tab 1.3820     \tab 0.03186
       }}
\keyword{utilities}

