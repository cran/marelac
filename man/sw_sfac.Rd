\name{sw_sfac}
\docType{data}
\alias{sw_sfac}
\title{Salinity conversion factors}
\description{Factors to convert from practical to absolute salinity and
  vice versa.
}
\usage{sw_sfac}
\format{
  A list with the following:
  \describe{
    \item{longs}{ the longitude, a vector with 91 elements, range (0,360),
      third dimension in \code{del\_sa},
    }
    \item{lats}{ the latitude, second dimension in \code{del\_sa}, a vector
      with 44 elements, range (-82,90),
    }
    \item{p}{ dbar , the first dimension in \code{del\_sa}, a vector
      with 45 elements, range(0,6131),
    }
    \item{ndepth}{ the number of depth intervals at a certain lat,long,
      a matrix of dimension (4,91),
    }
    \item{del\_sa}{ the salinity anomaly, an array with dimension (45,44,91),
      i.e. for (p, lats, longs) values.
    }
  }
}
\author{Karline Soetaert <k.soetaert@nioo.knaw.nl>}
\examples{

mf <- par(mfrow=c(2,1))
ma <- par(mar=c(3,5,2,5))

dsal <- t(sw_sfac$del_sa[1,,])
dsal [dsal < -90]<-NA
image(sw_sfac$longs, sw_sfac$lats, dsal, col=femmecol(100),
      asp=TRUE,xlab="dg",ylab="dg",
      main="salinity conversion - p = 0 bar")
contour(sw_sfac$longs, sw_sfac$lats, dsal, asp=TRUE, add=TRUE)

dsal <- t(sw_sfac$del_sa[5,,])  # 5th depth level sw_sfac$p[5]
dsal [dsal < -90]<-NA
image(sw_sfac$longs, sw_sfac$lats, dsal, col=femmecol(100),
      asp=TRUE, xlab="dg", ylab="dg",
      main="salinity conversion - p = 4 bar")
contour(sw_sfac$longs, sw_sfac$lats, dsal, asp=TRUE, add=TRUE)

par("mfrow"=mf)
par("mar"=ma)
}
\references{

  Millero FJ, Feistel R, Wright DG and McDougall TJ, 2008.
  The composition of Standard Seawater and the definition of the
  Reference-Composition Salinity Scale, Deep-Sea Res. I, 55, 50-72.
  
  McDougall TJ, Jackett DR  and Millero FJ, 2009. An algorithm
  for estimating Absolute Salinity in the global ocean. Ocean Science
  Discussions 6, 215-242.
  \url{http://www.ocean-sci-discuss.net/6/215/2009/} 
  
  Uses the Fortran code written by David Jackett
  \url{http://www.marine.csiro.au/~jackett/TEOS-10/}
}
\seealso{
\code{\link{convert_PStoAS}}, to convert from practical salinity to
  absolute salinity

\code{\link{convert_AStoPS}}, to convert from absolute salinity to
  practical salinity
}
\keyword{datasets}

