require(marelac)

# These tests should be ~ exact
SP <- 35.52764437773386
t <-  25.5
p <- 1023/10

S <- AS <- 35.7

longs <- 201
lats  <- -21

convert_PStoAS(SP,p,lat=lats,lon=longs)        -35.7
convert_AStoPS(AS,p,lat=lats,lon=longs)        -35.5276443777339

sw_alpha(S,t,p)                        -0.0003098378393192645
sw_beta(S,t,p)                         -0.0007257297978386655
sw_cp(S,t,p)                           -3974.42541259729
sw_tpot(S,t,p)                         -25.2720983155409
sw_dens(S,t,p)                         -1027.95249315662
sw_enthalpy(S,t,p)                     -110776.712408975
sw_entropy(S,t,p)                      -352.81879771528
sw_kappa(S,t,p)                        -4.033862685464779e-6
sw_kappa_t(S,t,p)                      -4.104037946151349e-6
sw_svel(S,t,p)                         -1552.93372863425

sw_tfreeze(S,t,p)                      #
# Tests the function against the table in Feistel et al., 2009
# There is no match for some of them, as they use different formulation

#testgw <- function()
#{
#table 21
SA       <- c(35.16504        ,100             ,35.16504)
t        <- c(0.0             , 79.85          ,0.0       )
p        <- c(0.0             , 0.0            , 99.898675*10)
g        <- c(0.0             ,-0.295243229e5  ,0.951294557e5)
dg_dSA   <- c(0.639974067e02  , 0.251957276e3  ,-0.545861581e1 )#Jg1
dg_dt    <- c(0.0             ,-0.917529024e3  ,0.160551219e2 )#J kg1K1
dg_dp    <- c(0.972661217e-3  , 0.971006828e-3 ,0.933770945e-3 )#m3 kg1
d2g_dSAdp<- c( -0.759615412e-6,-0.305957802e-6 ,-0.640757619e-6)# m3 g1
d2g_dt2  <- c( -0.145944931e2 ,-0.106092735e2  ,-0.138089104e2 )#J kg1K2
d2g_dt_dp<- c( 0.515167556e-7 , 0.146211315e-5 , 0.245708012e-6 )#m3 kg1K1
d2g_dp2  <- c(-0.450775377e-12,-0.261586665e-12,-0.335796316e-12)# m3 kg1 Pa1
h        <- c(0.0             , 0.294363423e6  , 0.907439992e5)# J kg1
f        <- c(-0.985548978e2  ,-0.296227102e5  , 0.175236121e4)# J kg1
u        <- c(-0.985548978e2  , 0.294265035e6  ,-0.263309532e4)# J kg1
s        <- c(0.0             , 0.917529024e3  ,-0.160551219e2)# J kg1K1
r        <- c(0.102810720e4   , 0.102985888e4  , 0.107092645e4)# kgm3
cp       <- c(0.398648579e4   , 0.374507355e4  , 0.377190387e4)# J kg1K1
c        <- c(0.144900246e4   , 0.396127835e4  , 0.162198998e4)# ms1
mW       <- c(-0.225047137e4  ,-0.547200505e5  , 0.953214082e5)# J kg1
test1 <-rbind(SA,t,p,g,dg_dSA,dg_dt,dg_dp,d2g_dSAdp,d2g_dt2,d2g_dt_dp,d2g_dp2,
h,f,u,s,r,cp,c,mW)

