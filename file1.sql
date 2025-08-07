CREATE DATABASE INSTAGRAM;

USE instagram;
CREATE TABLE ACCOUTS(USERNAME VARCHAR(255),FIRSTNAME CHAR(20),POST INT, COUNTRY CHAR(29));
SELECT * FROM ACCOUTS;
INSERT INTO ACCOUTS VALUES ("_REDDY_457","REDDY",0,"INDIA"),("0WIW-","UCBI",9,"UGFCB"),("VFGEX+77","DBCY",6,"VDGVCCU"),("YYCBJS@4BE","EYCJSJ",0,"INDIA");
CREATE TABLE LIKES(USERNAME VARCHAR(50),LIKES INT,COMMENTS INT);
INSERT INTO LIKES VALUES ("_REDDY_457",4,6),("0WIW-",2,0),("VFGEX+77",9,2);
SELECT * FROM LIKES;
select * from accouts where post > 5 order by FIRSTNAME;
select count(firstname) from accouts;
select count(firstname),country,sum(post) from accouts  group by country order by sum(post) ;
select sum(post) from accouts;
select avg(likes),sum(likes) from likes;
select count(firstname),country from accouts group by country having sum(post)>0 order by sum(post);

create table Student(
stuId int not null,
stuname varchar(20) not null,
marks  int );
select stuid,stuname,marks from student;
insert into student(stuid,stuname) values(1,'paddu'),(2,'rani'),(3,'sandy');
select * from student;

use sampleone;

create table dep(
dep_id int ,
depName varchar(30) not null,
primary key(dep_id));

insert into dep values(1,'CSE'),(2,'CIVIL'),(5,'EEE');


create table Employee(
EmpID int ,
EmpName varchar(50) not null,
job varchar(30) not null,
salary decimal(10,2) not null,
dep int not null,
primary key(EmpID),
foreign key(dep) references dep(dep_id) on update cascade on delete cascade
);
 
insert into employee values(1,'ram','java',500.45,1),
(2,'paddu','python',200.34,1),
(3,'subbu','sql',500.93,2)
;
insert into employee values(4,'ram','devOps',5230.45,5),
(5,'Anu','java',2010.34,5),
(6,'paddu','.net',5030.93,2)
;
insert into employee values(7,'kalyan','devOps',230.45,5),
(8,'chinni','java',2010.34,2),
(9,'rao','blockchain',5030.93,1)
;
select * from employee;
select empid,empname,job,(salary*12) as AnnualSalary from employee;
update employee set dep=2 where empid=7;

select * from employee where dep=2 order by salary limit 0,3 ;

select * from employee where dep=1 order by  EmpName limit 0,2;
select null is null;


create table Customer(
cus_id int ,
Cname varchar(30) not null,
age int check(age>=18));
insert into customer value(1,"jfdhw",15);

use sampleone;

select * from employee;

select empname,salary*12 from employee;

select avg(salary) as avg_salary,job from employee group by job ;








