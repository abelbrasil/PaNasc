panel.sinasc <- function(x){
  require(dplyr)
  base <- x %>%
    select(CODESTAB,ESTABELECIMENTO,`LOCAL DE NASCIMENTO`=LOCNASC,SEXO,PESO,`FAIXA DE PESO`=FAIXA_PESO,`GESTAÇÃO`=GESTACAO,GRAVIDEZ,PARTO,DTNASC,HORANASC,ANO,`MES-ANO`=MES_ANO,`RAÇA/COR`=RACACOR,`CONSULTAS PRÉ-NATAL`=CONSULTAS,
           `IDADE DA MÃE`= IDADEMAE,`ESTADO CIVIL DA MÃE` = ESTCIVMAE,`RAÇA/COR DA MÃE`=RACACORMAE, `ESCOLARIDADE DA MÃE` = ESCMAE2010, `ANOS DE ESCOLARIDADE DA MÃE` = ESCMAE,`MUNICÍPIO RESIDENCIA MÃE`=MUNICIPIO,`OCUPAÇÃO DA MÃE`=OCUPMAE,
           `ANOMALIA CONGÊNITA`=IDANOMAL)

  colnames(base) <- iconv(colnames(base), to = "UTF-8")

  base <- lapply(dataset, function(col) {
    if (is.character(col)) iconv(col, to = "UTF-8") else col
  })

  return(base)
}
