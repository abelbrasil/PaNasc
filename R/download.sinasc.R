#' Download SINASC
#'
#' Download data about live birth from SINASC - DATASUS and tranform from .dbc file to data frame.
#' @param inicio The year that start the files extract.
#' @param fim The year that finish the files extract. By default the last year. Can't be the current year.
#' @param UF The state acronym.
#' @param cod_estab The birth establishment code.
#' @seealso \code{\link{label.sinasc}}
#'
#' @return A data frame with the filtered raw SINASC data.
#' @author Luan Augusto, \email{luanguto87@gmail.com}
#' @export
#'
#' @examples
#' pe <- download.sinasc(2022,UF="PE")
#' sp <- download.sinasc(2020,2022,"SP")
download.sinasc <- function(inicio,fim,UF="all",cod_estab=""){
  require(read.dbc)
  require(dplyr)
  require(lubridate)

  urls <- c()

  db <- c()

  cod_estab <- as.character(cod_estab)



  if (fim==as.numeric(format(Sys.Date(), "%Y"))){
    stop("Error: Not is possible download file of the current year")
  }
  anos <- c(inicio:fim)
  for (i in anos) {
    if(i==as.numeric(format(Sys.Date(), "%Y"))-1){
      if (UF=="all"){
        url <- paste0("ftp://ftp.datasus.gov.br/dissemin/publicos/SINASC/PRELIM/DNRES/","DN",TABUF$SIGLA_UF,i,".dbc")
      }
      else
        url <- paste0("ftp://ftp.datasus.gov.br/dissemin/publicos/SINASC/PRELIM/DNRES/","DN",UF,i,".dbc")
    }
    else
      if (UF=="all"){
        url <- paste0("ftp://ftp.datasus.gov.br/dissemin/publicos/SINASC/PRELIM/DNRES/","DN",TABUF$SIGLA_UF,i,".dbc")
      }
      else
        url <- paste0("ftp://ftp.datasus.gov.br/dissemin/publicos/SINASC/1996_/Dados/DNRES/","DN",UF,i,".dbc")
    urls <- append(urls,url)
  }
  for (i in 1:length(urls)) {
    temp <- tempfile(fileext = ".dbc")
    download.file(urls[i], destfile = temp, mode = "wb", method = "libcurl")
    data <- read.dbc(temp)
    db <- bind_rows(db,data)
  }

  db <- db %>%
    mutate(
      DTNASC=dmy(DTNASC),

      DTNASCMAE=dmy(DTNASCMAE),

      DTCADASTRO=dmy(DTCADASTRO),

      DTRECORIGA=dmy(DTRECORIGA),

      DTRECEBIM=dmy(DTRECEBIM),

      DTDECLARAC=dmy(DTDECLARAC),

      DTULTMENST=dmy(DTULTMENST),

      HORANASC=paste0(substr(HORANASC,1,2),":", substr(HORANASC,3,4)),

      IDADEMAE=as.numeric(as.character(IDADEMAE)),

      QTDFILVIVO=as.numeric(as.character(QTDFILVIVO)),

      QTDFILMORT=as.numeric(as.character(QTDFILMORT)),

      QTDFILMORT=as.numeric(as.character(QTDFILMORT)),

      PESO=as.numeric(as.character(PESO)),

      QTDGESTANT=as.numeric(as.character(QTDGESTANT)),

      QTDPARTNOR=as.numeric(as.character(QTDPARTNOR)),

      QTDPARTCES=as.numeric(as.character(QTDPARTCES)),

      CONSPRENAT=as.numeric(as.character(CONSPRENAT)),

      DIFDATA=as.numeric(as.character(DIFDATA)),

      CONSPRENAT=as.numeric(as.character(CONSPRENAT)),

      SERIESCMAE=as.numeric(as.character(SERIESCMAE)),

      NUMEROLOTE=as.numeric(as.character(NUMEROLOTE)),

      SEMAGESTAC=as.numeric(as.character(SEMAGESTAC)))

  db <- data.frame(lapply(db, function(x) if (is.factor(x)) as.character(x) else x))

  ifelse(cod_estab %in% db$CODESTAB,db <- db %>% filter(CODESTAB %in% cod_estab),db)


  db <- db %>%
    left_join(ESTAB%>% select(CNES, FANTASIA),by=join_by(CODESTAB==CNES),keep = F)

  return(db)
}
