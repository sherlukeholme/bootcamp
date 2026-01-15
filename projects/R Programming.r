## basic calculator
1+1
2+2
3*2
5/2
10-3

(5*3) / 2

## modulo
5 %% 2 # เหลือเศษ 1
5 %% 5 # 0
5 %% 4 # 1
10 %% 3 # 1
10 %% 7 # 3

5 ** 2 # 25
3 ** 2 # 9
3 ** 3 # 27
3 ** 2; 3 ** 3; 5 ** 2 # 9
                       # 27
                       # 25

abs(-10) # 10
-10 * -1 # 10
log(2) # 0.6931472
exp(10) # 22026.47

## Snake case for variable naming

my_university <- "Chulalongkorn U."
name <- "F"
age <- "23"

## remove variable
rm(my.university)

## assign สามารถวิ่งได้ 2 ทาง
"It doesn't have to be crazy at work" -> my_fav_book

## number, character, date, factor (categorical data), logical (TRUE,FALSE)

name <- "fluke"
degree <- "law"
slogan <- "im loving icecream"
age <- 23
gpa <- 3.02
tiktok_lover <- FALSE # สามารถเขียน T หรือ F ใหญ่แทนก็ได้

## ! negate: reverse condition เปลี่ยน T เป็น F เปลี่ยน FALSE เป็น TRUE
!tiktok_lover # TRUE

## how to create date 101
today <- "2025-10-04"
class(today) # character
class(name) # character
class(age) # numeric
# convert data types
today <- as.Date(today)
# เปลี่ยน class ให้กลายเป็น date แล้ว assign ลงค่าเดิม
class(TRUE) # logical
class(FALSE) # logical

## how to create factor 101
gender <- c("male", "female", "female")
gender <- as.factor(gender)
class(gender) # factor

fruits <- c("orange", "apple", "apple", "lemon")
fruits <- as.factor(fruits)
class(fruits) # factor
table(fruits) # จงสร้างตารางความถี่ขึ้นมา ของแต่ละประเภทมีกี่แบบ แต่ละเพศมีคนอยู่กี่คน

## Recap: class(), as.type(), is.type()
is.numeric(100) # TRUE
is.factor(gender) # TRUE
is.factor(fruits) # TRUE
is.logical(TRUE) # TRUE

## Ask R if this is TRUE or FALSE
1+1 == 2 # T
1+9 == 10 # T

5 > 2 # T
10 < 200 # T 

10 != 10 # F

## R case sentitive
"f" == "F" #FALSE

## 1. vector (single data type)
## 2. matrix
## 3. list
## 4. dataframe

1:10
11:20
21:100

friends <- c("B", "BT", "P", "A", "F")

## subset the vector
## [1] subset by position
friends[2] # "BT"
friends[6] # NA
friends[1:3] # "B", "BT", "P"
friends[4:5] # "A" "F"
friends[ c(1,3,5) ] # "B", "P", "F"

## [2] subset by condition
ages <- c(24, 24, 23, 22, 23)
ages >= 23 # TRUE TRUE TRUE FALSE TRUE
friends[ ages >= 23 ] # "B" "BT" "P" "F" ชื่อคนไหนที่อายุมากกว่าเท่ากับ 23 ที่เป็น TRUE จะดึงออกมาเลย
friends[ ages == 22 ] # "A"

## [3] subset by name
ages <- c(B=24 ,P=23 , F=23)
ages[1] # B   by position
        # 24
ages[ages == 23] #  P F  by condition
                 # 23 23
ages["B"] # B  by name
          # 24


## example matrix 
m1 <- matrix(1:10 ,ncol=5)
m1 # 1 3 5 7 9
   # 2 4 6 8 10
   
m1 <- matrix(1:10 ,ncol=5 ,byrow = TRUE)

help(matrix)
?matrix

