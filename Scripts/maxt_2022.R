library(tidyverse)
cimis <- read_csv("Data/Tyree_2022_ReadOnly/CIMIS_2022/cimis_irr.csv")
cimis
jd_irr_cimis <- cimis$Jul
maxt_irr_cimis <- cimis$`Max Air Temp (F)`
maxt_irr_2022_base <- data.frame(jd_irr_cimis, maxt_irr_cimis)
maxt_irr_2022_base
ggplot(maxt_irr_2022_base, aes(x=jd_irr_cimis, y=maxt_irr_cimis)) + geom_point() + geom_smooth(method = lm)
