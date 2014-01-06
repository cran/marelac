\name{earth_surf}
\alias{earth_surf}
\alias{earth_dist}
\title{Surface of 1 dg by 1 dg Cells of the Earth}
\description{
  \code{earth_surf} computes the surface of 1d by 1dg grid cells as a function of latitude.
  
  Based on data that give the surface distance per 1 dg change in lat/lon
  from \url{http://en.wikipedia.org/wiki/Latitude}
  
  \code{earth_dist} calculates the distance between two (lat, lon) points
}
\usage{
earth_surf(lat = 0, lon = 0)
earth_dist(alat, alon, blat, blon, method = 1) 
}
\arguments{
  \item{lat }{latitude (-90 - +90).}
  \item{lon }{longitude - not used. }
  \item{alat }{first latitude (-90 - +90).}
  \item{alon }{first longitude (-180, 180).}
  \item{blat }{second latitude (-90 - +90).}
  \item{blon }{second longitude (-180, 180).}
  \item{method }{an integer indicating the formula to use, either the 
                 spherical law of cosines (\code{1}) or the haversine formula (\code{2})}
}
\value{
  Surface of the grid cell, in \eqn{m^2}{m2}.
  
  Distance between the points (alat, alon), (blat, blon), m.
}
\author{Karline Soetaert <karline.soetaert@nioz.nl>}
\examples{

 earth_surf(seq(0, 90, by = 15))

 SURF <- outer(X = Bathymetry$x,
               Y = Bathymetry$y,
               FUN <- function(X, Y) earth_surf(Y, X))

 earth_dist(10, 80, 10, 81)
 earth_dist(20, 80, 20, 81)

 SURF <- outer(X = Bathymetry$x,
               Y = Bathymetry$y,
               FUN <- function(X, Y) earth_surf(Y, X))

 sum(SURF)                                   #is: 510,072,000  km2

# the surface of the Oceans, m2
 sum(SURF*(Bathymetry$z < 0))                  # is: 3.58e14

# the volume of the Oceans, m3
- sum(SURF*Bathymetry$z*(Bathymetry$z < 0))    # is: 1.34e+18

# the surface area at several depths
SurfDepth <- vector()

dseq <- seq(-7500, -250, by = 250)

for (i in 2:length(dseq)) {
  ii <- which (Bathymetry$z > dseq[i-1] & Bathymetry$z <= dseq[i])
  SurfDepth[i-1]<-sum(SURF[ii])
}

plot(dseq[-1], SurfDepth, xlab = "depth, m", log = "y",
     ylab = "m2", main = "Surface at ocean depths")

}
\seealso{
\code{\link{Bathymetry}}, \code{\link{Oceans}}
}

\keyword{utilities}

