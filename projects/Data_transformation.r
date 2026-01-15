## library()
library(glue)
library(lubridate) # จัดการวันที่
library(dplyr)

name <- "fluke"
age <- 23

## string template (python: fstring)
text <- glue("Hi! my name is {name} and I'm {age} years old.")

print(text)
nchar(text)

## regular expression
## pattern matching

state.name # เป็น build-in data ใน R คำสั่งใน modern R

# subset by position
index <- grep("^A", state.name) # รัฐอะไรบ้างขึ้นต้นด้วยตัว A return 1 2 3 4
state.name[index] # อยากได้ชื่อรัฐที่ขึ้นต้นด้วยตัว A

# subset by condition
index <- grepl("^A", state.name) # รัฐอะไรบ้างขึ้นต้นด้วยตัว A return TRUE
state.name[index] # สามารถใช้ vector ในการซับเซตได้ ได้ชื่อปทแบบเดียวกัน

grep("^New.+e$", state.name) # return index 29
grep("^new ", state.name, 
     ignore.case = TRUE, value=TRUE) # ignore.case ไม่สนใจพิมพ์เล็กพิมพ์ใหญ่ ส่วน value ไม่ต้องโชว์ index แต่ดึงค่าที่แท้จริงออกมา ถ้า set เป็น FALSE จะดึง index กลับมา

## lubridate
## manage date data type จัดการวันที่
library(lubridate)

text_date <- "2025-10-11"
class(text_date) # "character"
d1 <- ymd(text_date)
class(d1) # date

## extract part of date
year(d1)
month(d1, label = TRUE) # label ดึงชื่อเดือนออกมาเป็นเดือนเลย
month(d1, label = TRUE, abbr = FALSE)
day(d1)
wday(d1, label = TRUE, abbr = FALSE) # abbreviation ไม่ย่อ = ดึงชื่อเดือนเต็มออกมา wday() ดึงชื่อวันในสัปดาห์ออกมา

## messy date
mdy("OCTOBER, 11 - 2025")
dmy("11 oct 2025")
mdy("10/11/2025")
dmy("11.10.2025")
myd("Oct, 2025 11")

## function in R vectorization = ไม่ต้องเขียน loop หรือ for loop
x <- c("2025-01-01", "2025-10-31", "2024-02-12")
ymd(x)

for(d in x) {
  print(ymd(d))
}

## library dplyr
## select, filter, arrange, mutate, summarise + groupby + join

row.names(mtcars)

## create new column
mtcars$model <- row.names(mtcars)

## remove row names
row.names(mtcars) <- NULL

## preview dataset, top or bottom
head(mtcars, 2) # ดู 2 แถวบนสุด
tail(mtcars, 3) # ดู 3 แถวล่างสุด

## 1. select column
select(mtcars, 1:5, 10) # จงเข้าไปที่ df mtcars ดึงคอลัมน์ 1-5 และคอลัมน์ 10
select(mtcars, model, hp, wt)
select(mtcars, contains("A")) # จงดึงคอลัมน์ที่มี A อยู่ในชื่อ
select(mtcars, starts_with("h")) # คอลัมน์ที่ขึ้นต้นด้วย h
select(mtcars, ends_with("p")) # คอลัมน์ที่ลงท้ายด้วยตัว p

## move column 'model' to the left(most)
mtcars <- select(mtcars, model, everything())

## select changes name
select(mtcars, horse_power = hp, weight = wt) # ดึง df, ชื่อใหม่ = ชื่อเก่า

rename(mtcars, weight=wt, horsepower=hp) # จะดึงทุกคอลัมน์ขึ้นมา แต่เปลี่ยนเฉพาะชื่อคอลัมน์อย่างเดียว

## use SQL to transform data
library(sqldf)
sqldf("select model, hp as horse_power, wt as weight from mtcars limit 10")

## pipe operator %>% |>

mtcars %>%
  select(model, hp, wt, am) %>%  # ส่ง df เข้าไปที่ฟังก์ชัน select
  head(5)

