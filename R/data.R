#' @title City Structure
#' @description DATASET_DESCRIPTION
#' @format A data frame with 5652 rows and 28 variables:
#' \describe{
#'   \item{\code{MUNCOD}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{MUNCODDV}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{SITUACAO}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{MUNSINP}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{MUNSIAFI}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{MUNNOME}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{MUNNOMEX}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{OBSERV}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{MUNSINON}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{MUNSINONDV}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{AMAZONIA}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{FRONTEIRA}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{CAPITAL}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{UFCOD}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{MESOCOD}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{MICROCOD}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{MSAUDCOD}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{RSAUDCOD}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{CSAUDCOD}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{RMETRCOD}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{AGLCOD}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{ANOINST}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{ANOEXT}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{SUCESSOR}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{LATITUDE}}{double COLUMN_DESCRIPTION}
#'   \item{\code{LONGITUDE}}{double COLUMN_DESCRIPTION}
#'   \item{\code{ALTITUDE}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{AREA}}{double COLUMN_DESCRIPTION}
#'}
#' @source \url{ftp://ftp.datasus.gov.br/dissemin/publicos/SINASC/1996_/TABELAS/CADMUN.DBF}
"CADMUN"

#' @title  10th International Classification of Diseases
#' @description The 10th International Classification of Diseases (ICD-10) is a global system for classifying diseases,
#' health conditions, and a wide range of health-related events. Developed by the World Health Organization (WHO), it serves as a standard
#' diagnostic tool for epidemiology, clinical purposes, and health management. ICD-10 is used worldwide for health reporting, statistical
#' analysis, and medical billing.
#' @format A data frame with 14198 rows and 6 variables:
#' \describe{
#'   \item{\code{CID10}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{OPC}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{CAT}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{SUBCAT}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{DESCR}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{RESTRSEXO}}{integer COLUMN_DESCRIPTION}
#'}
#' @source \url{ftp://ftp.datasus.gov.br/dissemin/publicos/SINASC/1996_/TABELAS/CID10.DBF}
"CID10"

#' @title UF Structure
#' @description DATASET_DESCRIPTION
#' @format A data frame with 27 rows and 3 variables:
#' \describe{
#'   \item{\code{SIGLA_UF}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{CODIGO}}{integer COLUMN_DESCRIPTION}
#'   \item{\code{DESCRICAO}}{integer COLUMN_DESCRIPTION}
#'}
#' @source \url{ftp://ftp.datasus.gov.br/dissemin/publicos/SINASC/1996_/TABELAS/TABUF.DBF}
"TABUF"

#' @title CBO 2002 Estructure
#' @description Dataset with the CBO 2002 code and their respective titles.
#' @format A data frame with 2694 rows and 2 variables:
#' \describe{
#'   \item{\code{CODIGO}}{integer CBO 2002 code}
#'   \item{\code{TITULO}}{character Title of the occupation}
#'}
#' @source \url{https://www.gov.br/trabalho-e-emprego/pt-br/assuntos/cbo/servicos/downloads/estrutura-cbo.zip}
"ocup"
