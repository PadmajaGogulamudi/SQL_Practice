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
 
 
 
 
 