## 2. filter data by condition(s)
df2 <- mtcars %>%
  select(model, hp, wt, am) %>%
  filter(hp >= 100 & wt >= 3 & am == 1) %>%
  arrange(desc(hp)) # sort hp เรียงจากค่ามากไปค่าน้อย

## install new packages
## install.packages("readr")
library(readr) # ใช้ในการอ่านและเขียนไฟล์

write_csv(df2, "result.csv")

df3 <- read_csv("result.csv")

## read employee csv file
employee <- read_csv("employee.csv")

employee %>%
  count(Department)

employee %>%
  summarise(sum(Salary), mean(Salary))

## read excel data
library(readxl)

employee_xl <- read_excel("employee.xlsx", sheet=1) 

## read JSON data
library(jsonlite)

df4 <- fromJSON("empjson.json")

## read google sheets
library(googlesheets4)

read_sheet()

## explore filter() to do more
mtcars %>%
  select(model, hp, wt, am) %>%
  filter( ! grepl("^M", model) )

mtcars %>%
  filter(model == "AMC Javelin")

## 3. mutate: create new column # คอลัมน์ใหม่จะอยู่ขวามือสุดของ result ที่สร้างขึ้นมา
mtcars |>
  select(model, hp) %>%
  head(10) %>%
  mutate(hp_double = hp*2,
         hp_log = log(hp),
         hp_100 = hp+100,
         hp_100_2 = hp_100*2)
  
## First Principles Thinking
## Writing => Content + Code
## Media + Software => The Future

## create segment column for hp: low, medium, high
mtcars %>%
  select(model, hp, am) %>%
  mutate(am = if_else(am==0, "Auto", 
                      "Manual")) %>%
  mutate(segment = case_when(
    hp >= 200 ~ "high",
    hp >= 100 ~ "medium",
    hp < 100 ~ "low",
    TRUE ~ "other"
  ))

## compare to SQL
sqldf(
  "select 
    model, 
    hp,
    case 
      when hp >= 200 then 'high'
      when hp >= 100 then 'medium'
    else 'low'
  end as segment
  from mtcars"
)

## 4. arrange low to high, high to low
mtcars %>%
  select(model, am, hp) %>%
  filter(hp > 100) %>%
  arrange(am, -hp) # high to low ใส่เครื่องหมาย - ได้เฉพาะคอลัมน์ตัวเลข

## 5. summarise i.e aggregate functions in SQL + group_by
mtcars %>%
  mutate(am = if_else(am==0, "Auto", "Manual")) %>%
  group_by(am) %>% # group by ใช้ก่อนฟังก์ชัน summarise
  summarise(avg_hp = mean(hp),
            sum_hp = sum(hp),
            min_hp = min(hp),
            max_hp = max(hp),
            n = n())

