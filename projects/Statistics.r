library(tidyverse)

## draw 10,000 samples from diamonds

View(diamonds)

## mean diamonds price
mean(diamonds$price)

## density chart
qplot(price, data=diamonds, geom="density")

## draw just one sample
diamonds %>%
  sample_n(100) %>%
  summarise(avg_price = mean(price)) %>%
  pull()

## replicate 10,000 samples
n_rep <- 10000

result <- replicate(n_rep, {
    diamonds %>%
      sample_n(50) %>%
      summarise(avg_price = mean(price)) %>%
      pull() #เปลี่ยนจาก tibble เป็นตัวเลขธรรมดา สามารถเอาไปใช้ต่อได้เลย
})

den_result <- density(result)

## plot graph
plot(den_result)

## check mean of the 10000 samples
mean(diamonds$price)
mean(result)
