
# load packages
library(tidyverse)
library(broom)

# load data frame
df <- read_csv("data/ht.csv")

# fit model
fit <- lm(height ~ hand_span, data = df)

# several ways to see results
arm::display(fit)
texreg::screenreg(fit)
summary(fit)

# tidy the fit
augment(fit)  # observation-level summaries (we know .resid)
tidy(fit)  # parameter-level summaries (we know estimate)
glance(fit)  # model-level summaries (we know sigma = rms eror of regression)

# notes
## other ways to get the coefficient estimats
coef(fit)
tidy(fit)$estimate

## other ways to get the rms error of the regression
e <- residuals(fit)  # extract residuals to simplify the code a bit
sqrt(mean(e^2))  # rmse of regression
glance(fit)$sigma  # glance's sigma gives a corrected version
sqrt(sum(e^2)/(length(e) - length(coef) - 1)) # here's how to compute the corrected version


