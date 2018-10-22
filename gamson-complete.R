
# load packages
library(tidyverse)
library(hrbrthemes)  # cool themes I found!

# load data
df <- read_csv("data/gamson.csv")

# replicate figure 12.4 from the handout
gg <- ggplot(df, aes(x = seat_share, y = portfolio_share)) + 
  geom_point(shape = 21) + 
  theme_ipsum()

# add line
gg + geom_smooth()  # 2 problems: it's a curve and the error band
gg + geom_smooth(se = FALSE)  # remove error band
gg + geom_smooth(se = FALSE, method = "lm")  # make line straight
  

