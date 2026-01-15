library(tidyverse)
library(mlbench)
library(caret)

## random forest
data("PimaIndiansDiabetes")

df <- PimaIndiansDiabetes

View(df)

## clean data
df <- df[complete.cases(df), ]

## split data
set.seed(12)
n <- nrow(df)
id <- sample(1:n, size = 0.8*n)
train_data <- df[id, ]
test_data <- df[-id, ]

## train model
set.seed(12)
ctrl <- trainControl(method = "cv",
                     number = 5,
                     verboseIter = TRUE)

# mtry.grid = data.frame(mtry = c(3,4,5))

model <- train(diabetes ~ .,
               data = train_data,
               method = "rpart",
               #tuneGrid = mtry.grid,
               trControl = ctrl)

## score and evaluate
p <- predict(model, newdata = test_data)

mean(p == test_data$diabetes)
