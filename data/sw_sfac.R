
# Reads the original file from the code by David Jackett
# nx=91,ny=44,nz=45
# longs, lats: latitiudes, longitudes for which salinity correction is known
# longs[91], lats[44]
# ndepth: depths of salinity correction ndepth[long,lat]
# del_sa:salinity correction del_sal[nz,ny,nx]


sw_sfac <- local({

  dsal <- read.table("gsw_data.dat")
  dsal[dsal=="NaN"] <- -99

  is1 <- 92 + 44
  is2 <- 92 + 44 + 45
  ii <- is2 + 91 * 44

  list(
    longs  = dsal[1:91, 1],
    lats   = dsal[92:(92+43), 1],
    p      = dsal[is1:(is1+44),],
    ndepth = matrix(nc=91, nr=44, dsal[is2:(is2+(91*44)-1), 1]),
    del_sa = array(dim=c(45, 44, 91), data=dsal[ii:(ii+45*44*91-1), 1])
  )
})

