\name{coriolis}
\alias{coriolis}
\title{The coriolis force as a function of latitude}
\description{Estimates the coriolis factor, f units [/second]. 

   f=2*omega*sin(lat), where omega=7.292e-5 radians/sec}
\usage{coriolis(lat)}
\arguments{
  \item{lat }{latitude in degrees north (-90:+90)}
}
\value{
  the coriolis factor, /second
}
\author{Karline Soetaert <k.soetaert@nioo.knaw.nl>}
\examples{plot(-90:90,coriolis(-90:90),xlab="latitude, dg North", 
                 ylab= "/s" , main ="coriolis factor",type="l",lwd=2)}
\references{S. Pond & G. Pickard  2nd Ed. 1986. Introductory Dynamical Oceanography,
Pergamon Press, Sydney.}
\keyword{utilities}

