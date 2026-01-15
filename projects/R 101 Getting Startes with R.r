# create variables
income <- 50000
expense <- 30000
saving <- income - expense

## remove variables
rm(saving)

## compare values
1+1 == 2
2*2 <= 4
5 >= 10
5 - 2 ! = 3 ## not equal
10 > 2
10 < 2

## compare text/characters
"Hello" == "hello" # false เพราะ R เป็นภาษาที่ case sentitive
## Data types

## 1. numeric
age <- 32
print (age)
class(age) ## เป็นการเช็คคลาสตัวแปรประเภทข้อมูล

## 2. character
my_name <- "Fluke"
my_university <- "Chulalongkorn University"
print(my_name)
print(my_university)
class (my_name) ; class (my_university)

## 3. logical
result <- 1+1 == 2
print(result)
class(result)

## 4. factor
animals <- c("Dog", "Cat", "Cat", "Hippo")
class(animals)

animals <- factor(animals)
class(animals) ## ถ้า print animal ใน console จะไม่มี "" แล้ว

## 5. date/time
time_now <- sys.time()
class(time_now) ## "POSIXct" "POSIXt"

## Convert data types

## main functions
## as.numeric()
## as.character()
## as.logical()

x <- 100
class(x) # numeric

char_x  <- as.character(x)
char_x # "100"

## อยากเปลี่ยนกลับ
num_x <- as.numeric(char_x)
num_x # 100

## logical : TRUE 1/ FALSE 0
as.logical(0) # FALSE
as.logical(1) # TRUE
as.numberic(TRUE) # 1
as.numeric(FALSE) # 0

## Data Structures
## 1. Vector
## 2. Matrix
## 3. List
## 4. DataFrame

## -----------------------
## vector

1:10 #1 2 3 4 5 6 7 8 9 10
16:25

## sequence generation
seq(from = 1, to = 100, by = 2) ## 1 3 5 7 ... 99
seq(from = 1, to = 100, by = 5) ## 1 6 11 ... 96

## help file
help("seq")

## function c
friends <- c("David", "Marry", "Anna", "John", "william")
ages <- c(30, 32, 26, 29, 31)
is_male <- c(TRUE, FALSE, FALSE, TRUE, TRUE)

## Matrix
x <- 1:25 ## 1 2 3 ... 25
length(x) # 25 ตัว
dim(x) <- c(5,5) # 5 ตัวแรกแถว 5 สองคอลัมน์

matrix(1:25, ncol=5)
matrix(1:6, ncol=3) ## 1 3 5
                    ## 2 4 6

matrix(1:6, ncol=3, nrow=2, byrow=TRUE) ## 1 2 3
                                        ## 4 5 6

## element wise computation > การบวกลบคูณการทีละตัว  
m2 <- matrix(1:6, ncol=3, nrow=2, byrow=T) 
m2 + 100
m2 * 4 ## 4 8 12
       ## 16 20 24     

## List

my_name <- "Fluke"
my_friends <- c("B", "BT", "P")
m1 <- matrix(1:25, ncol=5)
R_is_cool <- TRUE

my_list <- list(item1 = my_name, 
                item2 = my_friends, 
                item3 = m1, 
                item4 = R_is_cool)
my_list$item3
my_list$item4

## Data Frame

friends <- c("B", "BT", "P", "A", "F")
ages <- c(23, 24, 24, 21, 22)
locations <- c("New York", "London", "London", "Tokyo", "Manchester")
movie_lover <- c(T, T, F, T, T)

df <- data.frame(friends,
           ages,
           locations,
           movie_lover)

View(df)

## Create data frame from list
my_list <- list(friends = friends,
                ages = ages,
                locations = locations,
                movie_lover = movie_lover)
data.frame(my_list)

friends <- c("B", "BT", "P", "A", "F")
ages <- c(23, 24, 24, 21, 22)
locations <- c("New York", "London", "London", "Tokyo", "Manchester")
movie_lover <- c(T, T, F, T, T)

friends[1] ## "B"
friends[5] ## "F"
friends[2:4] ## "BT" "P" "A"
friends[ c(1,3,5) ] ## "B" "P" "F"

ages [ ages > 23 ] ## 24 24
ages [ ages <= 22] ## 21 22


names(ages) <- friends ## ชื่อใน vector friends ใส่เข้าไปแทนใน vector ages
                       ## หากพิมพ์ ages จะมีชื่ออยู่ด้านบน B  BT  P  A  F
                       ##                         23 24 24 21 22
ages["B"] ## B
          ## 23
ages[ c("P", "A", "F")] ## สามารถสลับตำแหน่งใน vector นั้นได้

#----------------------

df <- data.frame(friends,
           ages,
           locations,
           movie_lover)
df[1,3] ## "New York"
df[2,4] ## T    
df[1:2,4] ## T T
df[1:2, 2:4] ## ages locations movie_lover
             ## 23   New York   T
             ## 24   London     T
df[ , "friends"] ## "B" "BT" "P" "A" "F"
df[ , c("friend", "locations") ## ดึงมา 2 คอลัมน์ ทุก rows เลย
                               ## friends  locations
                               # 1 B       New York
                               # 2 BT      London
                               # 3 P       London
                               # 4 A       Tokyo
                               # 5 F       Manchester
df[ df$movie_lover == T,  ] ## filter คนที่ชอบดูหนัง โดยใช้ double equal
df[ df$movie_lover == F,  ]

df[ df$ages < 24,  ]
df[ df$friends == "F",  ]
