# Find employees who earn more than the **average salary**.
select ename from emp where sal>(select avg(sal) from emp);
#2. List employees who were hired after the **earliest hire date** in the company.
select ename from emp where hiredate>(select min(hiredate) from emp);
#4. Display employees working in the department with the **lowest average salary**.
select empno from emp where deptno  = (select  deptno from emp group by deptno order by avg(sal) limit 0,1 );

#5. Find the job that has the **highest total salary**.
select job from emp group by job order by avg(sal) desc limit 0,1;
select job from emp where sal=(select avg(sal) from emp group by job order by avg(sal) limit 0,1)

