create table Study(
StudId varchar(5),
CourseId varchar(5),
Year int
)

select * from Study

insert into Study values('s1','c1',2016)
insert into Study values('s2','c2',2017)
insert into Study values('s1','c2',2017)

-- find the student id, year who enroll for different course with their year
select s1.StudId,s1.CourseId,s1.Year
from Study s1,Study s2
where s1.StudId=s2.StudId and s1.CourseId<>s2.CourseId 

select s1.StudId,s1.CourseId,s1.Year
from Study s1,Study s2
where s1.StudId=s2.StudId and s1.CourseId<>s2.CourseId and s1.Year<>s2.Year