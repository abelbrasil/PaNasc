remove.packages("sinasc")
devtools::install()
library(PaNasc)
?download.sinasc
devtools::check()

db <- download.sinasc(inicio =  2023,fim = 2023,"CE",cod_mat = 2481286)
meac <- label.sinasc(db)

dbsp <- download.sinasc(2022,2022,"SP")
SP <- label.sinasc(dbsp)
