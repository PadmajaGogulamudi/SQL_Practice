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






