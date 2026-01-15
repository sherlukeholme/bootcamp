# install.packages("tidyverse")
# dplyr tidyr ggplot2
library(tidyverse)

# data.frame vs. tibble

df_tibble <- tibble(id = 1:3, name = c("fluke", "jisoo", "lisa"))
df <- data.frame(id = 1:3, name = c("fluke", "jisoo", "lisa"))

# convert dataframe to tibble
mtrcars
mtcars_tibble <- tibble(mtcars)

# sample_n

set.seed(6)
sample_n(mtcars, size=5)

sample_frac(mtcars, size=0.20, replace=T)

# slice
mtcars %>%
  slice(1:5)

mtcars %>%
  slice(6:10)

mtcars %>%
  slice(c(1,3,5))
  
mtcars %>%
  slice(sample(nrow(mtcars),10))

