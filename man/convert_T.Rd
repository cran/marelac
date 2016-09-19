\name{convert_T}
\alias{convert_T}
\title{Conversion Between Different Temperature Units}
\description{
  The function converts between different units of temperature.
}
\usage{
convert_T(x, unit = c("K", "C", "F"))
}

\arguments{
  \item{x }{Vector of given temperature values,
  }
  \item{unit }{Measurement unit of the given value(s).
  }
}

\value{
  A data frame with converted values.
}
\references{
  Mangum BW and Furukawa GT, 1990. Guidelines for Realizing the
  International Temperature Scale of 1990 (ITS-90). NIST Technical Note
  1265.
  and the url 
  
  http://www.cstl.nist.gov/div836/836.05/papers/magnum90ITS90guide.pdf
}

%\seealso{}
\examples{
convert_T(0, "K")
convert_T(0, "C")
convert_T(0, "F")

convert_T(273.15, "K")
convert_T(-273.15, "C")
convert_T(c(-459.67, 0, 32), "F")

convert_T(32, "F")$C # 0 degrees C

}
\seealso{
\code{\link{convert_AStoPS}}, \code{\link{convert_PStoAS}},
\code{\link{convert_RtoS}}, \code{\link{convert_StoR}},
\code{\link{convert_StoCl}},
\code{\link{convert_p}}
}
\keyword{ misc }

