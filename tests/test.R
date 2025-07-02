library(PaNasc)

data <- download.sinasc(inicio = 2022, fim = 2023, UF = "CE")
data_processed <- process.sinasc(data)
fNasc_Vivos <- panel.sinasc(data_processed)
save("fNasc_Vivos", file = "dataset.Rdata")
