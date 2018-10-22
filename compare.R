
# load packages
library(tidyverse)
library(broom)

# load data frame
df <- read_csv("data/ht.csv")

# fit model
fit1 <- lm(height ~ hand_span, data = df)
fit2 <- lm(height ~ forearm_span, data = df)
fit3 <- lm(height ~ hand_span + forearm_span, data = df)
fit4 <- lm(height ~ hand_span*forearm_span, data = df)  # interaction model

# bind the glanced data frames togther
comp_df <- bind_rows(glance(fit1),
                     glance(fit2),
                     glance(fit3),
                     glance(fit4)) %>%
  glimpse()
