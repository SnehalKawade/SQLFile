create table CustomerTlb(
CID int,
Cname varchar(20),
City varchar(20),
Grade int,
SID int,
constraint pk_cust primary key(CID),
constraint pk_cust_sales foreign key (SID) references Salesman(SID)
)
select * from CustomerTlb
ALTER TABLE CustomerTlb ADD Grade int;
ALTER TABLE CustomerTlb DROP COLUMN Grade;
ALTER TABLE CustomerTlb DROP constraint pk_cust_sales 
--ALTER TABLE CustomerTlb DROP foreign key 
alter table CustomerTlb add constraint pk_cust_sales foreign key (SID) references Salesman(SID)
--alter table CustomerTlb drop foreign key pk_cust_sales
drop table CustomerTlb
drop table OrderTlb
drop table Salesman
create table Salesman(
SID int,
Sname varchar(20),
City varchar(20),
commision float,
constraint pk_salesman primary key(SID)
)
select * from Salesman

create table OrderTlb(
OID int,
Purchase_amt int,
Order_Date datetime,
CID int,
SID int,
constraint pk_ord primary key(OID),
constraint pk_ord_cust foreign key (CID) references CustomerTlb(CID),
constraint pk_ord_sales foreign key (SID) references Salesman(SID)
)

select * from OrderTlb

--alter table Ordertlb add constraint pk_ord_cust foreign key (CID) references CustomerTlb(CID)
--alter table Ordertlb add constraint pk_ord_sales foreign key (SID) references Salesman(SID)


select * from Salesman
select * from OrderTlb
select * from CustomerTlb
update CustomerTlb set SID=5005 where CID=2001

--insert data into CustomerTlb table
insert into CustomerTlb values(2001,'Snehal Kawade','Solapur',100,5001)
insert into CustomerTlb values(2002,'Nick Rimando','New York',200,5001)
insert into CustomerTlb values(2003,'Jozy Altidor','Moscow',100,5007)
insert into CustomerTlb values(2004,'Doona Smith','Paris',300,5006)
insert into CustomerTlb values(2005,'Sagar Kawade','Pune',200,5002)
insert into CustomerTlb values(2006,'Sayali Shukla','Pune',300,5004)
insert into CustomerTlb values(2007,'Prasad Jagtap','Mumbai',200,5001)
insert into CustomerTlb values(2008,'Ram Kalal','Nagpur',300,5002)
insert into CustomerTlb values(2009,'Ann Reddy','New York',100,5003)

--insert data into salesman table
insert into Salesman values(5001,'James Hoog','New York',0.15)
insert into Salesman values(5002,'Nail Knite','Paris',0.13)
insert into Salesman values(5003,'Lauson Hen','San Jose',0.12)
insert into Salesman values(5004,'Nick Jons','Pune',0.11)
insert into Salesman values(5005,'Pit Alex','London',0.11)
insert into Salesman values(5006,'Mc Lyon','Paris',0.14)
insert into Salesman values(5007,'Paul Adam','Rome',0.13)

--insert data into ordertlb table
insert into OrderTlb values(70001,1500,getdate(),2005,5002)
insert into OrderTlb values(70002,25000,getdate(),2002,5001)
insert into OrderTlb values(70003,30500,getdate(),2003,5007)
insert into OrderTlb values(70004,15000,getdate(),2004,5006)
insert into OrderTlb values(70005,1000,getdate(),2005,5004)
insert into OrderTlb values(70006,35000,getdate(),2006,5005)
insert into OrderTlb values(70007,2090,getdate(),2007,5002)
insert into OrderTlb values(70008,999,getdate(),2008,5003)


--1. find the salesperson and customer who belongs to same city.Return Salesman, cust_name and city.
SELECT s.Sname AS "Salesman",
c.Cname,c.City
FROM Salesman s,CustomerTlb c
WHERE s.city=c.city

--2.find those orders where order amount exists between 500 and 2000. Return purch_amt, cust_name, city. 
SELECT  o.OID,o.Purchase_amt,c.Cname,c.city 
FROM OrderTlb o,CustomerTlb c
WHERE o.CID=c.CID AND o.purchase_amt BETWEEN 500 AND 2000

--3.find the salesperson(s) and the customer(s) he handle. Return Customer Name, city, Salesman, commission.
SELECT c.cname AS "Customer Name", 
c.City, s.Sname AS "Salesman", s.Commision 
FROM CustomerTlb c 
INNER JOIN salesman s ON c.SID=s.SID

--4.find those salespersons who received a commission from the company more than 12%. Return Customer Name, customer city, Salesman, commission.
SELECT c.Cname AS "Customer Name", 
c.City, s.Sname AS "Salesman", s.commision 
FROM CustomerTlb c 
INNER JOIN Salesman s ON c.SID=s.SID
WHERE s.commision>.12

