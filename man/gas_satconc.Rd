\encoding{latin1}
\name{gas_satconc}
\alias{gas_satconc}
\title{Saturated Concentrations of Gases in Water}
\description{
  Calculates the saturated concentration of several gases in water for a
  given temperature, salinity and pressure.
}
\usage{
gas_satconc(S = 35, t = 25, P = 1.013253,
        species =c("He","Ne","N2","O2","Ar","Kr","CH4","CO2","N2O"),
        atm = atmComp(species))}
\arguments{
  \item{S }{Salinity (dimensionless),}
  \item{t }{Temperature, \eqn{^\circ}{degrees }C,}
  %\item{K }{Temperature, dgK}
  \item{P }{True pressure, bar}
  \item{species }{character vector with gasses whose saturated concentration
    should be estimated.
  }
  \item{atm }{the number of moles of the gas per unit mole of air in the
    atmosphere, the "mixing ratio".  When present, this overrules the
    \code{species} argument. When unspecified, the value from \code{atmComp}
    for the \code{species} is taken.
  }
}
\value{
   The saturated concentration of the gas in \eqn{mmol m^{-3}}{mmol/m3}.
}
\author{Karline Soetaert < k.soetaert@nioo.knaw.nl > }
\examples{
gas_satconc(species = "O2")
Temp <- seq(from = 0, to = 30, by = 0.1)
Sal  <- seq(from = 0, to = 35, by = 0.1)

mf  <- par(mfrow = c(1,2))

species <- c("N2","CO2","O2","CH4","N2O")
gsat  <-gas_satconc(t=Temp, species=species)

matplot(Temp,gsat,type="l",xlab="temperature",log="y", lty=1,
     ylab="mmol/m3",main="Saturated conc (S=35)", lwd=2)
legend("right",col=1:5,lwd=2,legend=species)

gsat  <-gas_satconc(S=Sal,species=species)
matplot(Sal,gsat,type="l",xlab="salinity",log="y", lty=1,
     ylab="mmol/m3",main="Saturated conc (T=20)", lwd=2)
legend("right",col=1:5,lwd=2,legend=species)


par(mfrow = mf)

## generate table 3.2.4 from Sarmiento and Gruber
Temp <- seq (0, 30, by = 5)
## saturated concentrations in mmol/m3, at 1 atm.
A <- data.frame(cbind( t = Temp,
            N2  = gas_satconc(t = Temp, species = "N2"),
            O2  = gas_satconc(t = Temp, species = "O2"),
            CO2 = gas_satconc(t = Temp, species = "CO2"),
            Ar  = gas_satconc(t = Temp, species = "Ar")))
format(A,digits = 4)
## table values
## at  0 dg C: 635.6   359.1  23.37  17.44
## at 20 dg C: 425.7   230.5  11.61  11.29
## note the deviations for CO2 (20dg)!

## saturated concentrations in micromol/m3, at 1 atm.
AA <- data.frame(cbind( t = Temp,
            N2O = gas_satconc(t = Temp, species = "N2O")*1000,
            Ne  = gas_satconc(t = Temp, species = "Ne" )*1000,
            Kr  = gas_satconc(t = Temp, species = "Kr" )*1000,
            CH4 = gas_satconc(t = Temp, species = "CH4")*1000,
            He  = gas_satconc(t = Temp, species = "He" )*1000))
format(AA, digits = 4)
## table values
## at  0 dgC: 14.84 8.11  4.33  3.44  1.81
## at 20 dgC: 7.16  6.94  2.50  2.12  1.70
## Note: different for N2O
}
\note{
  Compared to the table in Sarmiento and Gruber, there is a slight
  deviation for N2O, and He.

  CO2 is OK for temperature 0 only.
}
\references{
  Sarmiento JL and Gruber N, 2006. Ocean Biogeochemical
  Dynamics. Princeton University Press, Princeton. p 85.

  who cite:

  for he and Ne: Weiss R, 1971. Solubility of helium and neon in water
  and seawater. Journ. Chem. Eng. Data 16, 235-241.

  N2, O2 and Ar: Weiss R, 1970. The solubility of nitrogen, oxygen, and
  argon in water and seawater. Deep-Sea Res. 17, 721-35.

  Kr: Weiss R and Kyser TK, 1978. Silubility of Krypton in water
  and seawater. Journ. Chem. Eng. Data 23, 69-72.

  Rn: Hackbusch 1979. Eine Methode zur Bestimmung der Diffusions-,
  L\enc{ö}{oe}slichkeits un Permeabilitats Konstanten von Radon-222 in
  Wasser und Meereswasser. Dissertation, University of Heidelberg,
  Germany.

  CH4: Wiesenburg DA and  Guinasso JNL, 1979. Equilibrium
  solubilities of methane, carbon monoxide and hydrogen in water and sea
  water. Journ. Chem. Eng. Data 24, 256-360.

  CO2 and N2O: Weiss R and Price BA, 1980. Nitrous oxide solubility
  in wate and sewater. Mar. Chem. 8, 347-359.

  CFC-11 and CFC-12: Warner MJ and Weiss R, 1985. Solubilities of
  chlorofluorocarbons 11 and 12 in water and sewater. Deep-Sea Res. 32,
  1485-1497.

  SF6: Bullister et al., 2002. The solubility of sulfur hexafluroide in
  water and sewater. Deep-Sea Res. I, 49, 175-188.

  CCl4: Bullister JL and Wisegarver DP, 1998.  The solubility of
  carbon tetrachloride in water and seawater. Deep-Sea Res. I,
  1285-1302.
}
\seealso{
\code{\link{gas_O2sat}},
\code{\link{gas_schmidt}},\code{\link{gas_solubility}},\code{\link{gas_transfer}},
\code{\link{atmComp}}, \code{\link{vapor}}
}
\keyword{utilities}

