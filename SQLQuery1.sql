create database company

use company 

create table Employees(
ID int,
sname varchar(25),
Mobile_number bigint,
Salary int,
Department char(10),
city varchar(10)
)

INSERT INTO Employees VALUES(1001,'veera',8919557890,40000,'IT','HYD'),
                            (1002,'Naveen',7036519146,50000,'data analytics','HYD'),
                            (1003,'Varshini',7985602341,25000,'IT','HYD'),
                            (1004,'Raajitha',null,25000,'IT','HYD'),
                            (1005,'veeru',911136700,30000,'data analytics',null)
alter table employees
alter column Department varchar(30)

select * from employees 

