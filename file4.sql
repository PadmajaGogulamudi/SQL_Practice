use sampleone;
CREATE TABLE dept (
deptno int(2) not NULL,
dname varchar(20) not NULL,
loc varchar(20) not NULL,
primary key(deptno)
);

INSERT INTO dept VALUES ('10','ACCOUNTING','NEW YORK');

INSERT INTO dept VALUES ('20','RESEARCH','DALLAS');

INSERT INTO dept VALUES ('30','SALES','CHICAGO');

INSERT INTO dept VALUES ('40','OPERATIONS','BOSTON');


CREATE TABLE emp (
empno int(6) NOT NULL,
ename varchar(10) not NULL,
job varchar(15) not NULL,
mgr int(6) default NULL,
hiredate date not NULL,
sal int(8) not NULL,
comm int(5) default NULL,
deptno int(2) not NULL,
primary key(empno),
foreign key(deptno)
references dept(deptno)
);
INSERT INTO emp VALUES ('7369','SMITH','CLERK','7902','1980-12-17','800.00',NULL,'20');

INSERT INTO emp VALUES ('7499','ALLEN','SALESMAN','7698','1981-02-20','1600.00','300.00','30');

INSERT INTO emp VALUES ('7521','WARD','SALESMAN','7698','1981-02-22','1250.00','500.00','30');

INSERT INTO emp VALUES ('7566','JONES','MANAGER','7839','1981-04-02','2975.00',NULL,'20');

INSERT INTO emp VALUES ('7654','MARTIN','SALESMAN','7698','1981-09-28','1250.00','1400.00','30');

INSERT INTO emp VALUES ('7698','BLAKE','MANAGER','7839','1981-05-01','2850.00',NULL,'30');

INSERT INTO emp VALUES ('7782','CLARK','MANAGER','7839','1981-06-09','2450.00',NULL,'10');

INSERT INTO emp VALUES ('7788','SCOTT','ANALYST','7566','1982-12-09','3000.00',NULL,'20');

INSERT INTO emp VALUES ('7839','KING','PRESIDENT',NULL,'1981-11-17','5000.00',NULL,'10');

INSERT INTO emp VALUES ('7844','TURNER','SALESMAN','7698','1981-09-08','1500.00','0.00','30');

INSERT INTO emp VALUES ('7876','ADAMS','CLERK','7788','1983-01-12','1100.00',NULL,'20');

INSERT INTO emp VALUES ('7900','JAMES','CLERK','7698','1981-12-03','950.00',NULL,'30');

INSERT INTO emp VALUES ('7902','FORD','ANALYST','7566','1981-12-03','3000.00',NULL,'20');

INSERT INTO emp VALUES ('7934','MILLER','CLERK','7782','1982-01-23','1300.00',NULL,'10');

select * from emp where deptno=30 order by sal desc limit 0,3;

select * from emp where deptno=20 order by ename limit 0,2;

select empno,ename,sal from emp
 where comm=0 or comm is null 
 order by sal desc;

select empno,ename,hiredate from emp order by hiredate desc limit 0,3;

select  distinct job , deptno
 from emp 
 where deptno in (10,20,30) and Upper(ename) like '%A%' and comm is null  order by job limit 0,3;
 
 select deptno,count(*) from emp group by deptno;

select job,deptno 
from emp 
where deptno in(10,20,30) and
deptno in (
	select deptno 
    from emp 
    group by deptno having sum(sal)>5000
    ) 
group by job,deptno;


SELECT deptno, COUNT(*) AS number_of_employees_with_commission
FROM emp
WHERE comm IS NOT NULL
GROUP BY deptno
HAVING COUNT(*) > 2;

SELECT job, AVG(sal) AS average_salary
FROM emp
WHERE deptno = 30
GROUP BY job
HAVING AVG(sal) > 1500;



select * from emp where hiredate>(select hiredate from emp where sal=   (  select min(sal) from emp));

select * from emp where mgr=(select mgr from emp where ename='WARD' ) and ename!='WARD';

select ename,sal,deptno from emp where ename in(select ename from emp where deptno=20 group by deptno having sal > avg(sal));

select * from emp where sal>(select avg(sal) from emp where deptno in(10,20,30));

select deptno,job,count(*) as no_of_emps from emp group by deptno,job order by no_of_emps desc limit 1 ;

select ename,sal,job from emp where sal>(select max(sal) from emp where job='clerk') and job!='MANAGER';


select ename ,job, hiredate,deptno
 from emp 
 where deptno in 
	(select distinct deptno
		from emp  
        where job='clerk' 
        ) 
	and hiredate >
    (select hiredate 
		from emp  
        where ename='smith')
        order by deptno;
use sampleone;
select distinct job from emp;
select * from emp order by sal;

