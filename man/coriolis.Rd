\name{coriolis}
\alias{coriolis}
\title{The Coriolis Force as a Function of Latitude}
\description{
  Estimates the coriolis factor, f (in \eqn{s^{-1}}{1/second}), where
  \eqn{f = 2 \cdot \omega \cdot sin(lat)}{f = 2*omega*sin(lat)}, where
  \eqn{\omega = 7.292e^{-5}}{omega = 7.292e-5} radians/sec, the
  rotation of the earth.
}
\usage{
coriolis(lat)
}
\arguments{
  \item{lat }{latitude in degrees north (-90 to +90).
  }
}
\value{
  The coriolis factor (\eqn{s^{-1}}{1/second}).
}
\author{Karline Soetaert < karline.soetaert@nioz.nl > }
\examples{
plot(-90:90, coriolis(-90:90), xlab = "latitude, dg North", 
  ylab = "/s", main = "coriolis factor", type = "l", lwd = 2)
}
\references{
  Pond S and Pickard G, 1986. Introductory Dynamical
  Oceanography, Pergamon Press, Sydney, 2nd Ed.
  
  Griffies SM, 2004. Fundamentals of Ocean Climate Models. Princeton, NJ,
  Princeton University Press, 518 pp.
}
\seealso{
\code{\link{viscosity}},
\code{\link{diffcoeff}}, \code{\link{ssd2rad}}, \code{\link{vertmean}},
\code{\link{gravity}}
}
\keyword{utilities}

