\name{molvol}
\alias{molvol}
\title{Mol to Liter Conversion for a Gas}
\description{Converts from liter to moles for a gas.}
\usage{molvol(t = 25, P = 1.013253,
   species = c("ideal", "Ar", "CO2", "CS2", "CO", "CCl4", "Cl2",
         "C2H6S", "C2H5OH", "C6H5F", "CH3F", "CH4", "CH3OH", "C5H12",
          "C3H8", "H2O", "He", "H2", "HBr", "HCl", "H2S", "Hg",
          "Kr", "NH3", "Ne", "NO", "N2", "NO2", "N2O", "O2", "PH3",
          "SiH4", "SiF4", "SO2", "Xe"),
    quantity = 1, a = 0, b = 0)}
\arguments{
  \item{t }{temperature, \eqn{^\circ}{degrees }C
  }
  \item{P }{True pressure, bar.
  }
  \item{species }{character vector with gasses whose molecular volume
    should be estimated. if \code{NULL} then the coefficients \code{a} and
    \code{b} are used.
  }
  \item{quantity }{ mol of the gas.
  }

  \item{a }{Van der Waals constant a, a species-specific coefficient,
    \eqn{dm^6*bar/mol^2}.
  }
  \item{b }{Van der Waals constant b, a species-specific coefficient,
    \eqn{dm^3/mol}.
  }
}
\value{
  volume of the gas, liter
}
\author{Karline Soetaert <k.soetaert@nioo.knaw.nl> }
\examples{
#molecular volume of an ideal gas.
molvol(species = "ideal", P = 1, t=0)    # 22.710 980
molvol(species = "ideal", P = 1, t=25)   # 24.789 598

plot(0:30, molvol(t = 0:30, species = NULL),
    xlab = "Temperature, dgC", ylab = "Molar volume")

#
molvol(a = 1.382, b = 0.03186, species=NULL, t = 0)

molvol(t = 0, species = "O2")

# the same but for all gasses
molvol(t = 0)

# table for different pressures
molvol(P = 1:5, species = "O2")

# the inverse function
1/molvol(species="O2")

# contour plot
P   <- seq(1, 100, by=1)
Temp<- seq(-5, 40, by=1)

Val <- outer(X=P, Y=Temp, FUN=function(X, Y) molvol(P=X,  t=Y, species="O2"))
contour(P, Temp, Val, xlab="pressure", ylab="temperature",
        main="molvol", nlevel=20, log="x")

}

\seealso{
\code{\link{AtomicWeight}}, \code{\link{molweight}},
\code{\link{redfield}}
}
\note{
  The coefficients a and b are species-specific; values of 0 assume an
  ideal gas and in general give good estimates.

  Use \code{1/molvol} to convert from liter to moles.

  The default calculates the molar volume of an ideal gas
}
\references{
  The values of the van der Waals constants are from:

  Weast RC (Ed.) 1972. Handbook of Chemistry and Physics (53rd Edn.),
  Cleveland:Chemical Rubber Co.
  
  as found in:
  \url{http://en.wikipedia.org/wiki/Van\_der\_Waals\_constants\_(data_page)}
}

\keyword{utilities}

