#' Download SINASC
#'
#' Download data about live birth from SINASC - DATASUS and tranform from .dbc file to data frame.
#' @param begin The year that start the files extract.
#' @param end The year that finish the files extract. By default the last year. Can't be the current year.
#' @param UF The state acronym.
#' @param cod_mat The birth establishment code.
#' @seealso \code{\link{label.sinasc}}
#'
#' @return A data frame with the filtered raw SINASC data.
#' @author Luan Augusto, \email{luanguto87@gmail.com}
#' @export
#'
#' @examples
#' pe <- download.sinasc(2022,UF="PE")
#' sp <- download.sinasc(2020,2022,"SP")
download.sinasc <- function(begin,end,UF,cod_mat=""){
  require(read.dbc)
  require(dplyr)
  urls <- c()
  db <- c()
  if (end==as.numeric(format(Sys.Date(), "%Y"))){
    stop("Error: Not is possible download file of the current year")
  }
  anos <- c(begin:end)
  for (i in anos) {
    if(i==as.numeric(format(Sys.Date(), "%Y"))-1){
      url <- paste0("ftp://ftp.datasus.gov.br/dissemin/publicos/SINASC/PRELIM/DNRES/","DN",UF,i,".dbc")
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
  if(is.numeric(cod_mat)){
    db <- db %>% filter(CODESTAB==cod_mat)
  }
  db <- db %>%
    left_join(get(paste0("ESTAB_",UF))%>% select(CNES, FANTASIA),by=join_by(CODESTAB==CNES),keep = F)
  return(db)
}

