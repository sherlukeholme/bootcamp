install.packages("caret")

set.seed(42)
n <- nrow(mtcars)
id <- sample(n, size = 0.8*n)
train_data <- mtcars [id, ]
test_data <- mtcars [-id, ]

## Split Data
train_test_split <- function(data) {
  set.seed(42)
  n <- nrow(data)
  id <- sample(n, size = 0.8*n)
  train_data <- data [id, ]
  test_data <- data [-id, ]
  return(list(train_data, test_data))
}

split_data <- train_test_split(mtcars) -- สามารถให้ Split train หรือ test ได้ด้วย

train_test_split(mtcars)

## Train Model
lm_model <- train(mpg ~ hp,
      data = split_data[[1]],
      method = "lm") -- method คือชื่อ algorithm ที่เราต้องการใช้งาน
									      ในตัวอย่างนี้คือ lm (linear regression)

## Score and Evaluate
p <- predict(lm_model, newdata = split_data [[2]]) -- ทำนาย test data ของ lm_model

error <- split_data[[2]]$mpg - p -- คำนวณค่า Error
rmse <- sqrt(mean(error**2))

data("mtcars")

# prepare data
mtcars$am <- factor(mtcars$am,
                    levels=c(0,1),
                    labels=c("Auto", "Manual"))

## Split Data
train_test_split <- function(data) {
  set.seed(42)
  n <- nrow(data)
  id <- sample(n, size = 0.7*n)
  train_data <- data [id, ]
  test_data <- data [-id, ]
  return(list(train_data, test_data))
}

split_data <- train_test_split(mtcars)

## Train Model
glm_model <- train(am ~ mpg, # Classification
                  data = split_data[[1]],
                  method = "glm") -- method คือชื่อ algorithm ที่เราต้องการใช้งาน
										                 ในตัวอย่างนี้คือ glm (logistic regression)
## glm ย่อมาจาก generalized linear model โดยค่า default ของ method นี้คือ logistic regression algorithm

## Score and Evaluate
p <- predict(glm_model, newdata = split_data [[2]])

acc <- mean(p == split_data[[2]]$am) -- evaluate model เปลี่ยนมาใช้สูตร accuracy แทน rmse
																				เพราะเป็น classification problem
																				โดยเฉลี่ยโมเดลมันทายถูกกี่เปอร์เซ็น

