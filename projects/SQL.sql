DROP TABLE demo;

CREATE TABLE employee (
    id INT UNIQUE,
    name TEXT,
    department TEXT,
    position TEXT,
    salary REAL
);

create table book_shop (
  id int,
  name text,
  release_year INT
  );
  
create table favorite_book (
  id int,
  author text,
  reviews real
);

insert into book_shop VALUES
(1,'Think like a freak', 2014),
(2,'Ultralearning', 2019),
(3,'Blue Ocean Strategy', 2015),
(4,'The power of habit', 2012),
(5,'Outliner', 2008);

insert into favorite_book VALUES
(1,'Steven D. Levitt, Stephe J. Dubner', 1984),
(4,'Charles Duhigg', 12007),
(5,'Mulcolm Gladwell', 12063);

INSERT INTO employee VALUES
    (1, 'David', 'Marketing', 'CEO', 100000),
    (2, 'John', 'Marketing',     'VP', 85000),
    (3,'Marry', 'Sales', 'Manager', 60000);

SELECT
   name,
   salary,
   salary * 1.15 AS new_salary,
   LOWER(name) || '@fla_luke.com' AS company_email
From employee;

SELECT 
   id,
   name,
   salary
FROM employee
LIMIT 2;

select  
   name,
   ROUND(milliseconds / 60000.0 ,2) minute ,
   round(bytes/ (1024*1024.0),2) mb
from tracks;

/* INSERT INTO employee VALUES
    (1, 'David', 'Marketing', 'CEO', 100000),
    (2, 'John', 'Marketing',     'VP', 85000),
    (3,'Marry', 'Sales', 'Manager', 60000); */
 
 INSERT INTO employee VALUES
    (4, 'Flaluke', 'IT', 'Senior Manager', 80000),
    (5, 'P' , 'IT', 'Manager', 60000);

Select * FROM employee
where department = 'Marketing' AND salary > 90000 ;

SELECT * From employee 
where department = 'Marketing' OR department = 'IT';

SELECT * From employee 
where department IN ('Marketing','IT'); --ในภาษา computer science เรียก tuple

UPDATE employee
SET salary = 99000
WHERE id = 1

SELECT * FROM employee;

DELETE FROM employee
WHERE name = 'walker';

SELECT * FROM employee;

DELETE FROM employee
WHERE id IN (2,4);

SELECT * FROM employee;

/* ALTER TABLE MyEmployee
ADD email TEXT; */

UPDATE MyEmployee
SET email = 'ceo@flaluke.com'
WHERE id = 1;

SELECT * FROM MyEmployee;

/* CREATE TABLE MyEmployee_Backup AS
   SELECT * FROM MyEmployee; */

DROP TABLE MyEmployee_Backup;

select 
   company,
   CASE 
      when company is not NULL then 'coperate'
      Else 'End customer'
   End as segment
from customers;

select 
   invoicedate,
   STRFTIME('%Y', invoicedate) AS year,
   STRFTIME('%m', invoicedate) AS month,
   STRFTIME('%d', invoicedate) AS day,
   STRFTIME('%y-%m', invoicedate) AS monthid
from invoices
where year = '2010';

select 
   invoicedate,
   cast(STRFTIME('%Y', invoicedate) AS INT) AS year,
   STRFTIME('%m', invoicedate) AS month,
   STRFTIME('%d', invoicedate) AS day,
   STRFTIME('%y-%m', invoicedate) AS monthid
from invoices
where year = 2010;

select 
   * 
from artists
join albums
on artists.ArtistId = albums.artistid
where artists.ArtistId = 50;

SELECT
   A.artistid,
   A.name,
   B.title
FROM artists AS A
JOIN albums AS B
ON A.artistid = B.artistid;

select 
   art.artistid,
   art.name,
   alb.title,
   tra.name,
   tra.composer
from artists AS art
join albums AS alb
on art.ArtistId = alb.artistid
join tracks as tra
on alb.albumid = tra.AlbumId
where art.name = 'AC/DC'

create table ranks (
  rank text
);

create table suits (
  suit text
);

insert into ranks
values ('2'),('3'),('4'),('5'),('6'),('7'),('8'),('9'),('10'),('J'),('Q'),('K'),('A');

INSERT into  suits
values ('Clubs'),('Diamonds'),('Hearts'),('Spades');

select * from ranks;
select * from suits;

-- cross join
select * from ranks, suits
order by 2;

-- เขียนอีกแบบ
select * from ranks cross join suits
order by suit;

/* Create table employee (
  id int,
  name text,
  level text,
  manager_id int
);

insert into employee VALUES
(1,'David', 'CEO', null),
(2,'John', 'SVP',1),
(3,'Mary' 'VP',2),
(4,'Adam', 'VP',2),
(5,'Scott', 'Manager',3),
(6,'Louise', 'Manager',3),
(7,'Kevin', 'Manager',4),
(8,'Takeshi', 'Manager',4),
(9,'Joe', 'AM',6),
(10,'Anna', 'AM',7); */

select 
   e1.name staff,
   e1.level staff_level,
   e2.name manager,
   e2.level manager_level,
   e1.name || ' reports to ' || e2.name AS comment
from employee e1, employee e2
where e1.manager_id = e2.id

SELECT 
   name, 
   RANDOM()
from tracks
order by RANDOM() desc
limit 5;

select 
   company,
   COALESCE(company, ' End Customer') As 'Company Clean',
   case when company is NULL then 'End Customer'
        else 'Corporate'
   end as 'segment'
