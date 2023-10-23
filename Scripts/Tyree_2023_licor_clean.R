library(tidyverse)
library(readxl)
library(ggplot2)
library(reshape2)
licor_2023 <- read_excel("~/Library/Mobile Documents/com~apple~CloudDocs/R/R/Version Control/Heat_Water_Acclimation_Masters_Thesis/Data/2023/2023-1/Baseline -WatPot _ LiCor/Licor_data_2023.xlsx")
head(licor_2023)
licor_2023$date <- as.POSIXct(licor_2023$date, format = "%Y%m%d %H:%M:%S")
block <- licor_2023$block
row <- licor_2023$Row
vine <- licor_2023$vine
tx <- licor_2023$Tx
species <- licor_2023$Var
date <- licor_2023$date
E <- licor_2023$E
A <- licor_2023$A
Tleaf <- licor_2023$TleafEB
gsw <- licor_2023$gsw
df <- tibble(block, row, vine, tx, species, date, E, A, Tleaf, gsw)
df = df %>% unite(BRV, block, row, vine, sep = "_", remove = FALSE)
# Create the scatter plot
ggplot(df, aes(x = Tleaf, y = A, color = tx)) +
  geom_point() +  # Scatter plot
  facet_grid(~date) +  # Facet by day
  labs(x = "Leaf Temperature (Tleaf)", y = "Net Assimilation Rate (A)") +  # Labels
  scale_color_manual(values = c("2L" = "red", "4L" = "blue")) +  # Custom colors
  theme_minimal()  # Minimalistic theme
##
Tleeafxgsw_plot <- ggplot(df, aes(x = Tleaf, y = gsw, color = tx)) + geom_point() + labs(x = "Leaf Temperature (Tleaf)", y = "Stomatal Conductance (gsw)") + scale_color_manual(values = c("2L" = "red", "4L" = "blue")) + theme_minimal()
Tleeafxgsw_plot <- Tleeafxgsw_plot + geom_smooth(method = lm)
Tleeafxgsw_plot
