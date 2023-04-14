load("data/asean_del.rda")

library(ggeffects)
library(MASS)
library(stargazer)

model_1 <- glm.nb(ndelms ~ kofecgidjsdv + polityivsdv + avzcomplexv + naseanms + type + media + pol, 
                  data = asean_del)
  
load("data/asean_del_econ.rda")
  
model_2 <- glm.nb(ndelms ~ kofecgidjsdv + polityivsdv + avzcomplexv + naseanms + type + media, 
                  data = asean_del_econ)

stargazer(model_1, model_2, type = "html", single.row = TRUE, out = "Table 2.doc")
