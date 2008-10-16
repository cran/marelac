\name{Bathymetry}
\docType{data}
\alias{Bathymetry}
\title{World bathymetric data}
\description{This dataset, as used by Andersson et al. (2004) contains elevations, m of
the world at 1 dg intervals.
}
\usage{Bathymetry}
\format{a list with the bathymetry (depth) and hypsometry (altitude) of the world. It contains:
\item x, the latitude
\item y, the longitude
\item z, the height (m)
}
\author{Karline Soetaert <k.soetaert@nioo.knaw.nl>}
\examples{

par(mar=c(2,2,2,2))
image(Bathymetry$x,Bathymetry$y,Bathymetry$z,col=femmecol(100),
      asp=TRUE,xlab="dg",ylab="dg")
contour(Bathymetry$x,Bathymetry$y,Bathymetry$z,asp=TRUE,add=TRUE)


# remove land
zz     <- Bathymetry$z
zz[zz>0]<-0

image(Bathymetry$x,Bathymetry$y,zz,col=c(femmecol(100),"black"),asp=TRUE)
contour(Bathymetry$x,Bathymetry$y,zz,asp=TRUE,add=TRUE)
}
\references{Andersson, H., Wijsman, J., Herman, P., Middelburg, J., Soetaert, K., Heip, C., 2004.
Respiration patterns in the deep ocean. Geophysical Research Letters 31, LO3304.}
\keyword{datasets}

