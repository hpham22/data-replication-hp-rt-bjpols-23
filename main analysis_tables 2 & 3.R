library(MASS)
library(stargazer)

# Regression model for all cases - Table 2
load("data/asean_del.rda") # main dataset

model_1_tbl2 <- glm.nb(ndelms ~ kofecgidjsdv + polityivsdv + avzcomplex + naseanms + type + media + pol, 
                  data = asean_del)

stargazer(model_1, type = "html", single.row = TRUE, digits = 2, out = "Table 2.doc")
  
# Regression models for sub-sample analysis (economic vs. non-economic cases) - Table 3
load("data/asean_del_econ.rda") # sub-dataset for economic cases
load("data/asean_del_non_econ.rda") # sub-dataset for non-economic cases
  
model_1_tbl3 <- glm.nb(ndelms ~ kofecgidjsdv + polityivsdv + avzcomplex + naseanms + type + media, 
                  data = asean_del_econ)

model_2_tbl3 <- glm.nb(ndelms ~ kofecgidjsdv + polityivsdv + avzcomplex + naseanms + type + media, 
                  data = asean_del_non_econ)

stargazer(model_1_tbl3, model_2_tbl3, 
          type = "html", single.row = TRUE, digits = 2, out = "Table 3.doc")
