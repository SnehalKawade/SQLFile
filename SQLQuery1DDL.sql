create table Person(
personId int,
peersonName varchar(20)
)

alter table Person add city varchar(50)


alter table Person alter column peersonName varchar(40)

sp_rename'Person.peersonName','personName'

sp_rename 'Person.city','City'


alter table Person alter column personName varchar(40) not null

sp_help Person
alter table person add constraint pk_person primary key(personId)
alter table person alter column personId int not null


create table Orders(
orderId int,
orderNo int,
personId int,
constraint pk_order primary key(orderId),
constraint pk_order_person foreign key (personId) references Person(personId)
)

select * from Orders

sp_help orders

alter table person add age int not null

alter table person add constraint chk_age check(age>=18)

alter table person add country varchar(30) default 'India'

sp_rename 'Person.age','Age'
sp_rename 'Person.country','Country'
alter table person drop constraint chk_age

create unique index index_person on person(personId)

--alter table person add personId int identity(1,1)

insert into person values(10,'Sweta','Solapur',24,'india')

select * from Person

update Person set Age=27 where personId=2

select personName,Age,City from person where personId=6
select distinct country from person
--<> not operator <,>,<=,>=,=,<>
select * from person where personId<>3
select * from person where personId<3
select * from person where personId<=3
select * from person where personId>3
select * from person where personId>=3
select * from person where City='Pune'

--to display data betn the range and operator
select * from Person where Age between 25 and 27

--in operator select the multiple possible values
select * from Person where personId in(1,2,3)
select * from Person where personId not in(1,2,3)
select * from Person where City in('Solapur','Pune')
select * from Person where City not in('Solapur','Pune')

--and/or/not operator
select * from person where country='USA' or country='India'
select * from person where country='USA' and country='India'
select * from person where country='USA' and Age<=26
select * from person where not country='USA'

update Person set Country='USA' where personId=9
update Person set City='New York' where personId=9

--like operator in sql
--name start with s%
select * from person where personName like 's%'
--name end with %a
select * from person where personName like '%a'
--start with & end with any letter having n letter
select * from person where personName like '%n%'
--full match letter start with S having next 2 more letters
select * from person where personName like 'S_____'
select * from person where personName like 'S____L'


select * from person where personName not like 's%'
select * from person where personName not like '%a'
select * from person where personName not like '%n%'
select * from person where personName not like 'S_____'

select * from person where personName like '[ap]%'
select * from person where personName like '%[ap]'
select * from person where personName like '%[ap]%'

select * from person where personName like '[a-m]%'
select * from person where personName like '%[a-m]%'
select * from person where personName like '%[a-m]'

insert into person values(11,'Sai','Solapur',22,'Null')
insert into person values(12,'Sonu','Pune',23,'Null')

--null values in sql
--is null
--is not null

select * from person where Country is null
select * from person where Country is not null
select * from Person

update Person set Country='India' where personId=10

--order by asc and desc
SELECT * FROM Person
ORDER BY Country

SELECT * FROM Person
ORDER BY Country desc

--aggreagte function
--1.count 2.sum 3.avg 4.max 5.min

select count(distinct City)from person
select count(*) from Person

select sum(Age) as SumAge from person
select avg(Age) as AvgAge from person
select min(Age) as MinAge from person
select max(Age) as MaxAge from person

--group by clause
--group by groups rows that have a same values into the summary
--e.g find no of person in each country
-- group the similar col data -country,count
--1.rule group by statement can be used aggregate function
--2.rule the column that we will put in the group by clause that can be
--used with select statement

select * from Person

select country,count(personId) as PersonCount from person group by country

--joins 
--1.inner joins
--2.left joins
--3.right joins
--4.full joins
--5.self joins
--6.cross joins/cartesion joins

select * from Person
select * from Orders

alter table orders add ProdName varchar(30)
alter table orders add Price int

insert into orders values(1,1001,1,'Laptop',35000)
insert into orders values(2,1002,1,'Mouse',999)
insert into orders values(3,1003,2,'TV',35000)
insert into orders values(4,1004,2,'Keyboard',5000)
insert into orders values(5,1005,2,'Headphone',1000)
insert into orders values(6,1006,3,'Camera',45000)
insert into orders values(7,1007,3,'Pendrive',35000)
insert into orders values(8,Null,4,'Null',Null)
insert into orders values(9,1008,5,'Null',Null)
update Orders set orderNo=1009 where personId=5
--1.inner join
select p.personName,p.Country,o.ProdName,o.Price,o.orderId
from Person p
inner join Orders o on o.personId=p.personId

select p.personName,p.Country,o.ProdName,o.Price,o.orderId
from Person p
inner join Orders o on o.personId=p.personId
where p.personId=3

--2.left join
select p.personName,p.Country,o.ProdName,o.Price,o.orderId
from Person p
left join Orders o on o.personId=p.personId

--3.right join
select p.personName,p.Country,o.ProdName,o.Price,o.orderId
from Person p
right join Orders o on o.personId=p.personId

--4.full join/outer join
select p.personName,p.Country,o.ProdName,o.Price,o.orderId
from Person p
full join Orders o on o.personId=p.personId


--having clause
select country, count(personid) as personcount from person
group by country
having country in('india','usa')
order by count(personid)
