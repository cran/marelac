\name{Zoogrowth}
\docType{data}
\alias{Zoogrowth}
\title{a zooplankton growth dataset}
\description{This literature dataset, compiled by Hansen et al. (1997) contains 84 measurements
of maximal growth rates as a function of organism volume and temperature for
various species of zooplankton. The maximal growth rates were obtained from laboratory experiments.

It is used in the book to demonstrate how one can obtain order-of-magnitude estimates
of model parameters (i.c. maximal growth) via allometric relations, i.e. by
performing log-log regression of organism rates versus size.}
\usage{Zoogrowth}
\format{a dataframe with 84 rows, and with following columns:
\item Volume, the volume in [um 3].
\item Mumax, the maximal growht rate, [/hour]
\item Species, the name of reared zooplankton species
\item Temp, the rearing temperature, [dg C]
\item Group, the systematic group to which the organism belongs, one of Nanoflagellate,
Dinoflagellate, Ciliate, Rotifer, Meroplankton, Copepod}
\author{Karline Soetaert <k.soetaert@nioo.knaw.nl>}
\examples{
plot(Zoogrowth$Volume,Zoogrowth$Mumax,log="xy",
      xlab="zooplankton volume, micrometer ^ 3",
      ylab="maximal growth rate, /hr",main="Zoogrowth",cex=2,
      pch=(15:20)[Zoogrowth$Group],col=(1:6)[Zoogrowth$Group])
legend("topright",legend=levels(Zoogrowth$Group),col=1:6,pch=15:20)

ll <- lm(log(Zoogrowth[,2])~ log(Zoogrowth[,1]))
rr <- summary(ll)$r.squared
A  <- exp(coef(ll)[1])
B  <- (coef(ll)[2])
curve(A*x^B,add=TRUE,lwd=2)
AA <- round(A*100)/100
BB <- round(B*100)/100
expr <- substitute(y==A*x^B,list(A=AA,B=BB))
text(100,.0035,expr,adj=0)
expr2 <- substitute(r^2==rr,list(rr=round(rr*100)/100))
text(100,0.002,expr2, adj=0)}
\references{Hansen PJ, Bjornsen PK, Hansen BW, 1997. Zooplankton grazing and growth: Scaling within the 2-2,000-mu m body size range. Limnology and Oceanograpy 42: 687-704.}
\seealso{\code{\link{SCOC}}, a dataset containing sediment community oxygen consumption rates

see the paper of Hansen et al. 1997 for a description of the original literature sources of this dataset}
\keyword{datasets}

