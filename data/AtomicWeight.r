# Wieser, M.E. (2006). Atomic weights of the elements 2005 (IUPAC Technical Report).
# Pure Appl. Chem., Vol. 78, No. 11, pp. 2051-2066, 2006. doi:10.1351/pac200678112051

AtomicWeight <- read.table("AtomicWeight.txt", sep="\t", header=TRUE)

atomicweight <- as.list(as.numeric( gsub("\\(.+\\)", "", AtomicWeight$Weight)))
names(atomicweight) <- AtomicWeight$Symbol
