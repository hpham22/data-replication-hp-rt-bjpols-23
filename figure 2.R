load("data/asean_del.rda")

library(emmeans)
library(ggeffects)
library(ggplot2)
library(MASS)
library(patchwork)

# Expected values of the response variable are derived from Model 1 of Table 2
model_1 <- glm.nb(ndelms ~ kofecgidjsdv + polityivsdv + avzcomplex + naseanms + type + media + pol, 
                  data = asean_del)

# Get the minimum and maximum values of "avzcomplex" and "kofecgidjsdv"
min_complex <- min(asean_del$avzcomplex, na.rm = TRUE)
max_complex <- mean(asean_del$avzcomplex, na.rm = TRUE) + sd(asean_del$avzcomplex, na.rm = TRUE)

min_kofecgidj <- min(asean_del$kofecgidjsdv, na.rm = TRUE)
max_kofecgidj <- mean(asean_del$kofecgidjsdv, na.rm = TRUE) + sd(asean_del$kofecgidjsdv, na.rm = TRUE)

# Define the terms argument with the desired range, from min to one standard deviation above the mean
terms_range_complex <- paste0("avzcomplex [", toString(seq(from = min_complex, to = max_complex, length.out = 10)), "]")

terms_range_kofecgidj <- paste0("kofecgidjsdv [", toString(seq(from = min_kofecgidj, to = max_kofecgidj, length.out = 10)), "]")

# # Obtain the predicted values of "ndelms", holding other categorical (continuous) variables at their median (mean) values
pred_complex <- ggemmeans(model_1, terms = terms_range_complex,
                          condition = c(naseanms = 7, type = 2, media = 1, pol = 1))

pred_kofecgidj <- ggemmeans(model_1, terms = terms_range_kofecgidj,
                            condition = c(naseanms = 7, type = 2, media = 1, pol = 1))

# Plot the marginal effects of main predictor variables
me_complex <- ggplot(pred_complex, aes(x, predicted)) + 
  geom_ribbon(aes(ymin = conf.low, ymax = conf.high), alpha = .25) +
  geom_line(aes(x, predicted)) + 
  labs(title = NULL, x = "Policy Complexity", y = "Predicted Major Provisions Granting Discretion") + 
  theme_bw()
  
me_kofecgidj <- ggplot(pred_kofecgidj, aes(x, predicted, group = 1)) + 
  geom_ribbon(aes(ymin = conf.low, ymax = conf.high), alpha = .25) + 
  geom_line(aes(x, predicted)) + 
  labs(title = NULL, x = "Economic Heterogeneity", y = NULL) + 
  theme_bw()

me_complex | me_kofecgidj
