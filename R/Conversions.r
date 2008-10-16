

mol.weight <- function(species)  # chemical species whose molecular weight should be estimated
# converts from mol to g

{
  SP <- toupper(species)
  switch(SP,
         C     = AtomicWeight$C,
         O     = AtomicWeight$O,
         H     = AtomicWeight$H,
         N     = AtomicWeight$N,
         S     = AtomicWeight$S,
         P     = AtomicWeight$P,
         SI    = AtomicWeight$Si,
         B     = AtomicWeight$B,
         CO2   = AtomicWeight$C+2*AtomicWeight$O,
         CO3   = AtomicWeight$C+3*AtomicWeight$O,
         HCO3  = AtomicWeight$H+AtomicWeight$C+3*AtomicWeight$O,
         NO3   = AtomicWeight$N+3*AtomicWeight$O,
         NH3   = AtomicWeight$N+3*AtomicWeight$H,
         NH4   = AtomicWeight$N+4*AtomicWeight$H,
         HS    = AtomicWeight$S+AtomicWeight$H,
         SO4   = AtomicWeight$S+4*AtomicWeight$O,
         HSO4  = AtomicWeight$H+AtomicWeight$S+4*AtomicWeight$O,
         PO4   = AtomicWeight$P+4*AtomicWeight$O,
         HPO4  = AtomicWeight$H+AtomicWeight$P+4*AtomicWeight$O,
         H2PO4 = 2*AtomicWeight$H+AtomicWeight$P+4*AtomicWeight$O,
         H3PO4 = 3*AtomicWeight$H+AtomicWeight$P+4*AtomicWeight$O,
         SIOH4 = AtomicWeight$Si+AtomicWeight$O+4*AtomicWeight$H,
         SIO2  = AtomicWeight$Si+2*AtomicWeight$O,
         BOH3  = AtomicWeight$B+AtomicWeight$O+3*AtomicWeight$H,
         NA     )
}

g2mol <- function(species)  # chemical species whose weight must be converted to mol
   1/mol.weight(species)

##########################################################################
# molar volume of ideal gas
##########################################################################

mol.vol <- function(T=25,     # temperature, dg celsius
                        P=1)      # pressure, atmosphere

{
#  T in degrees Kelvin
T = 273.15 + T
R = 0.082058  # liter-atm / mole-K

return(R* T / P)  # molar volume of an ideal gas
}

##########################################################################
# mol to liter and liter to mol conversion for a gas
##########################################################################

mol2l <- function(x=1,      # mol of the gas               
                  T=25,     # temperature, dg celsius
                  P=1,      # pressure, atmosphere
                  a=0,      # dm^6*bar/mol^2
                  b=0)      # dm3/mol
#     a         b
# He 0.034598   0.023733
# H2 0.24646    0.026665
# N2 1.3661     0.038577
# O2 1.3820     0.03186

{
#  T in degrees Kelvin
T = 273.15 + T
R = 0.082058

#V=xRT/P ;    R=0.0821 liter-atm / mole-K
if (a==0 & b==0) V=  x*R* T / P else V = uniroot(fun<- function (V)((P+x*x*a/(V^2))*(V/x-b)-R*T),c(-10,1e6))$root

return(V)  # volume, liter
}

# The reverse: liter to mol
l2mol <- function(x=1, # litre of the gas             
                  T=25,# temperature, dg celsius    
                  P=1, # pressure, atmosphere       
                  a=0, # dm^6*bar/mol^2             
                  b=0) # dm3/mol                    
x/mol2l(1,T,P,a,b)     # mole of gas



