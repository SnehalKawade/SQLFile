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
