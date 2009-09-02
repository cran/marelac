## -----------------------------------------------------------------------------
## The gas transfer coefficient
## -----------------------------------------------------------------------------

gas_transfer<- function (t = 25,u10 = 1,species = c("He", "Ne", "N2",
        "O2", "Ar", "Kr", "Rn", "CH4", "CO2", "N2O", "CCl2F2", "CCL3F",
        "SF6", "CCl4"),
        method = c("Liss", "Nightingale", "Wanninkhof1", "Wanninkhof2"),
        Schmidt = gas_schmidt(t = t, species = species)) {

  method <- match.arg(method)
  # species <- match.arg(species, several.ok = TRUE)

  S600 <- Schmidt/600
  tr  <- switch(method,
    Liss = ifelse (u10 < 3.6, 0.17 * u10 * Schmidt ^(-2/3),
                   ifelse (u10 <= 13, (u10 - 3.4) * 2.8 / sqrt(S600),
                                    (u10 - 8.4) * 5.9 / sqrt(S600))),
    Nightingale = (0.33 * u10 + 0.222 * u10 * u10) / sqrt(S600),
    Wanninkhof1 = 0.31 * u10^2 * sqrt(S600),
    Wanninkhof2 = 0.0283 * u10^3 / sqrt(S600)
  )
  tr/100/3600
}
