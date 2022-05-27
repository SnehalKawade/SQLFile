create table Employee(
EmpId int,
FirstName varchar(20),
LastName varchar(20),
Salary int,
City varchar(20),
DeptName varchar(20),
constraint pk_employee primary key(EmpId)
)

insert into Employee values(5,'Tejas','Chavan',20000,'Solapur','Sales')
update Employee set Salary=25000 where EmpId=5

alter table Employee add DeptId int not null
update Employee set DeptId=20 where EmpId=5

--1.display all employee from table
select * from Employee

--2.display emp who work in sales department
select * from Employee where DeptName='Sales'

--3.display emp who's salary is greater than 35000
select * from Employee where Salary>35000

--4.display emp who belong to pune & mumbai city
select * from Employee where City in('Mumbai','Pune')

--5.display emp who's salary is in between 25,000-30000
select * from Employee where Salary between 25000 and 30000

--6.display emp name who's name start with 'T'
select * from Employee where FirstName like 'T%'

--7.display emp name who's name end with 'A'
select * from Employee where LastName like '%A'

--8.display unique department from emp table
select distinct deptName from Employee

--9.display emp those are not working in HR & sales dpt
select * from Employee where DeptName not in('HR','Sales')

--10.Write a query to display first_name and last_name using alias ‘First Name’ & ‘Last Name’ from employee table
select FirstName as First_Name,LastName as Last_Name from Employee

--11.Write a query to get unique department ID from employee table
select distinct DeptId from Employee

--12.Write a query to get all employee details from employee table display in descending order
select * from Employee ORDER BY DeptName desc

--13.Write a query to display employee details with salary, calculate the PF as 12 % of basic salary & display as separate column
select FirstName,LastName,Salary, Salary=Salary*0.12 from Employee

--14.Write a query to get total salaries payable to all employees from employee table
select sum(Salary) as SumSalary from employee

--15.Write a query to get max and min salary of employee
select min(Salary) as MinAge from Employee
select max(Salary) as MaxAge from Employee

--16.Write a query to get number of employees are working in company
select count(*) from Employee

--17.Write a query to get the number of unique designation in the company
select count(distinct DeptId)from Employee

--18.Write a query to display emp_name as ‘Name’ in upper case
select UPPER(FirstName)from Employee

--19.Write a query to get first 10 records from the employee table
select TOP 3* from Employee

create table Manager(
MId int primary key,
Name varchar(20))

select * from Employee

alter table Employee add ManId int

alter table Employee drop column ManId

update Employee set manId=1 where EmpId in (2,3,4)
update Employee set manId=5 where EmpId in (6,7,8,9)
update Employee set manId=10 where EmpId in (11,12)

insert into Employee values(6,'Ram','Kalal',40000,'Pune','Admin',30)
insert into Employee values(7,'Sai','Kulkarni',45000,'Banglore','Developer',40)
insert into Employee values(8,'Ajay','Sonawane',30000,'Nagpur','Admin',50)
insert into Employee values(9,'Ketan','Haridas',37000,'Pune','Sales',60)
insert into Employee values(10,'Prathamesh','Dixit',33000,'Mumbai','Develpoer',10)
insert into Employee values(11,'Chaitali','Tarate',28000,'Solapur','HR',40)
insert into Employee values(12,'Ankita','Patil',32000,'Banglore','Tester',50)
insert into Employee values(13,'Sonu','Jadhav',32000,'Banglore',1,Null)

--self join
select e1.FirstName as empname,e2.FirstName as managername
from Employee e1, Employee e2
where e1.ManId=e2.EmpId

select * from Employee

alter table Employee drop column DeptName
alter table Employee add DId int
alter table Employee drop column DeptId

create table Department
(
DId int primary key,
DName varchar(20)
)
select * from Department

--alter table Employee add fk_deptemp constraint foreign key(DId) references Employee(EmpId)
insert into Department values(10,'Admin')
insert into Department values(20,'HR')
insert into Department values(30,'Sales')
insert into Department values(40,'Developer')
insert into Department values(50,'Tester')

update Employee set DId=10 where EmpId in (1,11)
update Employee set DId=20 where EmpId in (2,4,12)
update Employee set DId=30 where EmpId in (3,5)
update Employee set DId=40 where EmpId in (6,8,10)
update Employee set DId=50 where EmpId in (7,9)


-- inner joins
select e.FirstName,e.LastName,e.Salary,d.DName
from Employee e
inner join Department d on d.DId=e.DId

--left join
select e.FirstName,e.LastName,e.Salary,d.DName
from Employee e
left join Department d on d.DId=e.DId

--right join
select e.FirstName,e.LastName,e.Salary,d.DName
from Employee e
right join Department d on d.DId=e.DId

--full join
select e.FirstName,e.LastName,e.Salary,d.DName
from Employee e
full join Department d on d.DId=e.DId

--1.display employees who work in their dept using inner join
select e.FirstName,e.LastName,d.DName
from Employee e
inner join Department d on d.DId=e.DId

--2.display emp & dept name who work in hr dept
select e.FirstName,d.DName
from Employee e
inner join Department d on d.DId=e.DId
where d.DName='HR'

--3.display emp in hr dept, desending order of their salary
select e.FirstName,d.DName,e.Salary
from Employee e
inner join Department d on d.DId=e.DId
where d.DName='HR'
order by e.Salary desc

--4.display emp from sales dept in asending order of name
select e.FirstName,d.DName,e.Salary
from Employee e
inner join Department d on d.DId=e.DId
where d.DName='Sales'
order by e.Salary

--5.display emp & dept asending order of name & salary
select e.FirstName,d.DName,e.Salary
from Employee e
inner join Department d on d.DId=e.DId
order by e.FirstName,e.Salary

--6.display emp count in hr & sale dept using having clause
select DName, count(DId) as deptcount from Department
group by DName
having DName in ('HR','Sales')
order by count(DId)

select * from Employee

update Employee set Salary=34998.99 where EmpId=13

---SQL BUILD IN FUNCTION
--substring
select SUBSTRING(FirstName,0,4) as tempname from Employee

--Concat
select CONCAT(FirstName,' ',LastName)as info from Employee

--len
select FirstName,len(FirstName)as namelength from Employee

--upper
select firstname,UPPER(firstname) as uppername from Employee

--lower
select firstname,lower(firstname) as lowername from Employee

--ROUND
select salary,ROUND(Salary,2) as salary from Employee where EmpId=13
select ROUND(345.889,0) as roundvalue

--CAST
select CAST(salary as varchar(20)) from Employee  --typecasting

--REVERSE
select firstname,REVERSE(firstname) as reversename from Employee

--rank
select firstname,lastname,city,RANK() over (order by city) as rankno from Employee

--REPLACE(
select REPLACE('Good Morning','Morning','Afternoon') GreetReplace