create table CustomerTlb(
CID int,
Cname varchar(20),
City varchar(20),
Grade varchar(10),
SID int,
constraint pk_cust primary key(CID),
constraint pk_cust_sales foreign key (SID) references Salesman(SID)
)
select * from CustomerTlb

alter table CustomerTlb add constraint pk_cust_sales foreign key (SID) references Salesman(SID)

--alter table CustomerTlb drop foreign key pk_cust_sales
--drop table CustomerTlb
--drop table OrderTlb

create table Salesman(
SID int,
Sname varchar(20),
City varchar(20),
commision int,
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

alter table Ordertlb add constraint pk_ord_cust foreign key (CID) references CustomerTlb(CID)
alter table Ordertlb add constraint pk_ord_sales foreign key (SID) references Salesman(SID)
