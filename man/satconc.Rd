\name{satconc}
\alias{satconc}
\title{Saturated concentrations for oxygen, N2 and Ar}
\description{Calculates the saturated concentration (solubility) of oxygen,
N2 and Ar, for given temperature and salinity}
\usage{satconc(S=35, T=25, P=1)}
\arguments{
  \item{S }{Salinity, -}
  \item{T }{Temperature, dgC}
  \item{P }{Pressure, atm}
}
\value{
   a data frame with the saturated concentration of O2, N2, and Ar in micromol/l
}
\author{Karline Soetaert <k.soetaert@nioo.knaw.nl>}
\examples{data.frame(Salinity=1:30,satconc(S=1:30,T=0)	)
matplot(1:30,satconc(S=1:30,T=0),xlab="Salinity",ylab="mmol/m3",
        type="l",lwd=2)
legend("topright",c("O2","N2","Ar"),col=1:3,lty=1,lwd=2)
matplot(satconc(S=30,T=-5:35),xlab="Temperature, dgC",ylab="mmol/m3",
        type="l",lwd=2)
legend("topright",c("O2","N2","Ar"),col=1:3,lty=1,lwd=2)}
\references{Weiss, R. F. 1970. The solubility of nitrogen, oxygen and argon in water and seawater.
    Deep-Sea Research 17: 721-735.}
\keyword{utilities}