# การ wrap code โดยการใส่วงเล็บครอบตอนประกาศตัวแปรใหม่ขึ้นมา แล้วกด run จะประกาศตัวแปรนั้นและโชว์ผลลัพธ์เลย 
(m2 <- matrix( 
       c(3, 4, 5, 8, 10, 12), 
       ncol = 3, 
       TRUE 
))

(income <- 35000)

## element wise computation
ทุกอย่างที่ทำใน vector ได้ ทำใน matrix ได้หมดเลย
m2 * 2 #  6 8 10  เป็นการเอาเลข 2 เข้าไปคูณในทุก element ที่อยู่ใน matrix ตัวนั้นเลย
       # 16 20 24
m2 - 100
m2 + 100
m2 * 5

(m3 <- matrix(
  c(5,5,5,10,10,10),
  ncol = 3,
  byrow = TRUE
))
m2 + m3 #   8 9 10
        #  18 20 22

## Bonus - Matrix Multiplication
m1 <- matrix(1:6, ncol=3)
m2 <- matrix(c(5,5,6,6,9,10), ncol=2)

m1 %*% m2 # เรียกว่า dots หรือ products
m1 * m2 # จะขึ้น error เพราะขนาดไม่เท่ากัน ถึงจะ element wise computation กันได้

## list .. uses key-value pair
fluke <- list(
  firstname = "Siwakorn",
  dob = "06-Dec",
  age = 23,
  tiktok = FALSE,
  fav_books = c("Slow Productivity",
                "How to be Better",
                "Brain Audit")
)
class(fluke) # "list"
fluke["firstname"] # "Siwakorn"
fluke["dob"] # "06-Dec"
fluke["fav_movie"] # ถ้าเขียนผิดจะออกมาเป็นค่า NULL

fluke["fav_books"] #$fav_books ดึงค่าออกมาเป็น list มีค่า $ อยู่
fluke[["fav_books"]] # ดึงค่าออกมาเป็น vector "Slow Productivity" "How to be Better" "Brain Audit"
fluke[["fav_books"]][1] # "Slow Productivity"

fluke$firstname # "Siwakorn"
fluke$fav_book[1] # "Slow Productivity"

names(fluke) # "firstname" "dob" "age" "tiktok" "fav_book"

jenny <- list(
  nationality = "Korean",
  age = 28,
  city = "London",
  tiktok = TRUE,
  group = "Black Pink"
)

## nested list แต่ละคนไม่จำเป็นต้องมี key เหมือนกัน แต่ถ้าแต่ละคนมี attributes เหมือนกัน สามารถ build เป็น dataframe ได้
all_friends <- list(
  fluke = fluke,
  jenny = jenny
)

all_friend$jenny$age # 28
all_friend$fluke$age # 23


## dataframe (the most important for data analyst)

## build from scratch

id <- 1:5
friends <- c("fluke", "lisa", "jisoo", "jenny", "david")
age <- c(37, 25, 30, 22, 28)
city <- c("bangkok", rep("london", 3), "tokyo")

## dataframe
df <- data.frame(id, 
                 friends, 
                 age, 
                 city)
View(df) # Viewer ต้องใช้เป็น V v จะ error

df[3,  ] # จงดึงแถวที่ 3 มาทุกคอลัมน์เลย
         # id friends age city
         # 3  jisoo  30  london
df[3, c(2,4)] # ดึงแถวที่ 3 คอลัมน์ที่ 2 และ 4
              # friends city
              # jisoo  london
df[   , 1:2] # ดึงมาทุกแถว คอลัมน์ที่ 1 และ 2
df[4:5, 4]
df[4:5, "city"]
df[df$friends %in% c("jenny", "david"), "city"]
df[df$friends %in% c("jenny", "david"), 4]

