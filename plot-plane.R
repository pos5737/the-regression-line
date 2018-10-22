
# load packages
library(tidyverse)
library(plotly)

# load data frame
df <- read_csv("data/ht.csv")

# fit model
fit <- lm(height ~ hand_span + forearm_span, data = df)

# create the plane
x_pred <- seq(min(df$hand_span), max(df$hand_span), length.out = 100)
y_pred <- seq(min(df$forearm_span), max(df$forearm_span), length.out = 100)
xy <- expand.grid(hand_span = x_pred, 
                  forearm_span = y_pred)
X <- matrix(nrow = 100, ncol = 100, byrow = TRUE,
             data = predict(fit, newdata = data.frame(xy), interval = "prediction"))

# plot the data and add the plane w/ plotly
plot_ly(df, x = ~ hand_span,
        y = ~ forearm_span,
        z = ~ height) %>%
  add_markers(color = "black") %>%
  layout(scene = list(xaxis = list(title = "Hand Span"),
                      yaxis = list(title = "Forearm Span"),
                      zaxis = list(title = "Height"))) %>%
  add_surface(x = x_pred, y = y_pred, z = X)
