use sampleone;
create table publisher(
pub_id int ,
pub_name varchar(30) not null,
primary key(pub_id)
);


create table book(
book_id int ,
title varchar(20) not null,
pub_id int not null,
primary key(book_id),
foreign key(pub_id) references publisher(pub_id) on update cascade on delete cascade);

insert into publisher values(1,'ram'),
(2,'subbu'),
(4,'paddu');

insert into book values(1,'atomis habits',1),
(2,'kdjk',1),
(3,'brhj',4),
(4,'vfehwj',2),
(5,'rbfhr',2),
(6,'frjhr',4);

select * from publisher;
select * from book;

update publisher set pub_id=3 where pub_id=1;

delete from publisher where pub_id=2;
insert into publisher values(5,'jsbd'),(6,'bnge');
insert into book values(7,'bfjewh',5),(8,'kajsixuha',6);
select * from student;
select * from course;



create table student(
stu_id int ,
stu_name varchar(20) not null,
age int not null,
email varchar(39) unique not null ,
cou_id int not null,
primary key(stu_id),
foreign key(cou_id) references course(courseId)
);



insert into student values(1,'jdf',4,'rhf@jfbdjw',2);

insert into student values(2,'jdf',4,'rhf@jfbdjw',2);



create table customer(
cusId int not null,
cname varchar(20) not null,
age int check(age>=18) not null);

insert into customer values(1,'ram',21),(2,'jbd',19),(3,'bdjas',18);