## sql syntax
sqldf("select am, count(*), sum(hp), avg(hp)
        from mtcars
        group by 1
      ")

## 5 functions: good to know
glimpse(mtcars) # ใช้เช็คว่า dfมีกี่ column มีกี่ row data type เป็นอย่างไรบ้าง และมี preview data type ให้ดู แปลว่าการส่อง

summary(mtcars) # สรุปผล df เบื้องต้น

## change df to tibble
tibble(mtcars) # คุณภาพหรือลักษณะสำคัญของ tibble คือ จะแสดงผลสวยงามกว่า df ธมด ขยายยืดหดตามหน้าจอ

## count() create frequency table
## diamonds (50K+)
library(ggplot2)
diamonds

diamonds %>%
  count(cut) %>%
  mutate(pct = n/ sum(n))

my_seed <- 42 # ตัวเลขนี้จะเป็นอะไรก็ได้ เป็นการบอกโปรแกรมว่าฟังก์ชัน random ที่อยู่ด้านล่างเหมือนเดอมตลอดเหมือนล้อคเอาไว้
set.seed(my_seed) # set.seed ใช้ในการสุ่มตัวอย่าง

diamonds %>%
  sample_n(5)

diamonds %>%
  sample_frac(0.2)

## join data
## inner, left, right, full
band_members %>%
  full_join(band_instruments, by="name")

## filtering joins ไม่ดึง คอลัมน์ ที่ table ขวามาใส่ที่ result แต่ใช้เงื่อนไขในการ join เพื่อ filter table
## semi vs. anti
band_members %>%
  inner_join(band_instruments, by="name")

band_members %>%
  semi_join(band_instruments, by="name")

band_members %>%
  anti_join(band_instruments, by="name") # members คนไหนที่ไม่มีชื่อใน table ขวาให้ filter คนนั้นออกมา

## bind_row, bind_col
df1 <- data.frame(
  id = 1:3,
  name = c("toy", "lisa", "jisoo")
)

df2 <- data.frame(
  id = 4:5,
  name = c("david", "beckham")
)

df3 <- data.frame(
  id = 6:7,
  name = c("joey", "anna")
)

## union, append
bind_rows(df1, df2, df3)

df1 %>%
  bind_rows(df2) %>%
  bind_rows(df3)

list_df <- list(df1,df2,df3)
bind_rows(list_df)

sqldf("select * from df1 union all select * from df2")

## long vs. wide format
wp <- WorldPhones %>%
  as.data.frame() %>%
  ## . represents df in previous step
  mutate(year = rownames(.))

rownames(wp) <- NULL

## wide to long
library(tidyr) # pivot long to wide, wide to long
library(tibble) # rownames to column
library(dplyr)

long_wp <- WorldPhones %>%
  as.data.frame() %>%
  rownames_to_column(var = "year") %>% # ชื่อแถวมาเป็นคอลัมน์ แล้วตั้งชื่อคอลัมน์ใหม่ว่า year
  pivot_longer(N.Amer:Mid.Amer, 
               names_to = "Region",
               values_to = "Sales")

wide_wp <- long_wp %>%
  pivot_wider(names_from = "Region",
              values_from = "Sales")

long_wp %>%
  group_by(Region) %>%
  summarize(total_sales = sum(Sales))

## handle missing values
min_df <- mtcars %>%
  select(model, hp, wt) %>%
  tibble() # enhance dataframe

min_df[3,2] <- NA
min_df[6,3] <- NA

## drop NA
drop_na(min_df) # แถวไหนเป็น missing value ให้ลบแถวนั้นทิ้งไปเลย ไม่ค่อยได้ใช้

## mean imputation
avg_hp <- mean(min_df$hp, na.rm=TRUE) # จง remove missing value ก่อนหาค่าเฉลี่ย

min_df %>%
  filter(is.na(wt)) # แถวไหนที่ return ค่ากลับมาเป็น TRUE แสดงว่าเป็นค่า missing value

## clean missing data
min_df %>%
  mutate(hp = replace_na(hp, avg_hp),
         wt = replace_na(wt, mean(wt, na.rm=T)))

## install packages
install.packages(c("tidyverse", "RSQLite"))

## load library
library(tidyverse)
library(RSQLite)

getwd()
"/cloud/project"

## connect database
con <- dbConnect(SQLite(), "chinook.db")

## see tables in this db
dbListTables(con)

## see columns in a table
dbListFields(con, "customers")

## db get query
df1 <- dbGetQuery(con, "select firstname, lastname, city from customers limit 10")
View(df1)

df1 %>%
    filter(City != "Prague")

## join tables
df2 <- dbGetQuery(con, "
                  select 
                    t1.customerid,
                    sum(total) as total_invoice 
                  from customers t1
                  join invoices t2
                  on t1.customerid = t2.customerid
                  group by 1
                  order by 2 desc
                  limit 20")
 
t1 <- dbGetQuery(con, "select * from customers")             
t2 <- dbGetQuery(con, "select * from invoices")

t1 %>%
  left_join(t2, by = "CustomerId") %>%
  group_by(CustomerId) %>%
  summarise(total_invoice = sum(Total)) %>%
  View()

## clean column names
library(janitor)
clean_name(t1) %>%
  head()
