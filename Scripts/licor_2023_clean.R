library(tidyverse)
library(readxl)
library(ggplot2)
library(reshape2)
licor_2023 <- read_excel("~/Library/Mobile Documents/com~apple~CloudDocs/R/R/Version Control/Heat_Water_Acclimation_Masters_Thesis/Data/2023/2023-1/Baseline -WatPot _ LiCor/Licor_data_2023.xlsx")
head(licor_2023)
licor_2023$date <- as.POSIXct(licor_2023$date, format = "%Y%m%d %H:%M:%S")
