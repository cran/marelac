\name{Nemaspec}
\docType{data}
\alias{Nemaspec}
\title{Nematode species composition of 6 deep-sea sediments in the Mediterranean}
\description{Dataset of (Soetaert et al., 1991) with nematode species densities in Mediterranean deep-sea sediments, at
depths ranging from 160 m to 1220 m.

The densities are expressed in individuals per 10 cm2.

Nematodes are small free-living worms (<1mm long), generally very abundant in all aquatic sediments.}
\usage{Nemaspec}
\format{
  a data.frame, with stations as columns, species as rows.
  
  There are 6 stations, for each station two replicates.
  
  The stationname refers to the depth of the sediment and the replicate, e.g.
  M160b is a station at 160 metres depth, replicate b)
}
\note{The densities are non-integer values.

Species are called "Genus spname"; as most species are undescribed, they are
called "Genus M1", "Genus M2", etc... }
\author{Karline Soetaert <k.soetaert@nioo.knaw.nl>}
\examples{head(Nemaspec)
# select densities of species present in M160b
st160b<-data.frame(Nemaspec$SPECIES,dens=Nemaspec$M160b)
st160b<-st160b[st160b$dens!=0,]

plot(cumsum(rev(sort(st160b$dens)/sum(st160b$dens))),
     main="dominance curve",
     xlab="species rank",ylab="cum freq")
}
\references{Soetaert, K., Heip, C. and M. Vincx, 1991. Diversity of nematode assemblages along a
mediterranean deep-sea transect. Marine Ecology Progress Series 75, 275-282.}
\keyword{datasets}