from customers;

select
   A.artistid,
   A.name artistName,
   B.title albumName
from artists A, albums B
where A.artistid = B.artistid 
And A.name like 'C%';

select 
   artists.artistid,
   artists.name as artist_name,
   albums.title as album_name,
   tracks.name as song_name
from artists, 
     albums, 
     tracks
where artists.artistid = albums.artistid --PK = FK
and albums.albumid = tracks.AlbumId
and artists.ArtistId in (8,100,120);


select 
   count(*) 'AC/DC_songs'
from artists A
INNER join albums B on A.ArtistId = B.ArtistId --PK = FK
INNER join tracks C on B.AlbumId = C.AlbumId
where A.name = 'AC/DC';

SELECT
   round(AVG(milliseconds), 2) avg_mill,
   SUM(milliseconds) sum_mill,
   MIN(milliseconds) min_mill,
   MAX(milliseconds) max_mill,
   COUNT(milliseconds) count_mill
from tracks;

SELECT
   count(DISTINCT country),
   count(*)
from customers;

select 
   genres.name, 
   count(*) as count_songs
from genres,
     tracks
where genres.genreid = tracks.GenreId
group by genres.name;

select 
   genres.name, 
   count(*) as count_songs
from genres,
     tracks
where genres.genreid = tracks.GenreId
group by genres.name
Having count(*) >= 100;

select 
    ge.Name genre,
    count(*) as n_songs
from artists as ar 
join albums as al 
on ar.ArtistId = al.ArtistId
join tracks as tr
on al.AlbumId = tr.AlbumId
join genres as ge
on ge.GenreId = tr.GenreId
where ge.Name <> 'Blues'
group by ge.Name
HAVING ge.Name like 'A%' or ge.name like 'B%'

select 
    ge.Name genre,
    count(*) as n_songs
from artists as ar 
join albums as al 
on ar.ArtistId = al.ArtistId
join tracks as tr
on al.AlbumId = tr.AlbumId
join genres as ge
on ge.GenreId = tr.GenreId
where ge.Name <> 'Blues'
group by 1
HAVING ge.Name like 'A%' or ge.name like 'B%'
order by 2 desc

select id from book_shop
INTERSECT
select id from favorite_book;

select id from book_shop
EXCEPT
select id from favorite_book;

select * from book_shop
UNION 
SELECT * from book_shop_new;

--select * from tracks order by milliseconds desc limit 1;

--ถ้าหาค่าก่อนแล้วเอากลับไปแทนจะยุ่งยาก
/*select Max(milliseconds) from tracks;

SELECT * from tracks
where milliseconds = 5286953 ;*/

SELECT * from tracks
where milliseconds = (select Max(milliseconds)
                      from tracks);

select firstname ,lastname,country from (select * from customers
where country = 'USA');


select
   firstname,
   lastname,
   firstname || SUBSTR(lastname, 1, 1) || '@flaluke.com' AS email
from customers;

select 
   name song_name,
   round(milliseconds / 60000.0, 2) as minute,
   round(bytes / (1024.0*1024.0) , 2) mb
from tracks
where name GLOB 'F*'

select 
   name song_name,
   round(milliseconds / 60000.0, 2) as minute,
   round(bytes / (1024.0*1024.0) , 2) mb
from tracks
where song_name REGEXP '^F.+k$'

-- common table expression (WITH)
WITH 
  invoice_2009 AS (
  SELECT * 
  FROM invoices 
  WHERE invoicedate >= '2009-01-01' 
    AND invoicedate <= '2009-12-31'
), 
  usa_customers AS (
  SELECT * 
  FROM customers 
  WHERE country = 'USA'
)

WITH all_customers AS (
  SELECT * FROM customers
)

SELECT firstname, country
FROM all_customers
WHERE country = 'United Kingdom'
  
SELECT 
    firstname, 
    lastname, 
    SUM(total) AS total_inv
FROM usa_customers AS t1 
JOIN invoice_2009  AS t2 
ON t1.customerid = t2.customerid 
GROUP BY 1, 2
ORDER BY 3 DESC

SELECT 
    firstname, 
    lastname, 
    SUM(total) AS total_inv
FROM (
  SELECT * 
  FROM customers 
  WHERE country = 'USA'
) AS usa_customers 
JOIN (
  SELECT * 
  FROM invoices 
  WHERE invoicedate >= '2009-01-01' 
    AND invoicedate <= '2009-12-31'
) AS invoice_2009
ON usa_customers.customerid = invoice_2009.customerid 
GROUP BY 1, 2
ORDER BY 3 DESC;

SELECT
  ROW_NUMBER() OVER() AS custID, #เป็นการรันแถวลงมา
  firstname,
  country
FROM customers 

SELECT
  ROW_NUMBER() OVER(PARTITION BY country ORDER BY firstname) AS custID,
  firstname,
  country
FROM customers
WHERE country = 'Brazil'

-- basic segmentation in SQL
-- NTILE()
-- segment tracks into 3 buckets: large, medium, small files

SELECT 
    name, 
    segment,
    -- if in SQL 
    CASE 
      WHEN segment = 1 THEN 'large'
      WHEN segment = 2 THEN 'medium'
      ELSE 'small'
    END AS file_size
FROM (
    SELECT 
      name, 
      bytes,
      NTILE(3) OVER(ORDER BY bytes DESC) AS segment
    FROM tracks  
)
