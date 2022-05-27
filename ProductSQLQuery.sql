create table ProductTbl
(
PID int primary key,
PName varchar(20),
Price int
)

select * from ProductTbl

insert into ProductTbl values(10,'Pavlova',25000)
insert into ProductTbl values(20,'Geitost',35000)
insert into ProductTbl values(30,'Laptop',30000)
insert into ProductTbl values(40,'TV',45000)
insert into ProductTbl values(50,'Mobile',37000)
insert into ProductTbl values(60,'Headphone',1000)
insert into ProductTbl values(70,'Camera',50000)
insert into ProductTbl values(80,'Pendrive',500)
insert into ProductTbl values(90,'Pen',20)
insert into ProductTbl values(100,'Scale',15)


--1.Use the MIN function to select the record with the smallest value of the Price column.
SELECT MIN(Price)FROM ProductTbl

--2.Use an SQL function to select the record with the highest value of the Price column.
select MAX(Price)from ProductTbl

--3.Use the correct function to return the number of records that have the Price value set to 20
SELECT count(*)FROM ProductTbl WHERE Price = 20

--4.Use an SQL function to calculate the average price of all products.
SELECT avg(Price)FROM ProductTbl

--5.Use an SQL function to calculate the sum of all the Price column values in the Products table
SELECT sum(Price)FROM ProductTbl

--6.Use the BETWEEN operator to select all the records where the value of the Price column is between 10 and 20
SELECT * FROM ProductTbl WHERE Price BETWEEN 10 AND 20

--7.Use the BETWEEN operator to select all the records where the value of the Price column is NOT between 10 and 20.
SELECT * FROM ProductTbl WHERE Price not BETWEEN 10 AND 20

--8.Use the BETWEEN operator to select all the records where the value of the ProductName column is alphabetically between 'Geitost' and 'Pavlova'.
SELECT * FROM ProductTbl WHERE PName BETWEEN 'Geitost' AND 'Pavlova' order by PName


--9.Write the correct SQL statement to create a new database called testDB.
CREATE DATABASE testDB

--10.Write the correct SQL statement to delete a database named testDB
DROP DATABASE testDB

--11.Add a column of type DATE called Birthday in Persons table
ALTER TABLE Person ADD Birthday DATE;

--12.Delete the column Birthday from the Persons table
ALTER TABLE Person DROP COLUMN Birthday;


