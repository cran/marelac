# Physical constants

Constants <- list(
g  = c(9.8,"m/s2","gravity acceleration"),
SB = c(5.6697e-8,"W/m^2/K^4","Stefan-Boltzmann constant"),
gasCt1 = c(0.08205784,"L*atm/K/mol","ideal gas constant"),
gasCt2 = c(8.314472,"m3*Pa/K/mol","ideal gas constant"),
gasCt3 = c(83.1451,"cm3*bar/K/mol","ideal gas constant"),
E=c(1.60217653e-19,"C","Elementary charge"),
F=c(96485.3,"C/mol","charge per mol of electrons"),
P0 = c(1.01325e5,"Pa","one standard atmosphere"),
#bar = c(1.e5,"Pa","pressure conversion"),
B1 = c(1.3806505e-23,"J/K","Boltzmann constant"),
B2 = c(8.617343e-5,"eV/K","Boltzmann constant"),
Na = c(6.0221415e23,"mol-1","Avogadro constant"),
C=c(299792458,"m s-1", "Vacuum light speed")
)

# example:
#data.frame(cbind(acronym=names(Constants),matrix(ncol=3,byrow=TRUE,data=unlist(Constants),dimnames=list(NULL,c("value","units","description")))))