#table 22
SA       <- c(0.0             , 0.0            , 0.0)#gkg1
t        <- c(0.0             , 79.85          , 0.0 )#C
p        <- c(0.0             , 0.0            , 998.98675)# bar
g        <- c(0.101342742e3   ,-0.446114969e5  , 0.977303862e5)# J kg1
dg_dSA   <- c( 0.0            , 0.0            , 0.0          )#Jg1
dg_dt    <- c(0.147643376     ,-0.107375993e4  , 0.851466502e1)# Jkg1K1
dg_dp    <- c(0.100015694e-2  , 0.102892956e-2 , 0.956683329e-3)# m3 kg1
d2g_dSAdp<- c( 0.0            , 0.0            , 0.0)# m3 g1
d2g_dt2  <- c( -0.154473542e2 ,-0.118885000e2  ,-0.142969873e2)# J kg1K2
d2g_dt_dp<- c(-0.677700318e-7 , 0.659051552e-6 , 0.199079571e-6)# m3 kg1K1
d2g_dp2  <- c(-0.508928895e-12,-0.474672819e-12,-0.371530889e-12)# m3 kg1 Pa1
h        <- c(0.610139535e2   , 0.334425759e6  , 0.954046055e5)# J kg1
f        <- c(0.18399e-2      ,-0.447157532e5  , 0.206205330e4)# J kg1
u        <- c(-0.403269484e2  , 0.334321503e6  ,-0.263727446e3)# J kg1
s        <- c(-0.147643376    , 0.107375993e4  ,-0.851466502e1)# Jkg1 K1
r        <- c(0.999843086e3   , 0.971883832e3  , 0.104527796e4)# kgm3
cp       <- c(0.421944481e4   , 0.419664050e4  , 0.390522209e4)# J kg1 K1
c        <- c(0.140238253e4   , 0.155446297e4  , 0.157542240e4)# ms1
mW       <- c(0.101342742e3   ,-0.446114969e5  , 0.977303862e5)# J kg1

test2 <-rbind(SA,t,p,g,dg_dSA,dg_dt,dg_dp,d2g_dSAdp,d2g_dt2,d2g_dt_dp,d2g_dp2,
h,f,u,s,r,cp,c,mW)

Test<-cbind(test1,test2)
# derivates
der <- matrix(nc=3,nr=18,data=0)
der[5,1]<-der[6,2]<-der[7,3]<-1
der[8,1]<-der[8,3]<-1
der[9,2]<-2
der[10,2]<-der[10,3]<-1
der[11,3]<-2

gibbs<-dg_dSA<-dg_dt<-dg_dp<-d2g_dSAdp<-d2g_dt2<-d2g_dt_dp<-d2g_dp2<-NULL
rho <- Cp <- H <-SS<-SV<-NULL
for (i in 1:ncol(Test))
{
S<-Test[1,i]
t<-Test[2,i]
p<-Test[3,i]
gibbs      <- c(gibbs,sw_gibbs(S,t,p))
dg_dSA     <- c(dg_dSA,sw_gibbs(S,t,p,dS=1))
dg_dt      <- c(dg_dt,sw_gibbs(S,t,p,dt=1))
dg_dp      <- c(dg_dp,sw_gibbs(S,t,p,dp=1))
d2g_dSAdp  <- c(d2g_dSAdp,sw_gibbs(S,t,p,dS=1,dp=1))
d2g_dt2    <- c(d2g_dt2,sw_gibbs(S,t,p,dt=2))
d2g_dt_dp  <- c(d2g_dt_dp,sw_gibbs(S,t,p,dt=1,dp=1))
d2g_dp2    <- c(d2g_dp2,sw_gibbs(S,t,p,dp=2))
Cp         <- c(Cp,sw_cp(S,t,p))
H          <- c(H,sw_enthalpy(S,t,p))
SS         <- c(SS,sw_entropy(S,t,p))
SV         <- c(SV,sw_svel(S,t,p))
rho        <- c(rho,sw_dens(S,t,p))
}

Comp <- rbind(
S=Test[1,],t=Test[2,],p=Test[3,],
gibbs,Test["g",],
dg_dSA,Test["dg_dSA",],
dg_dt,Test["dg_dt",],
dg_dp,Test["dg_dp",],
d2g_dSAdp,Test["d2g_dSAdp",],
d2g_dt2,Test["d2g_dt2",],
d2g_dt_dp,Test["d2g_dt_dp",],
d2g_dp2,Test["d2g_dp2",],
rho,Test["r",],
H,Test["h",],
SS,Test["s",],
SV,Test["c",],
Cp,Test["cp",]
)

Comp