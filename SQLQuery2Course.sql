create table Course(
CID int,
CName varchar(40),
Fees int
constraint pk_course primary key(CID)
)

select * from Course

sp_rename'Course.cname','Cname'

sp_rename'Course.cid','CID'

sp_rename'Course.fees','Fees'

alter table Course add City varchar(40)

sp_help Course

drop table Course

select * from Student

sp_help student
alter table Student add constraint pk_student_course foreign key (ID) references Student(Id) 

select * from Course

insert into Course values(11,'JAVA',35000)
insert into Course values(12,'C#',35000)
insert into Course values(13,'PHP',35000)
insert into Course values(14,'.NET',35000)
insert into Course values(15,'HTML',35000)

update Course set Fees=30000 where CID=12 
update Course set Fees=25000 where CID=13 
update Course set Fees=33000 where CID=14 
update Course set Fees=20000 where CID=15

--Cross join/ cartesian product
select * from Student cross join Course