## get working directory
getwd()

## library tidyverse
library(tidyverse)

## basic plots (base R)
hist(mrcars$mpg)

## Analyzing horse power
## Histogram - One Quantitive variable
hist(mtcars$hp)
median(mtcars$hp)

str(mtcars) # review structure เบื้องต้นของ df เรา
mtcars$am <- factor(mtcars$am, 
                    levels = c(0,1),
                    labels = c("Auto", "Manual"))
## Bar Plot - One Qualitative variable
barplot(table(mtcars$am)) # สร้างตารางความถี่ขึ้นมา

## Box Plot ใช้ได้ทั้ง 1 ตัวแปร หรือ 2 ตัวแปร quanlitative
boxplot(mtcars$hp)
fivenum(mtcars$hp) # five numbers summary 52=min 96=Q1 123=median Q2 180=Q3 335=max

min(mtcars$hp)
quantile(mtcars$hp, probs = c(.25, .5, .75))
max(mtcars$hp)

## whisker calculation
Q3 <- quantile(mtcars$hp, probs = .75) # 83.5
Q1 <- quantile(mtcars$hp, probs = 0.25)
IQR_hp <- Q3 - Q1 # 84

Q3 + 1.5*IQR_hp
Q1 - 1.5*IQR_hp

boxplot.stats(mtcars$hp, coef = 1.5) # stats 52 96 123 180 264
# $n 32
# $conf 99.5382 146.4618
# $out 335

## filter out outliers
mtcars_no_out <- mtcars %>% 
  filter(hp < 335)

boxplot(mtcars_no_out$hp)

## Boxplot 2 variables
## Qualittive x Quantitative
data(mtcars)
mtcars$am <- factor(mtcars$am, 
                    levels = c(0,1),
                    labels = c("Auto", "Manual"))
boxplot(mpg ~ am,data = mtcars,
        col = c("gold", "salmon"))

## scatter plot
## 2 x Quantitative
plot(mtcars$hp, mtcars$mpg,
     pch = 16,
     col = "blue",
     main = "Relationship btw HP and MPG",
     xlab = "Horse Power",
     ylab = "Mile Per Gallon")
     
cor(mtcars$hp, mtcars$mpg)
lm(mpg ~ hp, data = mtcars)

## ggplot2
## library tidyverse
library(tidyverse)

## First plot
ggplot(data = mtcars, mapping = aes(x = hp, y = mpg)) + 
       geom_point() + # เลือกว่าการแสดงผล คอลัมน์ hp กับ mpg จะ render เป็น scatter plot
       geom_smooth() +
       geom_rug()

ggplot(mtcars, aes(hp, mpg)) +
       geom_point(size = 3, col = "blue", alpha = 0.2) # ยิ่งค่า alpha เข้าใกล้ 1 ยิ่งทึบ เข้าใกล้ 0 ยิ่งจาง

ggplot(mtcars, aes(hp)) +
       geom_histogram(bins = 10, fill = "red", alpha = 0.5) # อย่าใช้ค่า default ต้องกำหนดให้เข้ากับ viz ของเรา

ggplot(mtcars, aes(hp)) +
       geom_boxplot()

p <- ggplot(mtcars, aes(hp))
p + geom_histogram(bins = 10)
p + geom_density()
p + geom_boxplot()

## Box plot by groups # ขอเปลี่ยน dataset ให้ใหญ่ขึ้น diamonds

diamonds %>%
  count(cut)

ggplot(diamonds, aes(cut)) +
  geom_bar(fill = "lightblue") # ordinal factor คือสามารถเรียงสูงกลางต่ำได้ 

ggplot(diamonds, mapping = aes(cut, fill=color)) + 
  geom_bar(position = "fill") # stack เป็นค่า default dodge คือหลบไม่ให้ซ้อนกัน

### scatter plot
set.seed(42) # ใช้ก่อนฟังก์ชัน sample_n
small_diamonds <- sample_n(diamonds, 5000)

ggplot(small_diamonds, aes(carat, price)) + # aes = aesthetic function ลดขนาดเพื่อรันเร็วขึ้น
       geom_point()

## facet: small multiples
ggplot(small_diamonds, aes(carat, price)) + 
       geom_point() +
       geom_smooth(method = "lm", col="red") +
       facet_wrap(~color, ncol=4) +
       theme_minimal() +
       label(title = "Relationship btw carat and price by color",
       x = "cart",
       y = "price USD",
       caption = "source: Diamonds from fgplot2 package")

## final example
ggplot(small_diamonds, aes(carat, price, col=cut)) + 
       geom_point(size=3, alpha=0.4) +
       facet_wrap(~ color, ncol=2) +
       theme_minimal()
 
