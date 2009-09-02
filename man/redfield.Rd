\name{redfield}
\alias{redfield}

\title{Redfield Ratio Calculator}
\description{
  Estimate elemental composition of biomass (or media) according to the
  Redfield ratio.
}
\usage{
redfield(q, species, method = c("mol", "mass"), ratio = c(C=106, H=263, O=110, N=16, P=1))
}
\arguments{
  \item{q}{amount of substance of that element (in mol or mass units),}
  \item{species}{The element that is given ("C", "H", "O", "N", "P"),}
  \item{method}{measurement unit ("mol" or "mass"),}
  \item{ratio}{average elemental composition.}
}
\details{
  
  The average elemental composition of marine plankton (Redfield ratio)
  is traditionally assumed to be
  \eqn{C_{106}H_{263}O_{110}N_{16}P_{1}}{C106 H263 O110 N16 P1}
  (Redfield 1934, 1963, Richards 1965). Note that while the C:N:P ratio
  is widely agreed there is still discussion about the average of O and
  H, e.g. \eqn{C_{106}H_{180}O_{45}N_{16}P_{1}}{C106 H180 O45 N16 P1}.

  Note also that there are, of course, large differences depending on
  species and physiological state.
  
}

\value{ A data frame with the estimated ratio of the main elements.}


\references{
  Redfield AC, 1934. On the proportions of organic derivations in sea
  water and their relation to the composition of plankton.  In: James
  Johnstone Memorial Volume. (ed. R.J. Daniel).  University Press of
  Liverpool, 177-192.

  Redfield, AC, Ketchum, BH and Richards FA, 1963. The influence of
  organisms on the composition of seawater. In: Hill, MN, Editor, The
  Sea vol. 2, Interscience, New York (1963), pp.26-77.
  
  Richards FA, 1965. Anoxic basins and fjords. In: Riley JP, Skirrow
  D. (Eds.), Chemical Oceanography, vol. 1. Academic Press, New York,
  611-645. (cited in Hedges et al, 2002).

  Vollenweider RA, 1985. Elemental and biochemical composition of
  plankton biomass: some comments and explorations. Arch.
  Hydrobiol. 105, 11-29.
  
  Anderson LA, 1995. On the hydrogen and oxygen content of marine
  plankton. Deep-Sea Res. 42, 1675-1680.

  Hedges JI., Baldock JA, Gelinas Y, Lee C, Peterson ML and 
  Wakeham SG, 2002. The biochemical and elemental compositions of
  marine plankton: A NMR perspective. Marine Chemistry 78, 47-63.
}
\seealso{
\code{\link{AtomicWeight}}, \code{\link{molvol}}, \code{\link{molweight}}
}
\examples{
## Redfield ratio
redfield(1, "P")
## returns the molar Redfield ratio, rescaled to nitrogen
redfield(1, "N")
## how many mass units are related to 2 mass units (e.g. mg) P
redfield(2, "P", "mass")
redfield(c(1, 2, 3), "N", "mass")

## mass percentage of elements
x <- redfield(1, "P", "mass")
x / sum(x)

## with alternative elemental composition
x <- redfield(1, "P", "mass", ratio=c(C=106, H=180, O=45, N=16, P=1))
x / sum(x)

## rule of thumb for fresh mass (in mg) formed by 1 microgram P
redfield(1, "P", "mass")$C * 2 * 10 / 1000
sum(redfield(1, "P", "mass",
  ratio=c(C=106, H=180, O=45, N=16, P=1))) * 10 / 1000

}
\keyword{ misc}

