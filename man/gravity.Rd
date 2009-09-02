\name{gravity}
\alias{gravity}
\title{Gravity on Earth}
\description{
  Computes the gravity, based on latitude.
}
\usage{
gravity(lat = 0, method=c("Moritz","UNESCO"))
}
\arguments{
  \item{lat }{latitude (-90 - +90).}
  \item{method }{When "UNESCO", uses the UNESCO (1983) polynomial, else
    according to Moritz, 2000
  }
}
\value{
  Gravity, in \eqn{\rm m\,sec^{-2}}{m/s2}.
}
\author{Karline Soetaert <k.soetaert@nioo.knaw.nl>}
\examples{
gravity(lat = 30)}
\references{
The UNESCO polynomial:

  Fofonoff NP and Millard RC Jr, 1983. Algorithms for computation of
  fundamental properties of seawater. UNESCO technical papers in marine
  science, 44, 53 pp.\cr
  \url{http://unesdoc.unesco.org/images/0005/000598/059832EB.pdf}

  Moritz H, 2000. Geodetic reference system 1980. Journal of Geodesy 74,
  128-133.
}
\seealso{
\code{\link{coriolis}}, \code{\link{viscosity}},
\code{\link{diffcoeff}}, \code{\link{ssd2rad}}, \code{\link{vertmean}}
}
\keyword{utilities}

