-- Finding secure path to be able to import csv file
show variables like 'secure_file_priv';

-- Creating table 
CREATE TABLE books (
    ID varchar(10),
    TITLE varchar(50),
    AUTHOR_NAME varchar(100),
    AUTHOR_BIO text,
    AUTHOR_ID varchar(20),
    PUBLICATION_DATE date,
    PRICE_USD decimal(10,2)
);

-- Loading data into table
LOAD DATA INFILE '/var/lib/mysql-files/A.csv'
INTO TABLE work.books
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;  -- Skip the header row
show warnings;

select * from work.books;

SELECT COUNT(DISTINCT *)
FROM your_table;

select count(*) from work.books;
select count(distinct title) from work.books;

-- Declare variables to check number of normal rows and unique rows
DECLARE @uniqe_rows_num INT;
DECLARE @rows_num INT;

-- Assigning values to variables
SELECT COUNT(DISTINCT concat(ID, TITLE, AUTHOR_NAME, AUTHOR_BIO, AUTHOR_ID, PUBLICATION_DATE, PRICE_USD)) INTO @uniqe_rows_num FROM work.books;
SELECT COUNT(*) INTO @rows_num from work.books;
show warnings;

-- Displaying if all rows are unique
SELECT 
    CASE
        WHEN @unique_rows_num = @rows_num THEN 'All rows are unique'
        ELSE 'All rows are not unique'
	END AS result;
    
-- 1ST NORMAL FORM -- 

-- Removing redundant rows
-- Creating new table with the same structure but only with unique rows
CREATE TABLE copy_book AS
SELECT DISTINCT ID, TITLE, AUTHOR_NAME, AUTHOR_BIO, AUTHOR_ID, PUBLICATION_DATE, PRICE_USD
FROM work.books;

-- Droping old table
DROP TABLE books;

-- Renaming new table
ALTER TABLE copy_book RENAME TO books;




show tables;
drop table copy_books;
show warnings;
desc copy_books;

select * from books;
