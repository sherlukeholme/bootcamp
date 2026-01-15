## grammar of graphic (ggplot2) 2=2D

## how to select charts
## 1. number of variables
## 2. data type of each variable

library(tidyverse)

diamonds
View(diamonds)

## one variable, number
base <- ggplot(data = diamonds,
       mapping = aes(x = price)) + 
   geom_histogram()          

base + geom_histogram(bins = 30) # bin กำหนดจำนวนแท่ง

base + geom_density() 

base + geom_freqpoly()

## discrete จน.เต็ม vs. continuoun มีทศนิยมได้ ขึ้นอยู่ที่มาตรวัด
height = 169.16254326 # by nature เป็น con
temperature = 25.12345278
heart_rate = 80

## one variable, factor (discrete)
ggplot(data = diamonds,
       mapping = aes(x = cut)) +
       geom_bar()

## shortcut function: qplot()
qplot(x=cut, data=diamonds, geom = "bar") + theme_minimal()

qplot(x=price, data=diamonds, geom = "density") + theme_minimal()

## built-in theme in ggplot2
ggplot(diamonds, aes(x = cut)) 
  geom_bar() +
  theme_minimal()

## ggthemes
library(ggthemes)
qplot(x=cut, data=diamonds, geom="bar") +
  theme_minimal()
  
## two variables, both number
## scatter plot
set.seed(42)
mini_dia <- sample_n(diamonds, 2000)

## setting vs. mapping > mapping คือการ map column ไปที่ element ของ chart ส่วน setting คือการ set ค่าอื่น ๆ
ggplot(data = mini_dia, 
       mapping = aes(x = price, y = carat, color = cut)) + 
       geom_point( alpha=0.3,
                  size=3) +
       theme_minimal()

ggplot(data = mini_dia, 
       mapping = aes(x = price, y = carat, color = depth)) + 
       geom_point( alpha = 0.3,
                  size = 3 ) +
       scale_color_gradient(low = "gold",
                            high = "390ba3") +
       theme_minimal() # เวลา map column ที่เป็นตัวเลขจะเป็นเฉดสี ให้ใส่ f:scale_color_gradient เพื่อปรับเฉด

## multiple charts in one ทำได้แต่ไม่ควรทำ
base <- ggplot(sample_n(diamonds, 500),
               aes(x = price, y = carat)) +
        theme_minimal()
        
base +
  geom_point(alpha = 0.25) +
  geom_smooth(method = "Ioess",
              color = "red",
              se = FALSE) +
  geom_rug()

## method 01: create new column
diamonds %>%
  mutate(price_segment = if_else(price >= 10000, "High", "Low")) %>%
  sample_n(500) %>%
  ggplot(data = .,
         mapping = aes(x = price, y = carat, color = price_segment)) +
  geom_point() +
  scale_color_manual(values = c("black", "gold")) +
  geom_smooth() +
  theme_minimal()

## mtcars
mtcars %>%
ggplot(data = ., mapping = aes(x = mpg)) +
geom_density()

## method 02: call ggplot() twice
df <- sample_n(diamonds, 2000)
ggplot() + 
   geom_point(
     data = filter(df, price >= 10000),
     mapping = aes(x = price, y = carat),
     color = "#0452b8"
   ) + 
   geom_point(
     data = filter(df, price < 10000),
     mapping = aes(x = price, y = carat),
     color = "gold"
   ) +
   theme_minimal()

## stack bar in ggplot
## two variables, both discrete

diamonds %>%
    count(cut, color)
    
ggplot(data = diamonds,
       mapping = aes( x = cut, fill = color)) +
    # ถ้า position = "fill" จะเป็น stacked bar 100%
    geom_bar(position = "dodge") +
    theme_minimal() +
    ## add labels to the chart
    labs( x = "Cut Quality",
          y = " Proportion",
          title = "Stacked bar Chart for Cut x Color",
          subtitle = "Created by flaluke 2025")

## box plot, violin plot
## two variables, discrete x continuous

## five number summary 
#z min, q1, q2 (median), q3, max
## violin เหมาะกับการดู distribution box plot ดู outliner และการกระจายตัวของกล่อง
diamonds %>% 
    group_by(cut) %>%
    summarise(min_price = min(price),
              q1 = quantile(price, 0.25),
              q2 = median(price),
              q3 = quantile(price, 0.75),
              max = max(price))
ggplot(data = diamonds,
       mapping = aes(x = cut, y = price)) +
     geom_boxplot()

ggplot(data = diamonds,
       mapping = aes(x = cut, y = price, fill = cut)) +
     geom_violin() +
     theme_minimal()

## facet -> the most powerful data viz technique in R
## small particles

ggplot(data = diamonds,
       mapping = aes(x = carat, y = price)) +
     geom_point(color = "red", alpha = 0.3) +
     geom_smooth(color = "black", se = FALSE) +
     facet_wrap(~cut, ncol=5) + # facet_grid(cut ~ color)
     theme_minimal()

## Quick Summary
## ggplot 2D
## mapping vs. setting
## facet => small charts

##color palette
ggplot(diamonds, aes( x = carat, y = price,
                      color = cut)) +
    geom_point(size = 2, alpha = 1) +
    scale_color_brewer(type = "qual", palette = 1) +
    theme_minimal()                 

