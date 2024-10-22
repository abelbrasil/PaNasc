state <- c("AC", "AL", "AP", "AM", "BA", "CE", "DF", "ES", "GO", "MA",
           "MT", "MS", "MG", "PA", "PB", "PR", "PE", "PI", "RJ", "RN",
           "RS", "RO", "RR", "SC", "SP", "SE", "TO")

temp <- tempfile(fileext = ".zip")
download.file("ftp://ftp.datasus.gov.br/dissemin/publicos/CNES/200508_/Auxiliar/TAB_CNES.zip",destfile = temp, mode = "wb", method = "libcurl")
temp_dir <- tempdir()
for (i in state) {
  unzip(temp,files = c(paste0("DBF/CADGER",i,".dbf")),exdir = temp_dir)
}
for (i in state) {
  estab_UF <- read.dbf(paste0(temp_dir,"\\DBF\\CADGER",i,".dbf"))
  assign(paste0("ESTAB_",i),estab_UF)
}

usethis::use_data(ESTAB_AC,ESTAB_AL,ESTAB_AP,ESTAB_AM,ESTAB_BA,ESTAB_CE,ESTAB_DF,ESTAB_ES,ESTAB_GO,ESTAB_MA,ESTAB_MT,ESTAB_MS,ESTAB_MG,
                  ESTAB_PA,ESTAB_PB,ESTAB_PR,ESTAB_PE,ESTAB_PI,ESTAB_RJ,ESTAB_RN,ESTAB_RS,ESTAB_RO,ESTAB_RR,ESTAB_SC,ESTAB_SP,ESTAB_SE,
                  ESTAB_TO, overwrite = T)
