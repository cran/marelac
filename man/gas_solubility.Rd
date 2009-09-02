\name{gas_solubility}
\alias{gas_solubility}
\title{
  Solubility Parameters
}
\description{
  Solubility parameters SA, \eqn{mmol m^{-3} bar^{-1}}{mmol/m3/bar},
  calculated from the Bunsen solubility coefficients and the volumetric
  solubility coefficients.
}
\usage{
gas_solubility(S = 35, t = 25, species = c("He","Ne","N2","O2",
  "Ar","Kr","Rn","CH4","CO2","N2O","CCl2F2","CCl3F","SF6","CCl4"))
}
\arguments{
  \item{S }{salinity, -}
  \item{t }{temperature, \eqn{^\circ}{degrees }C,}
  \item{species }{The gas  }
}
\value{
  The solubility, mmol/m3/bar.
}
\author{
  Karline Soetaert <k.soetaert@nioo.knaw.nl>
}
\examples{
gas_solubility(t = 1:20,S = 35, species = "CO2")
gas_solubility(t = 0:5,S = 35,species = "O2")

Temp <- seq(from = 0, to = 30, by = 0.1)
mf <- par(mfrow = c(1, 2))
gs  <-gas_solubility(t=Temp)
species   <- c("CCl4","CO2","N2O","Rn","CCl2F2")
matplot(Temp,gs[,species],type="l",lty=1,lwd=2,xlab="temperature",
     ylab="mmol/m3",main="solubility (S=35)")
legend("topright",col=1:5,lwd=2,legend=species)

species2 <- c("Kr","CH4","Ar","O2","N2","Ne")
matplot(Temp,gs[,species2],type="l",lty=1,lwd=2,xlab="temperature",
     ylab="mmol/m3",main="solubility (S=35)")
legend("topright",col=1:6,lwd=2,legend=species2)




plot(Temp,gas_solubility(t = Temp, species = "CCl4"), xlab = "temperature",
     ylab = "mmol/m3/atm", main = "solubility (S=35)",
     type = "l", lwd = 2, ylim = c(0, 100000))
lines(Temp,gas_solubility(t = Temp, species = "CO2"), col = "red", lwd = 2)
lines(Temp,gas_solubility(t = Temp, species = "N2O"), col = "blue", lwd = 2)
lines(Temp,gas_solubility(t = Temp, species = "Rn"), col = "green", lwd = 2)
lines(Temp,gas_solubility(t = Temp, species = "CCl2F2"), col = "yellow", lwd = 2)

legend("topright", col = c("black","red","blue","green","yellow"), lwd = 2,
       legend = c("CCl4","CO2","N2O","Rn","CCl2F2"))

plot(Temp, gas_solubility(t = Temp, species = "Kr"), xlab = "temperature",
     ylab = "mmol/m3/atm", main = "solubility (S=35)", type = "l",
     lwd = 2, ylim = c(0, 4000))
lines(Temp, gas_solubility(t = Temp, species = "CH4"), col = "red", lwd = 2)
lines(Temp, gas_solubility(t = Temp, species = "Ar"), col = "blue", lwd = 2)
lines(Temp, gas_solubility(t = Temp, species = "O2"), col = "green", lwd = 2)
lines(Temp, gas_solubility(t = Temp, species = "N2"), col = "yellow", lwd = 2)
lines(Temp, gas_solubility(t = Temp, species = "Ne"), col = "grey", lwd = 2)

legend("topright",col = c("black", "red", "blue", "green", "yellow", "grey"),
       lwd = 2, legend = c("Kr", "CH4", "Ar", "O2", "N2", "Ne"))

par(mfrow = mf)

## generate table 3.2.3 from Sarmiento and Gruber
Temp <- seq (0,30,by = 5)

## saturated concentrations in mmol/m3 at at 1 atm;
# convert from /bar to /atm using 1.013253

A <- data.frame(cbind( t = Temp,
            He = gas_solubility(t = Temp,species = "He")*1.013253,
            Ne = gas_solubility(t = Temp,species = "Ne")*1.013253,
            N2 = gas_solubility(t = Temp,species = "N2")*1.013253,
            O2 = gas_solubility(t = Temp,species = "O2")*1.013253,
            Ar = gas_solubility(t = Temp,species = "Ar")*1.013253,
            Kr = gas_solubility(t = Temp,species = "Kr")*1.013253,
            Rn = gas_solubility(t = Temp,species = "Rn")*1.013253)  )
format(A,digits = 4)
## table values at
## 0   dgC:  349.4   448.6   818.8  1725  1879  3820  31150
## 20 dg C:  332.9   390.7   557.9  1126  1236  2241  14130
## note the (very) slight deviations for Rn

## saturated concentrations in micromol/m3 at 1 atm
AA <- data.frame(cbind( t = Temp,
            CH4    = gas_solubility(t = Temp,species = "CH4")   *1.013253,
            CO2    = gas_solubility(t = Temp,species = "CO2")   *1.013253,
            N2O    = gas_solubility(t = Temp,species = "N2O")   *1.013253,
            CCL2F2 = gas_solubility(t = Temp,species = "CCl2F2")*1.013253,
            CCL3F  = gas_solubility(t = Temp,species = "CCl3F") *1.013253,
            SF6    = gas_solubility(t = Temp,species = "SF6")   *1.013253,
            CCl4   = gas_solubility(t = Temp,species = "CCl4")  *1.013253))
format(AA,digits = 4)

## Table values at
##  0 dgC: 1984  64400 47840  6686 27380   425.2  97114
## 20 dgC: 1241  33110 23870  2566  9242   195.8  30307
## Note: there are slight deviations for CO2, and N2O!
}
\note{
  The molar volume used for the Bensen coefficient conversion is the
  ideal gas value of 22.4136 l/mol.

  These coefficients are to be used with pAmoist, the partial pressure
  of the gas in moist air.

  To convert them for use with partial pressure in dry air, divide by
  (1-vapor(S,t)).
}
\references{
  Sarmiento JL and Gruber N, 2006. Ocean Biogeochemical
  Dynamics. Princeton University Press, Princeton. p 85.

  who cite:

  for He and Ne: Weiss R, 1971. Solubility of helium and neon in water
  and seawater. Journ. Chem. Eng. Data 16, 235-241.

  N2, O2 and Ar: Weiss R, 1970. The solubility of nitrogen, oxygen, and
  argon in water and seawater. Deep-Sea Res. 17, 721-35.

  Kr: Weiss R and Kyser TK, 1978. Silubility of Krypton in water
  and seawater. Journ. Chem. Eng. Data 23, 69-72.

  Rn: Hackbusch 1979. Eine Methode zur Bestimmung der Diffusions,
  Loeslichkeits un Permeabilitats Konstanten von Radon-222 in Wasser und
  Meereswasser. Dissertation, University of Heidelberg, Germany.

  CH4: Wiesenburg DA and  Guinasso JNL, 1979. Equilibrium
  solubilities of methane, carbon monoxide and hydrogen in water and sea
  water. Journ. Chem. Eng. Data 24, 256-360.

  CO2 and N2O: Weiss R and  Price BA, 1980. Nitrous oxide solubility
  in wate and sewater. Mar. Chem. 8, 347-359.

  CFC-11 and CFC-12: Warner MJ and Weiss R, 1985. Solubilities of
  chlorofluorocarbons 11 and 12 in water and sewater. Deep-Sea Res. 32,
  1485-1497.

  SF6: Bullister et al., 2002. The solubility of sulfur hexafluroide in
  water and sewater. Deep-Sea Res. I, 49, 175-188.

  CCl4: Bullister JL and  Wisegarver DP, 1998.  The solubility of
  carbon tetrachloride in water and seawater. Deep-Sea Res. I,
  1285-1302.

}
\seealso{
\code{\link{gas_O2sat}}, \code{\link{gas_satconc}},
\code{\link{gas_schmidt}}, \code{\link{gas_transfer}},
\code{\link{atmComp}}, \code{\link{vapor}}
}
\keyword{utilities}

