#1. List the total salary paid to each department.
SELECT 
	DEPTNO,
	SUM(SAL) AS TOTAL
FROM EMP 
GROUP BY DEPTNO;
#2. Count the number of employees in each department.
SELECT
	DEPTNO,
	COUNT(*) AS NUM_OF_EMPLOYEES
FROM EMP
GROUP BY DEPTNO;

#3. Find the average salary of employees in each job role.
SELECT
	JOB,
	ROUND(AVG(SAL),2) AS AVerage_sal
FROM EMP 
group by JOB;

#4. Display the maximum salary in each department.
SELECT
	MAX(SAL) AS MAX_SAL,
    DEPTNO
FROM emp
GROUP BY DEPTNO;
#5. Show the minimum salary in each department.
SELECT
	MIN(SAL) AS MIN_SAL,
    DEPTNO
FROM emp
GROUP BY DEPTNO;

#6. Count how many employees are in each job title.
SELECT
	JOB,
    COUNT(*) AS NO_OF_EMP
FROM EMP
GROUP BY JOB;    

#7. Calculate total commission paid for each department.
SELECT
	DEPTNO,
	SUM(COMM) AS TOTAL_COMM
FROM emp
GROUP BY DEPTNO;

#Count employees per manager.
SELECT
	MGR AS MANAGER,
    COUNT(*) AS NO_OF_EMPLOYEES
FROM emp
GROUP BY MGR
HAVING MGR IS NOT NULL;

SELECT
    MGR.EMPNO AS MANAGER_ID,
    MGR.ENAME AS MANAGER_NAME,
    COUNT(E.EMPNO) AS NO_OF_EMPLOYEES
FROM EMP E
JOIN EMP MGR ON E.MGR = MGR.EMPNO
GROUP BY MGR.EMPNO, MGR.ENAME;

#10. List total salary and total commission by job.
SELECT 
	JOB,
    SUM(SAL) AS SALA,
  COALESCE(SUM(COMM), 0) AS COMMI
FROM EMP
GROUP BY JOB;
#11. List departments having more than 3 employees.
SELECT
	DEPTNO
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*)>3;

#12. Find job roles with average salary greater than 2000.
SELECT
	JOB
FROM EMP
GROUP BY JOB
HAVING AVG(SAL)>2000;    

#14. Display managers who manage more than one employee.
 SELECT
	MGR,
    COUNT(*) AS NO_OF_EMPLOYEES
FROM EMP
GROUP BY MGR
HAVING COUNT(*)>1;

#15. Show job roles where minimum salary is less than 1500.
SELECT
	JOB
FROM EMP
GROUP BY JOB
having MIN(SAL)<1500;

#20. Find job roles with more than 2 employees and total commission above 100.
SELECT
	JOB
FROM EMP
GROUP BY JOB
HAVING COUNT(*)>2 AND SUM(COALESCE(COMM, 0))>100;

#List department names with total salary paid (join with DEPT).
select d.dname,sum(e.sal) from dept d left join emp e  on e.deptno=d.deptno group by d.deptno; 

#22. Show department location with count of employees (join with DEPT).
select d.loc,count(e.ename) as no_of_employees from emp e right join dept d on e.deptno=d.deptno group by d.deptno;
#23. List job titles in each department and count them.
select e.deptno,e.job,count(*) from emp e join dept d on e.deptno=d.deptno group by e.deptno,e.job order by e.deptno;
#24. Show total salary paid in each department by location.
select d.deptno,d.loc,sum(e.sal) from emp e join dept d on e.deptno=d.deptno group by e.deptno;

#List department names where average salary is greater than 2000.
select d.dname from emp e join dept d  group by e.deptno,d.dname having avg(e.sal)>2000;

#List total salary for each job in each department.
select deptno,job,sum(sal),count(ename) from emp group by deptno,job order by deptno;
#Count employees by job and manager.
select job,mgr,count(*) from emp group by job,mgr;
#28. Show department and job-wise average salary.
select deptno,round(avg(sal),2) as avarage_sal from emp group by deptno,job;

#29. List department and job combinations where max salary exceeds 3000.
select deptno,job,max(sal) from emp group by deptno,job having max(sal)>3000;
#30. Count employees grouped by DEPTNO and JOB.
select deptno,job,count(*) as no_of_emps from emp group by deptno,job;
# List departments having more than 1 employee and total salary above 5000.
SELECT  
    deptno
FROM emp
GROUP BY deptno
HAVING COUNT(ename) > 1 
   AND SUM(sal) > 5000;
   
#Find jobs where sum of salary is greater than 6000.
SELECT 
	job
FROM emp
GROUP BY job
HAVING  SUM(sal)>6000;

#33. Show department/job groups where count of employees is more than 1 and avg salary < 2500.
select deptno,job from emp group by deptno,job having count(*)>1 and avg(sal)<2500;

#34. Show job roles with more than 2 employees and max salary below 3000.
select job from emp group by job having count(*)>2 and max(sal)<3000;
#35. Show managers who manage more than 2 employees with average salary > 1500.
select m.ename as manager,count(e.ename ) as no_of_emps from emp e join emp m on e.mgr=m.empno group by m.empno having count(e.empno)>2 and avg(e.sal)>1500;
-- SELECT 
--     m.empno,
--     m.ename AS Manager,
--     COUNT(e.empno) AS No_of_Employees,
--     ROUND(AVG(e.sal), 2) AS Avg_Salary
-- FROM emp e
-- JOIN emp m ON e.mgr = m.empno
-- GROUP BY m.empno, m.ename
-- HAVING COUNT(e.empno) > 2 
--    AND AVG(e.sal) > 1500;
#36. Show department-wise average salary but only include employees with salary > 1000.
select deptno,avg(sal) from emp where sal>1000 group by deptno ;

#37. List job-wise total commission where commission is not null.
select job,sum(comm) from emp where comm is not null group by job;
#38. Count employees hired after 01-Jan-1981 grouped by department.
select deptno,count(ename) from emp where hiredate>STR_TO_DATE('01-01-1981', '%d-%m-%Y') group by deptno;
#39. Show department-wise total salary excluding SALESMANs.
select deptno,sum(sal) from emp where job<>"SALESMAN" group by deptno;
#!= and <> both are same but <> is standard it works in most of the databases. so try to use <>
#40. Show average salary per department for employees earning more than 2000.
select deptno,avg(sal) from emp where sal>2000 group by deptno;

