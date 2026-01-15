# install packages
install.packages(c("readr",
                   "readxl",
                   "googlesheets4",
                   "jsonlite",
                   "dplyr",
                   "sqldf",
                   "RSQLite"))

# load library
library(readr)
library(readxl)
library(googlesheets4)
library(jsonlite)
library(dplyr)
library(sqldf)
library(RSQLite)

library(readxl)

read_excel("students.xlsx", sheet = 1)

# สามารถใส่ชื่อ sheet ก็ได้
read_excel("students.xlsx", sheet = "Data" )
read_excel("students.xlsx", sheet = "Economics" )
read_excel("students.xlsx", sheet = "Business" )

econ_student <- read_excel("students.xlsx", sheet="Economics" )
View(econ_student)

# loop [[i]] ฝากค่าใน list()
result <- list()

for (i in 1:3) {
  result[[i]] <- read_excel("students.xlsx", sheet=i)
}

result[[1]]
result[[2]]
result[[3]]

library(googlesheets4)

url <- "https://docs.google.com/spreadsheets/d/..."

gs4_deauth()
read_sheet(url, sheet="student")


df <- read_sheet(url, sheet="student")
View(df)

library(jsonlite)

fromJSON("blankpink.json")

data <- fromJSON("blankpink.json")

# แล้ว wrap ด้วย ฟังก์ชัน data frame
data.frame(data)

# สามารถเขียนด้วยบรรทัดเดียวก็ได้
bp <- data.frame(fromJSON("blankpink.json"))
View(bp)

library(dplyr)
library(readxl)

# read excel file 
econ <- read_excel("students.xlsx", sheet=1)
business <- read_excel("students.xlsx", sheet=2)
data <- read_excel("students.xlsx", sheet=3)

# bind rows == SQL UNION ALL
binds_rows(econ, business, data)

# ถ้ามี data frame เยอะ
list_df <- list(econ, business, data, ...)
bind_rows(list_df)
full_df <- bind_rows(list_df)
full_df

df1 <- data.frame( 
  id = 1:5,
  name = c("John", "Marry", "Anna", "David", "Lisa")
)

df2 <- data.frame(
  city = c( rep("BKK",3), rep("London",2) ),
  country = c( rep("TH", 3), rep("UK",2) )
)

bind_cols(df1, df2)
bind_cols(df2, df1)

# ถ้าจะใช้ join ต้องมี id ที่แมชกันได้
df2 <- data.frame(
  id = 1:5,
  city = c( rep("BKK",3), rep("London",2) ),
  country = c( rep("TH", 3), rep("UK",2) )
)

left_join(df1, df2, by="id")

# load library sqldf
library(sqldf)
library(readr)

school <- read_csv("school.csv")

sqldf("select * from school;")

sqldf("select 
       avg(student),
       sum(student)
       from school;")

sqldf("select
       school_id,
       school_name,
       country
       from school")

sql_query <- "select * from school
              where country = 'USA'"
sqldf(sql_query)
usa_school <- sqldf(sql_query)
usa_school

# load library
library(RSQLite)

# connect to SQLite database (.db file)
# 1. open connection
conn <- dbConnect(SQLite(), "chinook.db"
conn

# 2. get data
dbLisTables(conn)
dbListfields(conn, "customers")

df <- dbGetQuery(conn, "select * from customers 
                 where country = 'USA'")
df2 <- dbGetQuery(conn, "select * from customers 
                 where country = 'United Kingdom'")
View(df)

# 3. close connection
dbDisconnect(conn)

save.image(file = "data.Rdata")
load(file = "data.Rdata")

# save single object
saveRDS(business, file = "business.rds")
readRDS("business.rds")
business <- readRDS("business.rds")
