
##########################################################################
#  Heat Capacity of sea water
##########################################################################

cp <- function (S=35 ,# -
                T=25, # dgC
                P=0)  # bar

#=========================================================================
# using UNESCO 1983 polynomial.
#
# units in J kg-1 dgC^-1
# REFERENCES:
#    Fofonoff, P. and Millard, R.C. Jr
#    Unesco 1983. Algorithms for computation of fundamental properties of
#    seawater, 1983. _Unesco Tech. Pap. in Mar. Sci._, No. 44, 53 pp.
#=========================================================================
# Check: CPSW = 3849.500 J/(kg dg.C) for S = 40, T=40, P=10000
{

S3_2  = S*sqrt(S)

# eqn 26 p.32
# specific heat for P=0
c0 = 4217.4
c1 =   -3.720283
c2 =    0.1412855
c3 =   -2.654387e-3
c4 =    2.093236e-5

a0 = -7.64357
a1 =  0.1072763
a2 = -1.38385e-3

b0 =  0.1770383
b1 = -4.07718e-3
b2 =  5.148e-5

Cpst0 =  c0 + c1*T + c2*T^2 + c3*T^3 + c4*T^4 +
        (a0 + a1*T + a2*T^2)*S +
      	(b0 + b1*T + b2*T^2)*S*sqrt(S)

# eqn 28 p.33
# pressure and temperature terms for S=0
a0 = -4.9592e-1
a1 =  1.45747e-2
a2 = -3.13885e-4
a3 =  2.0357e-6
a4 =  1.7168e-8

b0 =  2.4931e-4
b1 = -1.08645e-5
b2 =  2.87533e-7
b3 = -4.0027e-9
b4 =  2.2956e-11

c0 = -5.422e-8
c1 =  2.6380e-9
c2 = -6.5637e-11
c3 =  6.136e-13

del_Cp0t0 =  (a0 + a1*T + a2*T^2 + a3*T^3 + a4*T^4)*P +
	           (b0 + b1*T + b2*T^2 + b3*T^3 + b4*T^4)*P^2 +
             (c0 + c1*T + c2*T^2 + c3*T^3)*P^3

# eqn 29 p.34
# pressure and temperature terms for S>0

d0 =  4.9247e-3
d1 = -1.28315e-4
d2 =  9.802e-7
d3 =  2.5941e-8
d4 = -2.9179e-10

e0 = -1.2331e-4
e1 = -1.517e-6
e2 =  3.122e-8

f0 = -2.9558e-6
f1 =  1.17054e-7
f2 = -2.3905e-9
f3 =  1.8448e-11

g0 =  9.971e-8

h0 =  5.540e-10
h1 = -1.7682e-11
h2 =  3.513e-13

j1 = -1.4300e-12


del_Cpstp = ((d0 + d1*T + d2*T^2 + d3*T^3 + d4*T^4)*S +
             (e0 + e1*T + e2*T^2)*S3_2)*P             +
	          ((f0 + f1*T + f2*T^2 + f3*T^3)*S          +
	            g0*S3_2)*P^2                            +
            ((h0 + h1*T + h2*T^2)*S                   +
	            j1*T*S3_2)*P^3

# specific heat
cp = Cpst0 + del_Cp0t0 + del_Cpstp

return(cp)
}

##########################################################################
# Coriolis factor as a function of latitude
##########################################################################

coriolis <- function (lat)  # latitude in degrees north (-90:+90)
  2* 7.292e-5 *sin(pi/180*lat)

#=========================================================================
# Coriolis force: 2*omega*sin(lat), omega=7.292e-5 radians/sed, lat
# coriolis factor is in per second
# reference
#   S. Pond & G.Pickard  2nd Edition 1986
#   Introductory Dynamical Oceanogrpahy
#   Pergamon Press Sydney.  ISBN 0-08-028728-X
#
# omega from:
#
#   A.E. Gill 1982. p.597
#   "Atmosphere-Ocean Dynamics"
#   Academic Press: New York.  ISBN: 0-12-283522-0
#=========================================================================
  


##########################################################################
# Saturated concentrations for oxygen, N2 and Ar
##########################################################################

satconc <- function (S=35,        # Salinity
                     T=25,        # Temperature
                     P=1)         # Pressure (atm)
{
#=========================================================================
# calculates the saturated concentration (solubility) of oxygen,
# for given temperature and salinity
# return in µmol/l 
# REFERENCES:
#    Weiss, R. F. 1970
#    "The solubility of nitrogen, oxygen and argon in water and seawater."
#    Deap-Sea Research., 1970, Vol 17, pp721-735.
#=========================================================================

#  T in degrees Kelvin

TT= 273.15 + T

# constants for Eqn (4) of Weiss 1970
#      O2,             N2              Ar
a1 = c(-173.4292   , -172.4965   ,  -173.5146   )
a2 = c( 249.6339   ,  248.4262   ,   245.4510   )
a3 = c( 143.3483   ,  143.0738   ,   141.8222   )
a4 = c( -21.8492   ,  -21.7120   ,   -21.8020   )
b1 = c(  -0.033096 ,   -0.049781 ,    -0.034474 )
b2 = c(   0.014259 ,    0.025018 ,     0.014934 )
b3 = c(  -0.0017000,   -0.0034861,    -0.0017729)

# Eqn (4) of Weiss 1970
sat <- NULL

for (i in 1:3)
{
lnC = a1[i] + a2[i]*(100/TT) + a3[i]*log(TT/100) + a4[i]*(TT/100) +
      S*( b1[i] + b2[i]*(TT/100) + b3[i]*((TT/100)^2) )
sat  = cbind(sat,exp(lnC))
}
# ml/l-> convert to µmol/l
sat <- sat*1000* l2mol(x=1,T=T,P=P,a=0,b=0)

colnames(sat) <- c("O2","N2","Ar")

return (as.data.frame(sat))
}



##########################################################################
# salinity-chlorinity conversion and concentrations in marine water
##########################################################################

sal2cl <- function(S=35) # salinity
          S/1.80655      # chlorinity, in g/kg
# in g/kg
# from Wooster et al.,1969

##########################################################################

# µmol/kg solution
salconc <- function(S=35)
{
 Borate   = 4.16e2*S/35                # Millero 95
 Calcite  = 0.01028e6 *S/35            # Millero 95
 Sulphate = sal2cl(S)*0.14e6*1/96.062  # Morris & Riley 1966. Deep-See Res. 13:699-705
 Fluoride = sal2cl(S)*67/18.9984       # Riley 1965.Deep-Sea Res. 12:219-220
 return(data.frame(Borate=Borate,
                   Calcite=Calcite,
                   Sulphate=Sulphate,
                   Fluoride=Fluoride))
}

