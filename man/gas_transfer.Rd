\name{gas_transfer}
\alias{gas_transfer}
\title{The Gas Transfer Coefficient in m/sec}
\description{
  The gas transfer coefficient, in \eqn{m s^{-1}}{m/sec}, for certain
  gases in seawater (S = 35).
}
\usage{
gas_transfer(t = 25, u10 = 1, species = c("He", "Ne", "N2", "O2", "Ar",
        "Kr", "Rn", "CH4","CO2", "N2O", "CCl2F2", "CCL3F",
        "SF6", "CCl4"),
  method = c("Liss", "Nightingale", "Wanninkhof1", "Wanninkhof2"),
  Schmidt = gas_schmidt(t = t, species = species))
}
\arguments{
  \item{t }{Temperature in \eqn{^\circ}{degrees }C,
  }
  \item{u10 }{wind speed, in m/sec at a nominal height of 10 m above sea
    level,
  }
  \item{species }{character vector with gasses whose gas transfer coefficient
    should be estimated.
  }
  \item{method}{one of "Liss", for Liss and Merlivat, 1986;
    "Nightingale", for Nightingale et al., 2000; "Wanninkhof1", for
    Wanninkhof 1992, or "Wanninkhof2" for Wanninkhof and McGills 1999.
  }
  \item{Schmidt}{the Schmidt number, when given this overrules the
    arguments \code{gas} and \code{t}.
  }
}
\value{
  The gas transfer velocity, for seawater, in \eqn{m s^{-1}}{m/s}.
}
\author{Karline Soetaert <karline.soetaert@nioz.nl>}

\examples{
%% Check measurement units!
%% - hre it is m/s but in Wanninkhof it is cm/hr
%% - Note also that Wanninkhof uses CO2 and not O2, I suggest to change this
useq <- 0:15
plot(useq, gas_transfer(u10 = useq, species = "O2"), type = "l", lwd = 2, xlab = "u10, m/s",
     ylab = "m/s", main = "O2 gas transfer velocity", , ylim = c(0, 0.0003))
lines(useq, gas_transfer(u10 = useq, species = "O2", method = "Nightingale"), lwd = 2, lty = 2)
lines(useq, gas_transfer(u10 = useq, species = "O2", method = "Wanninkhof1"), lwd = 2, lty = 3)
lines(useq, gas_transfer(u10 = useq, species = "O2", method = "Wanninkhof2"), lwd = 2, lty = 4)

legend("topleft", lty = 1:4, lwd = 2,
  legend = c("Liss and Merlivat 1986", "Nightingale et al. 2000",
  "Wanninkhof 1992", "Wanninkhof and McGills 1999"))
}

\references{
  Sarmiento JL and Gruber N, 2006. Ocean Biogeochemical
  Dynamics. Princeton University Press, Princeton. p 85.

  Liss PS and Merlivat L, 1986. Air-sea gas exchange rates:
  introduction and synthesis.  In: the role of air-sea exchange in
  Geochemical cycling, edited by P. Buat-Menard, pp 113-127.  D. Reidel,
  Dordrecht, the Netherlands.

  Nightingale et al., 2000. In situ evaluation of air-sea gas exchange
  prameterizations using novel conservative and volatile tracers. Global
  biogeochemical cycles 14, 373-387.

  Wanninkhof R, 1992. Relationship between wind speed and gas exchange
  over the ocean. Journ. Geophys. Res. 97, 7373-7383.

  Wanninkhof R and McGillis W, 1999. A cubic relationshp between
  air-sea CO2 exchange and wind speed.  Geophys. Res. Lett. 26,
  1889-1892.
}

\seealso{
\code{\link{gas_O2sat}},\code{\link{gas_satconc}},
\code{\link{gas_schmidt}},\code{\link{gas_solubility}},
\code{\link{atmComp}}, \code{\link{vapor}}
}

\keyword{utilities}

