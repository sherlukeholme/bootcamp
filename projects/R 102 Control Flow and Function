# if
# if() in google sheets

scores <- 39

if (score >= 90){
  print("Passed")
} else {
  print("failed")
}

if (score >= 90) {
  print("passed")
} else if (score >= 50) {
  print("Ok")
} else {
  print("Enroll again!")
}

score <- 95
ifelse(score >= 80, "Passed", "Failed")
# "Passed"

score <- 72
ifelse(score >= 80, "Passed", "Failed")
# "Failed"

score <- 25
ifelse(score >= 90, "Passed", ifelse(
    score >= 50, "Ok", "Enroll Again"
))
# "Enroll Again"

# for loop example
scores <- c(50, 88, 75, 80,95)

for (score in scores) {
    if (score >= 80) {
      print("pass")
   } else {
     print("fail")
   }
} 

friends <- c("F", "B", "BT", "P")

for (friend in friends) {
  print(paste("Hi!", friend)) 
}

## vectorization
paste("Hi!", friends) # "Hi! F", "Hi! B", "Hi! BT", "Hi! P"

nums <- c(5, 10, 12, 20, 25)
nums <- nums + 2

(nums <- nums - 2)

# while loop
count <- 0

while (count < 5) {
  print ("Hi")
  count <- count + 1
}

# function
# input -> f() -> output

x <- c(10, 25, 50, 100)

sum(x) # 185
mean(x) # 46.25
sd(x) # Standard Deviation 39.44933
# help(sd)

# Create our first function

greeting <- function(){
  print("Hello World!")
}

greeting_name <- function(name) {
  print( paste("Hello",name) )
}
# greeting_name("F")
# "Hello! F"

func <- function() {
  greeting()
  greeting_name ("F")
}

# func()
# "Hello world!"
# "Hello! F"

# สามารถใส่ default เข้าไปรอก่อนได้เลย
greeting_name <- function(name = "F") {
  print( paste("Hello",name) )
}
# greeting_name()
# "Hello! F"

# อยากจะ overize ค่า name สามารถใส่ชื่อใหม่เข้าไป
# greeting_name(name = "N")
# "Hello! N"

# ไม่ต้องใส่ชื่อ parameter name ก็ได้
# greeting_name("N")
# "Hello! N"

# สามารถรับ parameter ได้มากกว่า 1
greeting_name <- function(name = "F", age = 23) {
  print( paste("Hello", name) )
  print( paste("Age:", age))
}

# greeting_name()
# "Hello! F"
# "Age: 23"

# greeting_name(name = "N", age = 24)
# "Hello! N"
# "Age: 24"

# สลับตำแหน่ง parameter ก็ได้
# greeting_name(age = 24, name = "N")
# "Hello! N"
# "Age: 24"

# ถ้าไม่ใส่ parameter จะ run ลำดับผิด ต้องใส่ลำดับให้ถูก
# greeting_name("N", 24)
# "Hello! N"
# "Age: 24"

# add_two_nums() function
add_two_nums <- function(x, y){
  return(x + y)
}

add_two_nums(10, 15)
# 25
add_two_nums(10, 150)
# 160

# ไม่ต้องเขียน return ก็ได้
add_two_nums <- function(x, y){
  (x + y)
}

# cube() function
cube <- function(base, power=3) {
  return(base ** power)
}

# cube(5)
# 125

# สามารถ overize ค่า หรือไม่ใส่ parameter ก็ได้
# cube(5, power=4)
# 625
# cube(5, 4)
# 625
# cube(power = 4, base = 5) = 5**4
# 625

# count_ball() function
balls <- c("red", "red", "blue", "green", "green", "green", "red")

count_ball <- function(balls) {
  sum(balls == "red")
}

# ลองลบคำว่า sum() ทิ้ง จะแสดง logical comparison
# balls == "red"
# TRUE TRUE FALSE FALSE FALSE FALSE FALSE TRUE
# sum(balls == "red")
# 3
# sum(balls == "blue")
# 1
# sum(balls == "green")
# 4

# อยากจะเช็คสีใน ฟังก์ชันด้วย
count_ball <- function(balls, color) {
  sum(balls == color)
}

# count_ball(balls, "red")
# 3
# count_ball(balls, "green")
# 4
# count_ball(balls, "blue")
# 1

# loop over a dataframe
# R มาพร้อมกับ build-in dataset

data()
USArrests

class(USArrests)
"data.frame"

View(USArrests)

# ถ้าไม่ใช้ loop สามารถ refer ไปที่แต่ละคอลัมน์ได้ โดยการพิมพ์ชื่อ dataframe ก่อน
mean(USArrests$Murder)
# แต่ถ้ามีหลายคอลัมน์ก็คงไม่ไหว Do not repeat yourself
หา nrow(USArrests) กับ ncol(USArrests)
head(USArrest)

for(i in 1:ncol(USArrests)) {
  print(names(USArrests)[i])
}
# "Murder"
# "Assault"
# "Urbanpop"
# "Rape"

# ใน R ใช้แค่ฟังก์ชัน name ก็พอ
names(USArrests)
# "Murder" "Assault" "Urbanpop" "Rape"

# loop over columns
for(i in 1:ncol(USArrests)) {
  print(names(USArrests)[i])
  print(mean(USArrests[[i]]) )
}
# "Murder"
# 7.788
# "Assault"
# 170.76
# "Urbanpop"
# 65.54
# "Rape"
# 21.232

mean(USArrests$Murder)

#สามารถทำให้ generic ขึ้นได้โดยการทำเป็น function
cal_mean_by_column <- function(df)
for(i in 1:ncol(df)) {
  print(names(df)[i])
  print(mean(df[[i]]) )
}

cal_mean_by_column(USArrests)
cal_mean_by_column(mtcars)

# refactor our code for more readability
cal_mean_by_col <- function(df) {
  col_names <- names(df)
  
  # we use [[]] to extract column as vector
  for (i in 1:ncol(df)) {
    avg_col <- mean(df[[i]]) 
    print(paste(col_names[i], ":", avg_col))
  }
}

# test our code with mtcars
cal_mean_by_col(mtcars)

# "mpg : 20.090625"
# "cyl : 6.1875"
# "disp : 230.721875" ...

# apply function
apply(mtcars, MARGIN=2, mean)

avg_by_row_mtcars <- apply(mtcars, MARGIN=1, mean) #by row

avg_by_row_mtcars[1:10] # rowที่ 1 - 10

apply(mtcars, MARGIN=2, sum)
apply(mtcars, MARGIN=2, sd)
apply(mtcars, MARGIN=2, median)
