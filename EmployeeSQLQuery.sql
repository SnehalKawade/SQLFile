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

