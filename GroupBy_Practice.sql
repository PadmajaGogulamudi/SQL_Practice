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
