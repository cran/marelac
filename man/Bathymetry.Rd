\name{Bathymetry}
\docType{data}
\alias{Bathymetry}
\title{World Bathymetric Data}
\description{
  This dataset contains the elevation of sea (bathymetry) and land
  (hypsometry) across the globe at 1 degree intervals. Dataset as used
  by Andersson et al. (2004).
}
\usage{Bathymetry}
\format{  
  A list with the bathymetry (depth) and hypsometry (altitude) of the
  world.  It contains:
  \describe{
    \item{x}{the latitude,}
    \item{y}{the longitude,}
    \item{z}{the height (m).}
  }
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
\references{
  Andersson H, Wijsman J, Herman PMJ, Middelburg J, Soetaert K and Heip
  C, 2004. Respiration patterns in the deep ocean.  Geophysical Research
  Letters 31, LO3304.
}

\keyword{datasets}

