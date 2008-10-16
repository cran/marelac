\name{cp}
\alias{cp}
\title{Heat capacity of sea water}
\description{Estimates the heat capacity of seawater, using the UNESCO 1983 polynomial}
\usage{cp(S=35, T=25, P=0)}
\arguments{
  \item{S }{Salinity, -}
  \item{T }{Temperature, dgC}
  \item{P }{Pressure, bar}
}
\value{
  Heat capacity, in \eqn{J kg^{-1} dgC^{-1}}
}
\author{Karline Soetaert <k.soetaert@nioo.knaw.nl>}
\examples{cp(S=40,T=40,P=1000)}
\references{Fofonoff, P. and Millard, R.C. Jr. Unesco 1983. Algorithms for computation of fundamental properties of
 seawater. Unesco Tech. Pap. in Mar. Sci., No. 44, 53 pp.}
\note{cp for S=40, T=40, P=1000 is 3849.5 J/(kg dgC)}
\keyword{utilities}

