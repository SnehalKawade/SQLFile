create table Course(
cid int primary key,
cname varchar(40),
fees int
)

select * from Course

sp_rename'Course.cname','Cname'

sp_rename'Course.cid','CID'

sp_rename'Course.fees','Fees'

alter table Course add City varchar(40)