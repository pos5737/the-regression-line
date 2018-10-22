
# load packages
library(tidyverse)
library(plotly)

# load data frame
df <- read_csv("data/ht.csv")

# find correlations
cor(df$height, df$hand_span)
cor(df$height, df$forearm_span)
