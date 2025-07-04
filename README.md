# PaNasc

Author: Luan Augusto - EBSERH Technology Initiation Scholarship

e-mail: [luanguto87\@gmail.com](mailto:luanguto87@gmail.com)

## Introduction

`PaNasc` is a R package created to automate the data extraction, cleaning and transformation from the SINASC - DATASUS.

SINASC is the name of the Information System about Live Births and DATASUS is name of the Department of Information of Brazil's Health Care System (Sistema Único de Saúde - SUS).

This package is one of the main activities of the EBSERH Technology Initiation Scholarship.

## Functions

-   `download.sinasc` is the primordial function of this package. This function is responsible to download the data from the DATASUS FTP Directory. The user enters with the year and the state they want and the output is a data frame with the raw information.

-   `label.sinasc` needs a data frame created by the function `download.sinasc` and this function is responsible to choose the util columns, clean the data and replace the code by the respective labels.

-   `panel.sinasc` is used to select and handle the columns required for the Power BI dashboard.

## How to use the package

To start using the "PaNasc" package, follow the steps below:

1.  Install the package:

``` r
install.packages("remotes")
remotes::install_github("abelbrasil/PaNasc")
```

2.  Load the package: Use the `library(PaNasc)` command to load the package into your R environment.

3.  Access the DATASUS data: Use the functions provided by the package to access and extract the DATASUS data you want to use in your Power BI dashboards.

4.  Compile the function with the desired parameter information: The functions of the package download the data from the requested Information System, process the data, performing cleanings, transformations, and organization as necessary for the base to be readable to become useful information on the dashboard.

5.  Update the Power BI dashboard models: After save the .RData file, open the Power BI and change the source of the data, importing the new database through the R code.

## Example

``` r
library(PaNasc)
data <- download.sinasc(inicio = 2022, fim = 2023, UF = "CE")
data_processed <- process.sinasc(data)
rm(data, data_processed)
fNasc_Vivos <- panel.sinasc(data_processed)
save.image("dataset.Rdata")
```

## Contact Info

If you have any questions, please contact me at [luanguto87\@gmail.com](mailto:luanguto87@gmail.com).
