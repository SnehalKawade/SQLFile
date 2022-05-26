create table Person(
personId int,
peersonName varchar(20)
)

alter table Person add city varchar(50)

select * from Person

alter table Person alter column peersonName varchar(40)

sp_rename'Person.peersonName','personName'

sp_rename 'Person.city','City'

alter table Person alter column personName varchar(40) not null