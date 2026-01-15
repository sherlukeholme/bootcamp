## Correlation
cor(mtcars$mpg, mtcars$hp)
cor(mtcars$mpg, mtcars$wt)

plot(mtcars$hp, mtcars$mpg, pch=16) # เวลา plot กราฟ ตำแหน่งมีผล ซ้ายแกน x ตัวแปรต้น ขวาแกน y ตัวแปรตาม
plot(mtcars$wt, mtcars$mpg, pch=16)
plot(mtcars$wt, mtcars$hp, pch=16)

cor(mtcars[ , c("mpg", "wt", "hp")])

## dplyr (tidyverse)
library(dplyr)
CorMat <- mtcars %>%
  select(mpg, wt, hp) %>%
  cor()

## compute correlation (r) and sig test
cor(mtcars$hp, mtcars$mpg)
cor.test(mtcars$hp, mtcars$mpg)

## Linear Regression
## mpg = f(hp)
## ~ แปลว่า เป็นฟังก์ชันของ

lmFit <- lm(mpg ~ hp, data = mtcars)

summary(lmFit)

## prediction
lmFit$coefficients[[1]] + lmFit$coefficients[[2]]*200

new_cars <- data.frame(
  hp = c(250, 320, 400, 410, 450)
)

## predict()
new_cars$mpg_pred <- predict(lmFit, newdata = new_cars)
new_cars$hp_pred <- NULL
new_cars

summary(mtcars$hp) ## ข้อจำกัดของ linear regressionยิ่งใส่ hp มาก ค่า mpg ยิ่งลดลงเรื่อย ๆ อย่าง linear ไม่ควรให้ทำนายค่า +- 10% จากค่าที่เทรน วิธีแก้ เก็บข้อมูลให้มากขึ้น

## Root Mean Square Error (rmse) ใช้วัดผล model linear regression
## Multiple Linear Regression
## mpg = f(hp, wt, am)
## mpg = intercept + b0*hp + b1*wt + b2*am

lmFit_v2 <- lm(mpg ~ hp + wt + am, data = mtcars)

coefs <- coef(lmFit_v2)
coefs[[1]] + coefs[[2]]*200 + coefs[[3]]*3.5 + coefs[[4]]*1

## Build Full Model
lmFit_Full <- lm(mpg ~ ., data = mtcars) # mpg เป็นฟังก์ชันของ . ทุกตัวแปรต้นที่อยู่ใน df นี้ใข้ทำนาย mpg ได้เลย
lmFit_Full <- lm(mpg ~ . - gear, data = mtcars) # ไม่อยากได้ตัวแปร gear

mtcars$predicted <- predict(lmFit_Full) # argument 2 ถ้าเราไม่ใส่ newdata มันจะใช้ df ก้อนเดิม

head(mtcars)

## Train RMSE ค่า error ของ dataset ที่ใช้เทรน model นี้ขึ้นมา
squared_error <- (mtcars$mpg - mtcars$predicted) ** 2
(rmse <- sqrt(mean(square_error)))

## Split Data
set.seed(42)
sample(1:10, 3)

set.seed(6)
n <- nrow(mtcars)
id <- sample(1:n, size = n*0.7)
train_data <- mtcars[id,  ]
test_data <- mtcars[-d,  ]

## Train Model
model1 <- lm(mpg ~ hp + wt, data = train_data)
p_train <- predict(model1)
(rmse <- sqrt(mean((train_data$mpg - p_train) ** 2 )))

model1 <- lm(mpg ~ hp + wt + am + disp , data = train_data)
p_train <- predict(model1)
error_train <- train_data$mpg - p_train
rmse_train <- sqrt(mean((error_train) ** 2 )))

## Test Model
p_test <- predict(model1, newdata = test_data)
error_test <- test_data$mpg - p_test
rmse_test <- sqrt(mean((error_test) ** 2 ))

## Print Result
cat("RMSE Train:", rmse_train, "\n")
cat("RMSE Test:", rmse_test)

cat("RMSE Train:", rmse_train,
    "\nRMSE Test:", rmse_test)

## Logistic Regression ใช้ทำนายตัวแปรตามที่เป็น factor

library(dplyr)
mtcars %>% head()

str(mtcars)

## convert am to factor
mtcars$am <- factor(mtcars$am, 
                    levels = c(0,1),
                    labels = c("Auto", "Manual"))
class(mtcars$am)
table(mtcars$am)

## split data
set.seed(6)
n <- nrow(mtcars)
id <- sample(1:n, size = n*0.7)
train_data <- mtcars[id,  ]
test_data <- mtcars[-d,  ]

## train model ( generalize linear model )
logit_model <- glm(am ~ mpg, data = train_data, family = "binomial" ) # result เป็น link logit ไม่ใช่ค่าที่เราใช้
p_train <- predict(logit_model, type="response" ) # สามารถทำนายผลได้หลายแบบ type จะเป็นตัวกำหนด probability
error
train_data$pred <- if_else(p_train >= 0.5, "Manual", "Auto")
mean(train_data$am == train_data$pred)

## test model
p_test <- predict(logit_model, newdata = test_data, type="response" ) # สามารถทำนายผลได้หลายแบบ type จะเป็นตัวกำหนด probability
error
test_data$pred <- if_else(p_test >= 0.5, "Manual", "Auto")
mean(test_data$am == test_data$pred)

# เกิดปห overfit เช่นกันเพราะ data ไม่เยอะพอที่จะสอนโมเดลให้เห็น pt ต่าง ๆ 
