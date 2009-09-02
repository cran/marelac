# Characteristics of the ocean

Oceans <- list(

Mass  = c(1.35e25,"kg","total mass of the oceans"),
Vol   = c(1.34e18,"m3","total volume of the oceans"),
VolSurf   = c(1.81e16,"m3","volume of the surface ocean (0-50m)"),
VolDeep   = c(9.44e17,"m3","volume of the deep ocean (>1200m)"),
Area   = c(358e12,"m2","total area of the oceans"),
AreaIF   = c(332e12,"m2","annual mean ice-free area of the oceans"),
AreaAtl   = c(75e12,"m2","area of the Atlantic ocean, >45dgS"),
AreaPac   = c(151e12,"m2","area of the Pacific ocean, >45dgS"),
AreaInd   = c(57e12,"m2","area of the Indian ocean, >45dgS"),
AreaArct  = c(9.6e12,"m2","area of the Arctic ocean"),
AreaEncl  = c(4.5e12,"m2","area of enclosed seas (e.g. Mediterranean)"),
Depth   = c(3690,"m","mean depth of the oceans"),
RiverFlow = c(3.7e13,"m3/yr","Total river flow")
)

# example:
#data.frame(cbind(acronym=names(Oceans),matrix(ncol=3,byrow=TRUE,data=unlist(Oceans),
#   dimnames=list(NULL,c("value","units","description")))))

