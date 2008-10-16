\name{SCOC}
\docType{data}
\alias{SCOC}
\title{a Sediment Community Oxygen Consumption (SCOC) dataset}
\description{This literature dataset, compiled by Andersson et al. (2004) contains 584 measurements
of sediment community oxygen consumption rates, as a function of water depth, and performed in deep-water sediments, either by in situ incubations or via modelling of oxygen microprofiles.

It is used in the book to demonstrate how one can obtain order-of-magnitude estimates
of model parameters (i.c. sediment oxygen consumption rate, a measure of deposition flux) by
performing log-log regression with water depth.}
\usage{SCOC}
\format{a dataframe with 584 rows, and with following columns:
\cr Depth.m, the water depth at which the measurement was performed.
\cr SCOC.mmol/m2/d, the oxygen consumption rate of the sediment, [mmolO2/m2/d]}
\author{Karline Soetaert <k.soetaert@nioo.knaw.nl>}
\examples{plot(SCOC[,1],SCOC[,2],log="xy",xlab="water depth, m",ylab="" ,
     main="SCOC, mmol O2/m2/d",pch=16,xaxt="n",yaxt="n",cex.main=1)

axis(1,at=c(0.5,5,50,500,5000),labels=c("0.5","5","50","500","5000"))
axis(2,at=c(0.1,1,10,100),labels=c("0.1","1","10","100"))

ll <- lm(log(SCOC[,2])~ log(SCOC[,1]))
rr <- summary(ll)$r.squared
A  <- exp(coef(ll)[1])
B  <- (coef(ll)[2])
curve(A*x^B,add=TRUE,lwd=2)
AA <- round(A*100)/100
BB <- round(B*100)/100
expr <- substitute(y==A*x^B,list(A=AA,B=BB))
text(1,.1,expr,adj=0)
expr2 <- substitute(r^2==rr,list(rr=round(rr*100)/100))
text(1,0.04,expr2, adj=0)}
\references{Andersson, H., Wijsman, J., Herman, P., Middelburg, J., Soetaert, K., Heip, C., 2004. Respiration patterns in the deep ocean. Geophysical Research Letters 31, LO3304.}
\seealso{\code{\link{Zoogrowth}}, a dataset containing zooplankton maximal growth rates
\cr see the paper of Andersson et al. for a description of the original literature sources of this dataset}
\keyword{datasets}

