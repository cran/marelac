\name{viscosity}
\alias{viscosity}
\title{shear viscosity of water}
\description{Calculates the shear viscosity of water, in centipoise.
  Valid for 0<T<30 and 0<S<36.
 \cr Based on the code "CANDI" by B.P. Boudreau}
\usage{viscosity(S=35, T=25, P=0)}
\arguments{
  \item{S }{Salinity, -}
  \item{T }{Temperature, degrees C}
  \item{P }{Pressure, atm}
}
\value{
  shear visocisity in centipoise
}
\author{Karline Soetaert <k.soetaert@nioo.knaw.nl>}
\examples{plot(0:30,viscosity(S=35,T=0:30,P=1),xlab="temperature",ylab="centipoise", 
       main="shear viscosity of water",type="l")
  lines(0:30,viscosity(S=0,T=0:30,P=1),col="red")
  lines(0:30,viscosity(S=35,T=0:30,P=100),col="blue")
  legend("topright",col=c("black","red","blue"),lty=1,
        legend=c("S=35,P=1","S=0,P=1","S=35,P=100"))}
\references{Based on the FORTRAN implementation of the diagenetic model "CANDI" of B.P. Boudreau:
\cr Boudreau BP,
A method-of-lines code for carbon and nutrient diagenesis in aquatic sediments. 
COMPUTERS & GEOSCIENCES 22 (5): 479-496 JUN 1996}
\details{The details given in the original code by B. Boudreau are repeated here:
\cr Uses the equation given by Kukulka et al. (1987).}
\keyword{utilities}

