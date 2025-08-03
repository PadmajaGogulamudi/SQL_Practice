select * from emp;

select distinct job from emp;

select * from emp order by sal;

select * from emp order by deptno,job desc;

select  distinct job from emp order by job desc;

select distinct job from emp order by job desc;
select * from emp where job='manager';

select * from emp where empno in (select distinct mgr from emp);

select * from emp where year(hiredate)<1981;
select month(hiredate) from emp;

select empno,ename,sal,round(sal/30,2) as daily_salary,sal*12 as annual_sal
 from emp order by annual_sal;
 
 select empno,ename,job,hiredate,ROUND(TIMESTAMPDIFF(year, hiredate, CURDATE()) / 12, 2) as experience_in_years  
 from emp where empno in (select distinct mgr from emp);
 
 select empno,ename,sal,round(timestampdiff(year,hiredate,curdate())/12,2) as experience
 from emp where mgr =7839;
 
 select * from emp where comm>sal;
 
 select * from emp where year(hiredate)=1981 and month(hiredate)>=7 order by job;
 
 select *, round(timestampdiff(year,hiredate,curdate())/12,2) as experience from emp where round(sal/30,2)>100;
 
 select * from emp where job='CLERK' or job='ANALYST' order by empno desc;
 
 select empno,hiredate
 from emp 
 where hiredate in  ('1981-05-01','1981-12-03','1981-12-17','1980-01-19') order by hiredate desc;
 
 
 select * from emp where deptno in(10,20);
 
 select * from emp where year(hiredate)=1981;
 
 select * from emp where year(hiredate)=1981 and month(hiredate)=08;
 
 select *,sal*12 as annual_sal from emp where sal*12 between 35700 and 45000;
 
 select ename from emp where length(ename)=5;
 
 select ename from emp where length(ename)=5 and ename like's%';
 
 select ename from emp where length(ename)=4 and ename like '__r%';
 
 select ename from emp where length(ename)=5 and ename like's%h';
 
 select empno,ename from emp where month(hiredate)=01;
 
#List the emps who joined in the month of which second character is ‘a’
 select * from emp where monthname(hiredate) like '_a%';
 
 # List the emps whose Sal is four digit number ending with Zero
 select ename from emp where sal%10=0 and sal between 1000 and 9990;
 select * from emp where sal like '___0';
 
 #List the emps whose names having a character set ‘ll’ together.
 select * from emp where ename like '%ll%'  ;
 
 #List the emps those who joined in 80’s.
 select * from emp where year(hiredate) between 1980 and 1989;
 
 #List the emps who does not belong to Deptno 20.
 select * from emp where deptno!=20;
 select * from emp where deptno <> 20;
 
 #List all the emps except ‘PRESIDENT’ & ‘MGR” in asc order of Salaries.
 select * from emp where job not in('PRESIDENT','Manager') order by sal;
 
 #List all the emps who joined before or after 1981.
 select * from emp where year(hiredate) <> 1981;
 
 #List the emps whose Empno not starting with digit78.
 select * from emp where cast(empno as char) not like '78%';
 
 #List the emps who are working under ‘MGR’.
 select * from emp where mgr in (select empno from emp where job='manager');
 
 SELECT e.empno, e.ename, e.job, e.mgr
FROM emp e
WHERE e.mgr IN (
    SELECT empno FROM emp WHERE job = 'MANAGER'
);

#List the emps who joined in any year but not belongs to the month of March.
select * from emp where month(hiredate)!=02;

#List all the Clerks of Deptno 20.
select * from emp where job='Clerk' and deptno=20;
 
#List the emps of Deptno 30 or 10 joined in the year 1981.
select * from emp where deptno in (30,10) and year(hiredate)!=1981;

#Display the details of SMITH.
select * from emp where ename='SMITH';

#Display the location of SMITH
select d.loc from emp e inner join dept d on e.deptno=d.deptno where ename='SMITH'; 

/*List the total information of EMP table along with DNAME and Loc of all the
emps Working Under ‘ACCOUNTING’ & ‘RESEARCH’ in the asc Deptno*/
select distinct job from emp;
select ename,d.dname,loc 
from emp  e join dept d 
on e.deptno=d.deptno 
where e.mgr in(select empno from emp where job in ('SALESMAN','ANALYST')) order by e.deptno;

/*List the Empno, Ename, Sal, Dname of all the ‘MGRS’ and ‘ANALYST’
working in New York, Dallas with an exp more than 7 years without receiving the
Comm asc order of Loc.*/

/*Display the Empno, Ename, Sal, Dname, Loc, Deptno, Job of all emps working at
'CHICAGO' or working for ACCOUNTING dept with Ann Sal>28000, but the Sal
should not be=3000 or 2800 who doesn’t belongs to the Mgr and whose no is
having a digit ‘7’ or ‘8’ in 3rd position in the asc order of Deptno and desc order
of job.*/
select e.empno,e.ename,e.sal,d.dname,d.loc,e.deptno,e.job 
from emp e inner join dept d on e.deptno=d.deptno
 where (d.loc='CHICAGO' or e.job='CLERK') and sal*12 >120 and sal not in (3000,2800) 
 and e.mgr is null and substring(lpad(empno,4,0),3,1) in (7,8) ;
 
 create table paddu
 (name_ varchar(30));
 insert into paddu values("hello");
 select * from paddu;
truncate table paddu;
drop table paddu;
#delete will not work without where clause
delete from paddu;


