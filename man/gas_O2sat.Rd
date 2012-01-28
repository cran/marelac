\encoding{latin1}
\name{gas_O2sat}
\alias{gas_O2sat}

\title{Saturation Concentration of Oxygen in Water}
\description{
  Empirical formulae that can be used to compute saturation
  concentration of oxygen in water in \eqn{mg/L}{mg L^{-1}}
}
\usage{
gas_O2sat(S = 35, t = 25, masl = 0, method = c("Weiss", "APHA", "Paul"))
}

\arguments{
  \item{S}{salinity (dimensionless, for method "Weiss" only),}
  \item{t}{Temperature in \eqn{^\circ}{degrees }C,}
  \item{masl}{height above sea level (in m, for method "Paul" only),}
  \item{method}{formula to be used, see references for correct
    application.
  }
  
}
\details{
  
  Method APHA is the standard formula in Limnology, method Weiss the
  standard formula in marine sciences. The method after Paul is a simple
  formula fitted on available tables. To avoid confusion between the
  arguments (S, t, masl) it is advisable to use named arguments in
  general, e.g. \code{O2sat(t = 4)}.
  
}
\value{
  Vector with oxygen saturation concentration in \eqn{mg L^{-1}}{mg/L}.
}

\references{
American Public Health Association, Inc. (1985): Standard Methods for
the Examination of Water and Wastewater. 18th edition, 1992.

Benson BB and Krause D, 1980. The concentration and isotopic
fractionation of gases dissolved in freshwater in equilibrium with the
atmosphere. I. Oxygen.  Limnology and Oceanography 25, 662-671.

Brown LC and Barnwell TO Jr, 1987. The Enhanced Stream Water
Quality Models QUAL2E and QUAL2E-UNCAS: Documentation and User
Manual. U.S. Environmental Protection Agency, Athens,
Georgia. EPA/600/3-87/007, p. 41. http://www.epa.gov)

DIN 38408-23, Ausgabe:1987-11: Deutsche Einheitsverfahren zur Wasser-,
Abwasser- und Schlammuntersuchung; Gasf\enc{ö}{oe}rmige Bestandteile
(Gruppe G); Bestimmung des Sauerstoffs\enc{ä}{ae}ttigungsindex (G 23).

Paul L, 1985. Das thermische Regime der Talsperre Saidenbach und
einige Beziehungen zwischen abiotischen und biotischen
Komponenten. Dissertation, TU Dresden, Fakult\enc{ä}{ae}t Bau-, Wasser-
und Forstwesen. 84 pp.

Weiss R, 1970. The solubility of nitrogen, oxygen, and argon in water
and seawater. Deep-Sea Research 17, 721-35.

Wagner R, 1979. Die Praxis der Bestimmung des biochemischen
Sauerstoffbedarfs - Ergebnisse einer Umfrage (Berichtigung und
Erg\enc{ä}{ae}nzung zur Ver\enc{ö}{oe}ffentlichung). Vom Wasser 53,
S. 283-285.
}

\seealso{\code{\link{gas_satconc}} for other gas species and explicit
  consideration of pressure.}

\examples{
gas_O2sat(S = 0, t = 20)                  # fresh water, Weiss formula
gas_O2sat(S = 0, t = 20, method = "APHA") # fresh water, APHA formula

## compare this with
gas_satconc(S = 0, t = 20, species = "O2") * molweight("O2") / 1000

T <- seq(0, 30, 0.1)
plot(T, gas_O2sat(S = 0, t = T, method = "APHA"),
  ylab="O2 sat (mg/L)", type = "l", ylim = c(0, 15))
lines(T, gas_O2sat(S = 0, t = T, method = "Weiss"),
  col = "blue", lwd = 2, lty = "dashed")
lines(T, gas_O2sat(S = 5, t = T, method = "Weiss"), col = "green")
lines(T, gas_O2sat(S = 10, t = T, method = "Weiss"), col = "yellow")
lines(T, gas_O2sat(S = 20, t = T, method = "Weiss"), col = "orange")
lines(T, gas_O2sat(S = 35, t = T, method = "Weiss"), col = "red")

legend("bottomleft", 
  col = c("black", "white", "blue", "green", "yellow", "orange", "red"),
  lty = c(1, 0, 2, 1, 1, 1, 1), lwd = c(1,0 ,2, 1, 1, 1, 1),
  legend=c("freshwater formula", "marine formula:", 
          "S = 0", "S = 5", "S = 10", "S = 20", "S = 35"))
}
\keyword{ misc }