df$friends
df$city
df$age
df[df$age < 30, ] # subset by condition
df[df$age < 30, "friends" # ข้างหน้า subset by condition ข้างหลัง subset by name
df[df$age < 30, ]$friends

library(sqldf)
mean(df$age) # 28.4
sum(df$age) # 142
sum(df$age) / length(df$age) # 28.4
sum(df$age) / nrow(df) # 28.4
sqldf("select avg(age) from df") # 28.4
sqldf("select city, count(*) from df group by 1") # city  count(*)
                                                  # bangkok 1
                                                  # london 3
                                                  # tokyo 1         
                                  
str(df) # 5 obs. of 4 variables   nrow(df) # 5
ncol(df) # 4
df$city <- as.factor(df$city)
str(df)
summary(df)                                        
## create column พิมพ์ df$ ตามด้วยชื่อคอลัมน์ใหม่ และ assign values ใหม่เข้าไปตามขนาด dataframe เดิม
df$reading <- c(T,T,T,F,F)
df[df$reading, ] # ถ้าเงื่อนไข return กลับมาเป็นคำว่า TRUE มันจะดึงค่านั้นกลับมาให้เราเลย
df[df$reading == T, ] # redundance

df[df$reading == F, ]
df[!df$reading, ] # ใส่เครื่องหมายตกใจ จะเป็นคำว่า false

## remove column df$ ตามด้วยชื่อคอลัมน์ที่อยากลบ แล้ว assign ค่า NULL จะลบคอลลัมน์นั้นออกไปเลย
df$reading <- NULL 
df <- df[ ,1:4]

## export df to csv (googlesheet/ excel)
write.csv(df, "friends.csv", 
          row.names = FALSE) # จงส่งออกไฟล์ dataframe ก้อนนี้ เขียนออกเป็น csv file ไม่เอา 1,2,3,4,5 ที่เป็นชื่อแถวติดมาด้วย

df <- read.csv("friends.csv") # อ่านไฟล์ .csv และโชว์ผลลัพธ์ ประกาศเป็นตัวแปร 

# เลือกไฟล์ใน cloud > More > Export

paste0("I love ", "datarockie")
# "I love datarockie !"
paste0("I am so ", "hungry ", "I want to eat pizza!")
# "I am so hungry I want to eat pizza!"
paste0("today is ", "a good day!")
# "today is a good day!"

name <- "fluke"
age <- 23

paste0("Hello my name is ", name, ". This year I'm ", age, " years old.")
# 'Hello my name is fluke. This year I'm 23 years old."

## create your own functions
greeting <- function () {
    print("hello world")
}

greeting # จะขึ้น defination
greeting() # "hello world"

## function -> reusable functions

greeting <- function() {
  user_name <- readline("What's your name: ")
  user_age <- as.numberic(readline("How old are you: "))
  print(class(user_name))
  print(class(user_age))
}

greeting <- function() {
  user_name <- readline("What's your name: ")
  user_age <- readline("How old are you: ")
  text <- paste0("Hello! ", user_name)
  print(text)
}

## function with one input
double <- function(number) {
  return(number*2)
}
double(10) # 20
double(15) # 30
double(99) # 198

double <- function(x) x*2

## function with two inputs
## สามารถ default input หรือ default argument ได้
cube <- function(base, power) base**power
cube(5, 2) # 25
cube(5, 3) # 125
cube(2, 3) # 8
cube(2, 4) # 16

cube <- function(base, power=3) base**power
cube(5) # 125
cube(5, 3) # 125
cube(5, 4) # 625
25 * 25 # 625
35 * 35 # 1225
65 * 65 # 4225
95 * 95 # 9025
85 * 85 # 7225

## sum series of numbers
sum_series <- function(first, last) {
  result <- (first+last)* last / 2
  return(result)
}
sum_series(1, 10) # 55
sum_series(1, 100) # 5050

## if, for, while
grading <- function(score) {
  # score between 0-100 ใส่ไว้เตือน
  # return grade: A,B,C,Failed
  if (score >= 80){
    return("pass")
  } else {
    return("failed")
  }
}

grading(85) # "passed"
grading(65) # "failed"

## multiple grades
grading <- function(score) {
  # score between 0-100 ใส่ไว้เตือน
  # return grade: A,B,C,Failed
  if (score >= 80){
    return("A: Excellent")
  } else if (score >= 70) {
    return("B: Good")
  } else if (score >= 60) {
    return("C: OK")
  } else {
    return("Failed")
  }
}

grading(85) # "A: Excellent"
grading(79) # "B: Good"
grading(69) # "C: OK"
grading(55) # "Failed"

grading <- function(score) {
  ## explicit type conversion เปลี่ยน type ด้วยตัวเอง
  score <- as.numeric(readline("What is this student's score: "))
  
  ## check if the score is valid
  if (score > 100 | score < 0) {
    return("Your score is not valid. It should be between 0-100.")
  } 
  
  ## return grade
  if (score >= 80){
    return("A: Excellent")
  } else if (score >= 70) {
    return("B: Good")
  } else if (score >= 60) {
    return("C: OK")
  } else {
    return("Failed")
  }
}

score <- readline("What is this student's score: ") # "What is this student's score: " 85
score # "85"
class(score) # "character"

score >= 80 # TRUE
score >= 90 # FALSE
score == 80 # F
score == 85 # T

grading()
what is this student's score: 90 # "A: Excellent"
grading()
what is this student's score: 70 # "B: Good"
grading()
what is this student's score: 55 # "Failed"
grading()
what is this student's score: -5 # "Your score is not valid. It should be between 0-100."

## if (condition & condition | condition)

## for
nums <- c(5, 12, 20, 25, 30)
for (num in nums) {
  if (num >= 20) {
    print(num)
  }
}
# 20
# 25
# 30

for (num in nums) {
  if (num < 20) {
    print(num)
  }
}
# 5
# 12

## vectorization
nums[nums < 20] # 5 12
nums[nums >= 20] # 20 25 30
nums >= 20 # FALSE FALSE TRUE TRUE TRUE

## say hi to each friend in the vectors
friends <- c("fluke", "tem", "ask")

greeting_v2 <- function(friends){
  for(friend in friends) {
    print(paste0("Hello! ", toupper(friend)))
  }
}

greeting_v2(friends)
# "Hello! fluke"
# "Hello! tem"
# "Hello! ask"

greeting_v2(friends)
# "Hello! FLUKE"
# "Hello! TEM"
# "Hello! ASK"

paste0("Hello! ", toupper(friends)) # "Hello! FLUKE" "Hello! TEM" "Hello! ASK"

## fruits
fruits <- c("apple", "lemon", "orange", "durian", "pineapple")
for (fruit in fruits) {
  print(nchar(fruit))
}

# 5
# 5
# 6
# 6
# 9

nchar(fruits) # 5 5 6 6 9

## while
count <- 0
while (count < 5) {
  print("Hello")
  count <- count + 1
}
# "Hello"
# "Hello"
# "Hello"
# "Hello"
# "Hello"

## while TRUE do something, until the user is bored.
play_game <- function() {
  while(TRUE) {
    input <- readline("What is your favorite animal: ")
    print(input)
    }
}

play_game()
What is your favorite animal: tiger
# "tiger"
play_game()
What is your favorite animal: lion
# "lion"
play_game()
What is your favorite animal: cat
# "cat" จะรันจนกว่าเรากด esc

play_game <- function() {
  while(TRUE) {
    input <- readline("What is your favorite animal: ")
    if (input == "exit") {
      print("Goodbye for now!")
      break
    }
    print(paste0("Your favorite animal is: ", input))
    }
}

play_game()
What is your favorite animal: tiger
# "Your favorite animal is: tiger"
What is your favorite animal: lion
# "Your favorite animal is: lion"
What is your favorite animal: monkey
# "Your favorite animal is: monkey"
What is your favorite animal: exit
# "Goodbye for now!"

# ได้ผลลัพธ์แบบเดียวกับด้านบน
play_game <- function() {
  counter <- TRUE
  while(counter) {
    input <- readline("What is your favorite animal: ")
    if (input == "exit") {
      print("Goodbye for now!")
      counter <- FALSE
     } else { 
       print(paste0("Your favorite animal is: ", input))
   }
}

## sample()
faces <- c("✊🏻", "✌🏻", "🖐🏻")
sample(faces, 1)

## Homework
## 1. pao ying chub

play_pyc <- function() {
  # 1. การเตรียมตัวแปร: ดีแล้ว
  hands <- c("✊🏻", "✌🏻", "🖐🏻")
  hand_letter <- list(
    "R" = "✊🏻",
    "S" = "✌🏻",
    "P" = "🖐🏻"
  )
  total_score <- 0
  
  print("---Ready to PYC_Ring (Com vs Me)---")
  print("type R (Rock), S (Scissors), P (Paper) to start or exit to quit")
  
  while(TRUE) {
    # 2. รับอินพุต (ควรแปลงเป็นพิมพ์ใหญ่ก่อนเพื่อรองรับ 'r' 's' 'p')
    user_input_raw <- toupper(readline("Choose your hand: ")) # เปลี่ยนชื่อตัวแปรเป็น user_input_raw
    
    # 3. ตรวจสอบการออกจากเกม
    if (user_input_raw == "EXIT") {
      print("--- Game Over ---")
      print(paste0("Totally, computer score is : ", total_score))
      break
    }
    
    # 4. ตรวจสอบอินพุตที่ไม่ถูกต้อง (แก้ไขจุดผิดที่ 1)
    # ใช้ names(hand_letter) เพื่อให้ได้ "R", "S", "P" มาเปรียบเทียบ
    if (!(user_input_raw %in% names(hand_letter))) {
      print("❌ please type R, S, P, or exit only") # แก้ไขจาก return() เป็น print()
      next # ใช้ next เพื่อข้ามรอบนี้ และกลับไปเริ่มต้นลูปใหม่
    }
    
    # 5. แปลงอินพุตเป็นสัญลักษณ์ (ใช้ตัวแปรที่รับมาใหม่)
    user_hand <- hand_letter[[user_input_raw]]
    
    # 6. สุ่มมือคอมพิวเตอร์ (***แก้ไขจุดที่ 2***: คุณสุ่ม comp_hand สองครั้ง! ต้องลบ comp_hand เดิมทิ้ง)
    comp_hand <- sample(hands, 1) # สุ่มแค่ตรงนี้เท่านั้น
    
    print(paste0("my hand: ", user_hand, " | computer hand: ", comp_hand))
    
    # 7. การตัดสินผลและให้คะแนน: ส่วนนี้ถูกต้องแล้ว
    score_change <- 0
    result_msg <- ""
    if (user_hand == comp_hand) {
      score_change <- 0
      result_msg <- "ว้ายย เสมอจร้า! (0)"
    } else if (
      (comp_hand == "✊🏻" & user_hand == "✌🏻") |
      (comp_hand == "✌🏻" & user_hand == "🖐🏻") |
      (comp_hand == "🖐🏻" & user_hand == "✊🏻")
      # ลบเครื่องหมาย | ตัวสุดท้ายออก
    ) {
      score_change <- 1
      result_msg <- "อุ๊บ loser! 🤖(+1)"
    } else {
      score_change <- -1
      result_msg <- "เหอะ ได้แค่นี้เรอะ! 🤡(-1)"
    }
    
    total_score <- total_score + score_change
    
    print(result_msg)
    print(paste0("อ่อนแอก็แพ้ไปพวก loser: ", total_score))
  }
}


## 2. pizza restaurant
order_pizza <- function() {
  ## bot: greeting
  print("Hi")
  u_name <- readline("What's your name? ")
  print(paste0("Welcome to our online restaurant, ", u_name))
  ## bot: there are 3 pizza menus
  ## user: order pizza
  ## bot summarize total order + cost

}

menu <- c(hawaian = 20, cheese = 25, coke = 5)

