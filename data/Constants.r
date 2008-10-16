# Physical constants

Constants <- list(
g  = c(9.8,"m/s2","gravity acceleration"),
SB = c(5.6697e-8,"W/m^2/K^4","Stefan-Boltzmann constant"),
gasCt1 = c(0.08205784,"L*atm/K/mol","ideal gas constant"),
gasCt2 = c(8.314472,"m3*Pa/K/mol","ideal gas constant"),
atm = c(1.01325e5,"Pa","pressure conversion"),
bar = c(1.e5,"Pa","pressure conversion"),
B1 = c(1.3806504e-23,"J/K","Boltzmann constant"),
B2 = c(8.617343e-5,"eV/K","Boltzmann constant")
)

# example:
#data.frame(cbind(acronym=names(Constants),matrix(ncol=3,byrow=TRUE,data=unlist(Constants),dimnames=list(NULL,c("value","units","description")))))

