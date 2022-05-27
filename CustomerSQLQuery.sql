create table Customer(
CustId int,
CustName varchar(30),
City varchar(30),
Country varchar(20),
PostalCode int,
constraint pk_customer primary key(CustId)
)
select * from Customer

insert into Customer values(1,'Snehal','Solapur','India',413001)
insert into Customer values(2,'Donna','London','UK',113211)
insert into Customer values(3,'Jonh','Barline','France',121110)
insert into Customer values(4,'Nick','Oslo','Norway',1011)
insert into Customer values(5,'Sagar','Ahmednagar','India',411004)
insert into Customer values(6,'Prasad','Fatehpur','India',442110)
insert into Customer values(7,'Sumit','Chittoor','India',432110)
insert into Customer values(8,'Sai','Sangli','India',431003)
insert into Customer values(23,'Sayali','Pune','India',4)
insert into Customer values(9,'Akash','Mumbai','India',Null)
insert into Customer values(10,'Ram','Satara','India',Null)



update Customer set PostalCode=101100 where CustId=4
update Customer set City='Berlin' where CustId=3

--1.Write a statement that will select the City column from the Customers table
SELECT distinct City from Customer;

--2.Select all the different values from the Country column in the Customers table.
select distinct Country from Customer;

--3.Select all records where the City column has the value "London
select * from Customer where City='London'

--4.Use the NOT keyword to select all records where City is NOT "Berlin".
select * from Customer where not City='Berlin' 

--5.Select all records where the CustomerID column has the value 23.
select * from Customer where CustId=23

--6.Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 121110.
select * from Customer where City='Berlin' and PostalCode=121110

--7.Select all records where the City column has the value 'Berlin' or 'London'.
select * from Customer where City in('Berlin','London')

--8.Select all records from the Customers table, sort the result alphabetically by the column City.
select * from Customer ORDER BY City;

--9.Select all records from the Customers table, sort the result reversed alphabetically by the column City.
select * from Customer ORDER BY City desc;

--10.Select all records from the Customers table, sort the result alphabetically, first by the column Country, then, by the column City
select * from Customer order by Country, City

--11.Select all records from the Customers where the PostalCode column is empty.
select * from Customer where PostalCode is null;

--12.Select all records from the Customers where the PostalCode column is NOT empty.
select * from Customer where PostalCode is not null;

--13.Set the value of the City columns to 'Oslo', but only the ones where the Country column has the value "Norway".
update Customer set City='Oslo' where Country='Norway'

--14.Select all records where the value of the City column starts with the letter "a".
select * from Customer where City like 'a%'

--15.Select all records where the value of the City column ends with the letter "a".
select * from Customer where City like '%a'
