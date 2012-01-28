\name{convert_salinity}
\alias{convert_PStoAS}
\alias{convert_AStoPS}
\title{Practical - Absolute Salinity Conversions}
\description{Conversion from practical to absolute salinity and vice versa.
}
\usage{
convert_PStoAS(S = 35, p = max(0, P - 1.013253), P = 1.013253,
  lat = NULL, lon = NULL, DSi = NULL,
  Ocean = c("Global", "Atlantic", "Pacific", "Indian", "Southern"))

convert_AStoPS(S = 35, p = max(0, P - 1.013253), P = 1.013253,
  lat = NULL, lon = NULL, DSi = NULL,
   Ocean = c("Global","Atlantic","Pacific","Indian","Southern"))

}
\arguments{
  \item{S }{Salinity, either practical salinity (\code{convert_PStoAS}),
    dimensionless or absolute salinity (\code{convert_AStoPS}, g/kg)
  }
  \item{p }{gauge or applied pressure, pressure referenced against the
            local atmospheric pressure, bar
  }
  \item{P }{true pressure, bar
  }
  \item{lat }{latitude (-90 to +90)
  }
  \item{lon }{longitude (0 to 360)
  }
  \item{DSi }{the silicate concentration, in micromol/kg
  }
  \item{Ocean }{the ocean in which the measurement was taken; only
    used if \code{DSi} is not \code{NULL}
  }

}

\value{
  The absolute salinity (\code{convert_PStoAS}) or practical salinity
  (\code{convert_AStoPS}).
}
\details{
Absolute salinity (g kg-1) is estimated from Practical salinity as:

AS= 35.16504 /35 * PS + delt()

where delt is the absolute salinity anomaly. There are two ways in which to
estimate the salinity anomaly

1. If DSi is not given a value, then the anomaly is estimated as a function of
longitude \code{lon}, latitude \code{lat} and pressure \code{p}, using the
lookup table as in \code{sw_sfac}.

2. If \code{DSi} is given a value, then a regression on it is used, based on the
values of \code{Ocean} and -except for the "global" ocean- the latitute
\code{lat}:

 \describe{
    \item{"Global"}{a global estimate is used,

    delt= 9.824e-5 *DSi, }
    \item{"Southern"}{the Southern Ocean (\code{lat} < -30),

      delt= 7.4884e-5 *DSi, }
    \item{"Pacific"}{the Pacific Ocean ,
    
      delt= 7.4884e-5 *(1 + 0.3622[\code{lat}/30 + 1])*DSi, }
    \item{"Indian"}{the Indian Ocean ,

      delt= 7.4884e-5 *(1 + 0.3861[\code{lat}/30 + 1])*DSi, }
    \item{"Atlantic"}{the Atlantic Ocean ,

      delt= 7.4884e-5 *(1 + 1.0028[\code{lat}/30 + 1])*DSi, }
 }
Note that for the Pacific, Indian and Atlantic Ocean regression,
the latitude is needed. If \code{lat} is \code{NULL} then the \code{Global}
regression will be used.
}

\author{Karline Soetaert <karline.soetaert@nioz.nl>}

\examples{
# check values: should be 35.7
convert_PStoAS(S = 35.52764437773386, p = 102.3, lon = 201, lat = -21)

# check values: should be 35.52764437773386
convert_AStoPS(S = 35.7, p = 102.3, lon = 201, lat = -21)

#
convert_PStoAS(S = 35)
convert_AStoPS(S = 35)
convert_PStoAS(S = 35, lat = 10, lon = 10, p = 0)

# Based on Si concentration
DSi <- seq(from = 0, to = 200, by = 10)
Global   <-  convert_PStoAS(30, DSi = DSi, Ocean = "Global")
Atlantic <-  convert_PStoAS(30, DSi = DSi, Ocean = "Atlantic", lat = 0)
Pacific  <-  convert_PStoAS(30, DSi = DSi, Ocean = "Pacific", lat = 0)
Indian   <-  convert_PStoAS(30, DSi = DSi, Ocean = "Indian", lat = 0)
Southern <-  convert_PStoAS(30, DSi = DSi, Ocean = "Southern")

matplot(x = DSi, y = cbind(Global, Atlantic, Pacific, Indian, Southern),
  pch = 1, xlab = "DSi, micromol/kg", ylab = "Absolute salinity (PS=30)")
legend("topleft",c("Global", "Atlantic", "Pacific", "Indian", "Southern"),
       col = 1:5, pch = 1)
}
\references{
  Millero FJ, Feistel R, Wright DG and McDougall TJ, 2008.
  The composition of Standard Seawater and the definition of the
  Reference-Composition Salinity Scale, Deep-Sea Res. I, 55, 50-72.
  
  McDougall TJ, Jackett DR and Millero FJ, 2009. An algorithm
  for estimating Absolute Salinity in the global ocean. Ocean Science
  Discussions 6, 215-242.
  \url{http://www.ocean-sci-discuss.net/6/215/2009/}
  
  Uses the Fortran code written by David Jackett.
  \url{http://www.marine.csiro.au/~jackett/TEOS-10/}
}
\seealso{
\code{\link{convert_RtoS}}, \code{\link{convert_StoR}},
\code{\link{convert_StoCl}},
\code{\link{convert_p}}, \code{\link{convert_T}},
}
\keyword{utilities}

