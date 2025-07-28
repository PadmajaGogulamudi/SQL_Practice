use sampleone;
create table Books(
BookId int,
title varchar(30) not null,
publishedYear int ,
author varchar(20),
price int not null,
genre varchar(10) ,
primary key(Bookid)
);
insert into books values(1,'abs',2020,'ram',2000,'gahvd'),
(2,'whbx',1919,'priya',5000,'kjahd');
select title,author from books;




create table Course(
courseId int ,
coursename varchar(20) not null,
fee int ,
primary key(courseId)
);
create table Student(
stuId int,
stuname varchar(20),
mobileno int,
courseId int,
primary key(stuId),
foreign key(courseId) references course(courseId)
on update cascade
);
select * from Course;
insert into Course values(1,'jfs',2873),
(3,'sales',574836),
(7,'pfs',8842);
insert into Student values(1,'wje',867856,1),
(2,'sde',867856,1),
(5,'ekrfe',867856,3),
(9,'o5irjfe',867856,3);
select * from student;
update course set courseId=1 where courseId=2;




