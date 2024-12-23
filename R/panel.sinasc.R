panel.sinasc <- function(x){
  require(dplyr)
  base <- x %>%
    select(`Código do Estabelecimento`=CODESTAB,`Estabelecimento`=ESTABELECIMENTO,`Local de Nascimento`=LOCNASC,

           `Código Município de Nascimento`=CODMUNNASC,UF,`Município de Nascimento`=MUNNASC,`Sexo`=SEXO,`Peso`=PESO,

           `Faixa de Peso`=FAIXA_PESO,`Semanas de Gestação`=SEMAGESTAC,`Gestação`=GESTACAO,`Gravidez`=GRAVIDEZ,`Parto`=PARTO,

           `Data de Nascimento`=DTNASC,`Hora de Nascimento`=HORANASC,`Ano`=ANO,`Mês-Ano`=MES_ANO,`Raça/Cor`=RACACOR,

           `Consultas Pré-Natal`=CONSULTAS, APGAR1, APGAR5,`Faixa APGAR5`=FAIXA_APGAR5,`Idade da Mãe`= IDADEMAE,

           `Faixa Etária da Mãe`=FAIXA_ETARIA_MAE,`Estado Civil da Mãe` = ESTCIVMAE,`Raça/Cor da Mãe`=RACACORMAE,

           `Escolaridade da Mãe` = ESCMAE2010,`Anos de Escolaridade da Mãe` = ESCMAE, `Código Município de Residência`=CODMUNRES,

           `Município de Residência da Mãe`= MUNRES,`Ocupação da Mãe`=OCUPMAE,`Anomalia Congênita`=IDANOMAL,

           `Código Faixa Etária`=COD_FAIXA_ETARIA,`Código Faixa Peso`=COD_FAIXA_PESO,`Código Gestação`=COD_GESTACAO,

           `Código Consultas`=COD_CONSULTAS, `Código Escolaridade`=COD_ESCOLARIDADE,`Código Gravidez`=COD_GRAVIDEZ)

  colnames(base) <- iconv(colnames(base), to = "UTF-8")

  base[-30] <- lapply(base[-30], function(col) {
    if (is.character(col)) iconv(col, to = "UTF-8") else col
  })

  return(base)
}
