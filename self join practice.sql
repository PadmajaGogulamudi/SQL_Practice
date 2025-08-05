#EMPNO	 ENAME	 JOB	 MGR	HIREDATE 	COMM	 DEPTNO
-- 7369	SMITH	CLERK	7902	1980-12-17	880			20
-- 7499	ALLEN	SALESMAN	7698	1981-02-20	1760	300	30
-- 7521	WARD	SALESMAN	7698	1981-02-22	1375	500	30
-- 7566	JONES	MANAGER	7839	1981-04-02	3273		20
-- 7654	MARTIN	SALESMAN	7698	1981-09-28	1375	1400	30
-- 7698	BLAKE	MANAGER	7839	1981-05-01	3135		30
-- 7782	CLARK	MANAGER	7839	1981-06-09	2695		10
-- 7788	SCOTT	ANALYST	7566	1982-12-09	3300		20
-- 7839	KING	PRESIDENT		1981-11-17	5500		10
-- 7844	TURNER	SALESMAN	7698	1981-09-08	1650	0	30
-- 7876	ADAMS	CLERK	7788	1983-01-12	1210		20
-- 7900	JAMES	CLERK	7698	1981-12-03	1045		30
-- 7902	FORD	ANALYST	7566	1981-12-03	3300		20
-- 7934	MILLER	CLERK	7782	1982-01-23	1430		10
-- 			EMP TABLE 				
-- Display employees whose manager joined before them
SELECT e.ename as employee,e.hiredate as emp_hiredate,m.ename as manager,m.hiredate as manager_hiredate
 FROM emp e JOIN emp m
 ON e.mgr=m.empno  
 WHERE m.hiredate<e.hiredate;
 
-- List employee names, their manager’s name, and department numbers.
SELECT e.ename AS employee,m.ename AS manager,e.deptno FROM emp e JOIN emp m
ON e.mgr=m.empno ;
#Show employees who have the same job as their manager.
select e.ename from emp e join emp m ON e.mgr=m.empno 
WHERE m.job=e.job;

#Display all employees working under the same manager as 'JONES'.
# jones ane manager unna employees
SELECT e.eNAME FROM emp e JOIN emp m
ON E.MGR=M.EMPNO WHERE M.ENAME='JONES';
#jones ki unna manager thana kindha unna employees 
SELECT e.ename
FROM emp e
JOIN emp m ON e.mgr = m.mgr
WHERE m.ename = 'JONES' AND e.ename <> 'JONES';
#Display the count of employees under each manager.
SELECT COUNT(*) ,MGR FROM EMP GROUP BY MGR;
SELECT M.ENAME AS MANAGER,COUNT(M.ENAME) AS NUMBER_OF_EMPLOYEES 
FROM EMP E JOIN EMP M
ON E.MGR=M.EMPNO
GROUP BY M.ENAME ORDER BY NUMBER_OF_EMPLOYEES DESC;

#List employees who earn more than their manager.
SELECT E.ENAME AS EMPLOYEE,M.ENAME AS MANAGER,E.SAL AS EMP_SAL,M.SAL AS MANAGER_SAL
FROM EMP E JOIN EMP M
ON E.MGR=M.EMPNO 
WHERE E.SAL>M.SAL;

#List employees along with their manager’s job title.
SELECT E.ENAME AS EMPLOYEE,M.JOB AS MANAGER_JOB
FROM EMP E JOIN EMP M 
ON E.MGR=M.EMPNO;

#Show employees and their manager where both joined in the same year.
SELECT E.ENAME AS EMPLOYEE,M.ENAME AS MAAGER,E.HIREDATE AS EMP_HIREDATE,M.HIREDATE AS MANAGER_HIREDATE
FROM EMP E JOIN EMP M 
ON E.MGR=M.EMPNO
WHERE YEAR(E.HIREDATE)=YEAR(M.HIREDATE) ORDER BY YEAR(E.HIREDATE);

#Show the employee with the earliest hire date under each manager.
SELECT e.empno, e.ename AS employee, m.ename AS manager, e.hiredate
FROM emp e
JOIN emp m ON e.mgr = m.empno
WHERE e.hiredate = (
    SELECT MIN(e2.hiredate)
    FROM emp e2
    WHERE e2.mgr = e.mgr
);

#Display employees whose experience is greater than their manager.
SELECT E.ENAME AS EMPLOYEE,M.ENAME AS MGR,
TIMESTAMPDIFF(YEAR,E.HIREDATE,CURDATE()) AS EMP_EXPERIENCE,TIMESTAMPDIFF(YEAR,M.HIREDATE,CURDATE()) AS MGR_EXPERIENCE
FROM EMP E JOIN EMP M
ON E.MGR=M.EMPNO
WHERE E.HIREDATE<M.HIREDATE;

#List the employees who joined within 100 days after their manager.
SELECT E.ENAME AS EMPLOYEE,M.ENAME AS MGR,
TIMESTAMPDIFF(YEAR,E.HIREDATE,CURDATE()) AS EMP_EXPERIENCE,TIMESTAMPDIFF(YEAR,M.HIREDATE,CURDATE()) AS MGR_EXPERIENCE,
DATEDIFF(E.HIREDATE,M.HIREDATE) AS DATE_DIFFERENCE
FROM EMP E JOIN EMP M
ON E.MGR=M.EMPNO
WHERE DATEDIFF(E.HIREDATE,M.HIREDATE) BETWEEN 0 AND 100
and M.HIREDATE<E.HIREDATE ;

#Display employees and their managers who work in the same department.
SELECT E.ENAME AS EMPLOYEE,M.ENAME AS MANAGER,D.DEPTNO AS DEP_NO 
FROM EMP E JOIN EMP M 
ON E.MGR=M.EMPNO
JOIN DEPT D
ON D.DEPTNO=E.DEPTNO
WHERE E.DEPTNO=M.DEPTNO;

#List employees whose manager's salary is more than 5000.
SELECT
	E.ENAME AS EMPLOYEE,
    M.ENAME AS MANAGER,
    M.SAL AS MANAGER_SAL
FROM 
	EMP E 
		JOIN EMP M ON E.MGR=M.EMPNO
WHERE M.SAL>5000;

 #Display employees who share the same job title as another employee.
SELECT * 
FROM EMP
WHERE JOB IN(
		SELECT JOB
		FROM EMP
		GROUP BY JOB
		HAVING COUNT(*)>1
        );
SELECT DISTINCT E1.ENAME AS EMPLOYEE,E1.JOB
FROM EMP E1 JOIN EMP E2
ON E1.JOB=E2.JOB
WHERE E1.EMPNO<>E2.EMPNO
ORDER BY E1.JOB;

# Show employees who earn exactly the same salary as someone else.

            







