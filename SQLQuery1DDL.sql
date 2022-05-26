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

select * from person where personName like '[an]%'
select * from person where personName like '[a-j]'

