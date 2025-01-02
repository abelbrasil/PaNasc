#$______________________________________________________________________________
#Importing the libraries

library(curl)
library(rvest)
library(stringr)
library(foreign)
library(dplyr)
library(zip)

#$______________________________________________________________________________

dic <- c("CADMUN","CID10","TABUF")

for (i in dic) {
  temp <- tempfile(fileext = ".DBF")
  download.file(paste0("ftp://ftp.datasus.gov.br/dissemin/publicos/SINASC/1996_/TABELAS/",i,".DBF"),
                destfile = temp, mode = "wb", method = "libcurl")
  data <- read.dbf(temp)
  assign(i,data)
}

temp <- tempfile(fileext = ".zip")
download.file("https://www.gov.br/trabalho-e-emprego/pt-br/assuntos/cbo/servicos/downloads/estrutura-cbo.zip",destfile = temp)
temp_dir <- tempdir()
unzip(temp,files = c("CBO2002 - Ocupacao.csv"),exdir = temp_dir)
ocup <- read.csv2(paste0(temp_dir,"\\CBO2002 - Ocupacao.csv"))
ocup$TITULO <- iconv(ocup$TITULO, from = "latin1", to = "UTF-8")

usethis::use_data(CADMUN,CID10,TABUF,ocup, overwrite = T)

usethis::use_data(hospital_universitario_ebserh, overwrite = T)
