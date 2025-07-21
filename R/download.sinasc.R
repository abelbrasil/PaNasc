#' Download SINASC
#'
#' Download data about live birth from SINASC - DATASUS and tranform from .dbc file to data frame.
#' @param inicio The year that start the files extract.
#' @param fim The year that finish the files extract Can't be the current year.
#' @param UF The state acronym.
#' @param cod_estab The birth establishment code.
#' @seealso \code{\link{process.sinasc}}
#'
#' @return A data frame with the filtered raw SINASC data.
#' @author Luan Augusto, \email{luanguto87@gmail.com}
#' @export
#'
#' @examples
#' nasc <- download.sinasc(2022)
#' pe <- download.sinasc(2022,UF="PE")
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
        url <- paste0("ftp://ftp.datasus.gov.br/dissemin/publicos/SINASC/1996_/Dados/DNRES/","DN",TABUF$SIGLA_UF,i,".dbc")
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



  db <- data.frame(lapply(db, function(x) if (is.factor(x)) as.character(x) else x))

  ifelse(cod_estab %in% db$CODESTAB,db <- db %>% filter(CODESTAB %in% cod_estab),db)




  return(db)
}
