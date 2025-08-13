#install.packages("remotes", repos = "https://cran.r-project.org")
#install.packages("devtools", repos = "https://cran.r-project.org")
#install.packages("dplyr", repos = "https://cran.r-project.org")
#install.packages("lubridate", repos = "https://cran.r-project.org")
#install.packages("foreign", repos = "https://cran.r-project.org")
#devtools::install_github("danicat/read.dbc")
#remotes::install_github(repo = "abelbrasil/PaNasc",auth_token = "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")

library(PaNasc)
fNasc_Vivos <- panel.sinasc(label.sinasc(download.sinasc(begin = 2014, end = 2023, "CE")))
dMunicipio <- CADMUN
save.image("data_sinasc.RData")
