library(MASS)
library(stargazer)

# Regression model for all cases
load("data/asean_del.rda")

model_1 <- glm.nb(ndelms ~ kofecgidjsdv + polityivsdv + avzcomplex + naseanms + type + media + pol, 
                  data = asean_del)
  
# Regression model for economic cases
load("data/asean_del_econ.rda")
  
model_2 <- glm.nb(ndelms ~ kofecgidjsdv + polityivsdv + avzcomplex + naseanms + type + media, 
                  data = asean_del_econ)

stargazer(model_1, model_2, type = "html", single.row = TRUE, out = "Table 2.doc")