--5.find those salespersons do not live in the same city where their customers live and received a commission from the company more than 12%. Return Customer Name, customer city, Salesman, salesman city, commission.
SELECT c.Cname AS "Customer Name", 
c.City, s.Sname AS "Salesman", s.City,s.Commision  
FROM CustomerTlb c  
INNER JOIN Salesman s  ON c.SID=s.SID
WHERE s.commision>.12 AND c.city<>s.city

--6. find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission
SELECT o.OID,o.Order_Date,o.Purchase_amt,
c.Cname AS "Customer Name", c.Grade, 
s.sname AS "Salesman", s.commision 
FROM OrderTlb o 
INNER JOIN CustomerTlb c ON o.CID=c.CID 
INNER JOIN Salesman s ON o.SID=s.SID

--7.find the customer name, city, order number, order date, and order amount in ascending order according to the order date to 
--find that either any of the existing customers have placed no order or placed one or more orders.
SELECT c.Cname,c.City,o.OID,o.Order_Date,o.Purchase_amt AS "Order Amount" 
FROM CustomerTlb c
LEFT OUTER JOIN OrderTlb o 
ON c.CID=o.CID order by o.Order_Date

--8.find those customers whose grade less than 300. Return cust_name, customer city, grade, Salesman, saleman city. 
--The result should be ordered by ascending customer_id.
SELECT c.Cname,c.City,c.Grade, 
s.Sname AS "Salesman", s.City 
FROM CustomerTlb c 
LEFT OUTER JOIN Salesman s 
ON c.SID=s.SID WHERE c.Grade<300 ORDER BY c.CID

--9.display the cust_name, customer city, grade, Salesman, salesman city. The result should be ordered by ascending on customer_id.
SELECT c.Cname,c.City,c.Grade, 
s.Sname AS "Salesman",s.City 
FROM CustomerTlb c 
LEFT JOIN Salesman s 
ON c.SID=s.SID order by c.CID

--10.The customer, may have placed, either one or more orders on or above order amount 2000 and must have a grade, 
--or he may not have placed any order to the associated supplier.
SELECT c.Cname,c.City,C.Grade, s.Sname AS "Salesman", o.OID, o.Order_Date, o.Purchase_amt 
FROM CustomerTlb c 
RIGHT OUTER JOIN Salesman s ON s.SID=C.SID
LEFT OUTER JOIN OrderTlb o ON o.CID=c.CID 
WHERE o.Purchase_amt>=2000 AND c.Grade IS NOT NULL

--11.1. Salesmen who works for one or more customer or, 2. Salesmen who not yet join under any customer, Condition for selecting list 
--of customer :3. placed one or more orders, or 4. no order placed to their salesman.
SELECT c.Cname,c.City,c.Grade, s.Sname AS "Salesman", o.OID, o.Order_Date, o.Purchase_amt 
FROM CustomerTlb c 
RIGHT OUTER JOIN Salesman s ON s.SID=c.SID
RIGHT OUTER JOIN OrderTlb o ON o.CID=c.CID

--12.display the list in ascending order for the salesmen who works either for one or more customer or not yet join under any of the customers.
SELECT c.Cname,c.City,c.Grade, s.Sname AS "Salesman", s.City 
FROM CustomerTlb c 
RIGHT OUTER JOIN Salesman s ON s.SID=c.SID 
ORDER BY s.SID

--13.customer name, city, order number, order date, order amount salesman name and commission to find that either any of the existing customers
--have placed no order or placed one or more orders by their salesman or by own.
SELECT c.Cname,c.City, o.OID,o.Order_Date,o.Purchase_amt AS "Order Amount", s.Sname,s.Commision 
FROM customerTlb c 
LEFT OUTER JOIN OrderTlb o ON c.CID=o.CID 
LEFT OUTER JOIN Salesman s ON s.SID=o.SID

--14.Write a SQL query to combine each row of salesman table with each row of customer table.
SELECT * 
FROM Salesman s 
CROSS JOIN CustomerTlb c;

--15.a cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa for 
--that salesman who belongs to a city.
SELECT * 
FROM Salesman s 
CROSS JOIN CustomerTlb c
where s.City IS NOT NULL

--16.cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa for those 
--salesmen who belongs to a city and the customers who must have a grade.
SELECT * 
FROM Salesman s 
CROSS JOIN  CustomerTlb c 
WHERE s.City IS NOT NULL AND c.Grade IS NOT NULL

--17.display those salesmen who must belong a city which is not the same as his customer and the customers should have an own grade.
SELECT * 
FROM Salesman s 
CROSS JOIN  CustomerTlb c 
WHERE s.City IS NOT NULL AND c.Grade IS NOT NULL
AND  s.City<>c.City