select * from emp order by Deptno, Job desc;




use sampleone;
SELECT * 
FROM emp 
WHERE job = 'MANAGER';

select * from emp where empno in (select distinct mgr from emp);
select ename,job,sal from emp where deptno =(select deptno from dept where loc='dallas');

select e.ename,e.job,e.sal from emp as e inner join dept as d on e.deptno=d.deptno where d.loc='dallas';

select e.ename,d.dname from emp as e inner join dept as d on d.deptno=e.deptno where job in ('manager','analyst');

select e.ename,d.dname from emp as e inner join dept as d on d.deptno=e.deptno where job='manager' or  job='analyst';

select ename,job,dname,loc,sal
 from emp as e inner join dept as d
 on e.deptno=d.deptno 
 where sal>1500 and d.loc='chicago';
 

 
 SELECT e.ename, e.sal, d.dname, e.deptno, d.loc
FROM emp e
JOIN dept d ON e.deptno = d.deptno
WHERE e.sal = (
    SELECT MAX(sal)
    FROM emp
    WHERE deptno = e.deptno
);

use sampleone;

select * from emp; 


 select e1.ename as employe  ,e2.ename as manager ,e1.deptno ,e2.deptno  from emp e1 join emp e2 on e1.mgr=e2.empno where e1.deptno!=e2.deptno;
 
create view Emp_experience_greter_7_work_in_dallas_newyork as select e.empno,e.ename,e.sal,d.dname,e.job,year(curdate())-year(hiredate) as experience
 from emp as e inner join dept as d 
 on e.deptno=d.deptno 
 where e.job in( 'manager','analyst')  and d.loc in('dallas','new york')  and 
 year(curdate())-year(hiredate)>7 and e.comm is null order by d.loc;
 
 
 
 select e.empno,e.ename,e.sal,d.dname from emp e inner join dept d on e.deptno=d.deptno where e.job
 in('manager','analyst') and d.loc in('new york','dallas') 
 and year(curdate())-year(e.hiredate) >7 and e.comm is null order by d.loc asc;
 
select book_id from book where book_id not between 3 and 5;
 #31-07-2025
 select e.ename,e.hiredate ,e1.ename
 from emp as e join emp as e1 on e.mgr=e1.empno
 where e.hiredate between (select hiredate from emp where ename='jones' ) and (select hiredate from emp where ename='blake')
 and e.ename not in('jones','blake');
 
 select e.ename as employee ,e1.ename as manager from emp as e  join emp as e1 on e.mgr=e1.empno;
 
 /*Display the employee name, their manager’s name, and the salary difference between them.
Show only employees who earn less than their manager.*/
SELECT 
    e.ename AS employee,
    m.ename AS manager,
    m.sal - e.sal AS salary_difference
FROM emp e
JOIN emp m ON e.mgr = m.empno
WHERE e.sal < m.sal;
/*1.Display the employee name, job, salary, department name, and location of those employees
whose salary is higher than the average salary of all employees working in New York.
Also ensure that the employee does not belong to New York.*/

select e.ename,e.job,e.sal,d.dname,d.loc from emp e  join dept d on e.deptno=d.deptno 
where e.sal>(select avg(e1.sal) from emp e1 join dept d1 on e.deptno=d.deptno where d1.loc='new york') and d.loc!='NEW YORK'; 

/*.Create a view called high_paid_mgrs that shows the name, job, department name, 
and salary of all employees who are MANAGERs earning more than the average salary of their department.
Then, write a query using this view to display only those managers working in the ‘ACCOUNTING’ department.*/
-- create view high_paid_mgrs as 
-- select e.ename,e.job,d.dname,e.sal from emp e inner join dept d on e.deptno=d.deptno 
-- where e.job>(select 

call procedure1(@sal1);

select @sal1;
call procedure2(@empname,7844);
select @empname;
select @annSal;
USE SAMPLEONE;

call procedure3(20,@numOfEmp,@maxSal,@avgSal);
select @numOfEmp as no_of ,@maxSal,@avgSal;

 call IncreaseAllSalaries(10);
 
 call GetEmpdetailsOfDept(10);
 
 SELECT E.ENAME AS EMPLOYEE,M.ENAME AS MANAGER,E.HIREDATE AS EMP_HIREDATE,M.HIREDATE AS MANAGER_HIREDATE 
 FROM EMP  E JOIN EMP M
 ON E.MGR=M.EMPNO
 WHERE MONTH(E.HIREDATE)=MONTH(M.HIREDATE);
 
 call Sum_Of_n_natural_nums(10);
 
call Check_Even_or_Odd(30);

drop table if exists Number_status;
create table Number_status(
	num int,
    even_odd varchar(20),
    primary key(num)
    );
call Print_Even_Or_Odd(1,10);
select * from number_status;

