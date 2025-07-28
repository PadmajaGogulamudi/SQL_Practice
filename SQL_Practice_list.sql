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
 
 
 
 
 