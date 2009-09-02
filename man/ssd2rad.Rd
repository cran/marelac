\encoding{latin1}
\name{ssd2rad}
\alias{ssd2rad}
\title{Estimate Global Radiation from Measured Sunshine Duration Time}
\description{
  The function converts values of sunshine duration (in hours) to global
  radiation (in \eqn{J m^{-2} s^{-1}}{J/m2/s}).
}

\usage{
ssd2rad(S, doy, a = 0.25, b = 0.5, rho = 50.29)
}
\arguments{
  \item{S}{Sunshine duration (hours)}
  \item{doy}{Julian day (for northern hemisphere only)}
  \item{a, b, rho}{site specific conversion parameters, must be fitted
    to measured data.
  }
}
\note{
  Don't forget to fit the function parameters to site specific values!
}


\value{
  Estimated value of global radiaton in \eqn{J m^{-2} s^{-1}}{J/m2/s}.
}

%% ToDo: find international reference or remove function from package
\references{
  Dyck S and Peschke G., 1995. Grundlagen der Hydrologie. 3. Auflage.
  Verlag f\enc{ü}{ue}r Bauwesen, Berlin 1995, ISBN 3-345-00586-7.
}

\examples{
ssd2rad(8, 120)
}
\seealso{
\code{\link{coriolis}}, \code{\link{viscosity}},
\code{\link{diffcoeff}}, \code{\link{vertmean}},
\code{\link{gravity}}
}
\keyword{ misc }
