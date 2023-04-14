load("data/asean_del.rda")

library(ggplot2)
library(patchwork)

asean_delms <- ggplot(asean_del, aes(x=ndelms)) + 
  geom_histogram(aes(y=..density..), color = "black", fill = "white", bins = 30) +
  geom_density(alpha=.35, fill="grey") +
  geom_vline(aes(xintercept=mean(ndelms, na.rm=T)),
             color="blue", linetype="dashed", size=.5) +
  labs( x="Major provisions granted national discretion", y="Density", title=NULL) +
  theme_bw()

asean_delsupra <- ggplot(asean_del, aes(x=ndelsupra)) + 
  geom_histogram(aes(y=..density..), color = "black", fill = "white", bins = 30) +
  geom_density(alpha=.35, fill="grey") +
  geom_vline(aes(xintercept=mean(ndelsupra, na.rm=T)),
             color="blue", linetype="dashed", size=.5) +
  labs(x="Major provisions granted supranational discretion", y=NULL, title=NULL) +
  theme_bw()

asean_delms | asean_delsupra 