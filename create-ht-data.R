
# load packages
library(tidyverse)

# create ht data set
df <- tribble(
  ~name, ~height, ~hand_span, ~forearm_span,
  "first1", 2, 3.6, 4.3,
  "first2", 1, 8.5, 5.3,
  "first3", 3, 9.5, 6.3,
  "first4", 4, 7.5, 7.3
) 

# write to file
write_csv(df, "data/ht.csv")
  
