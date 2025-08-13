USE SAMPLEONE;
SELECT E.ENAME AS EMPLOYEE,E.JOB ,D.DNAME AS DEPT_NAME,D.LOC AS LOCATION,M.ENAME AS MANAGER,
TIMESTAMPDIFF(YEAR, E.HIREDATE, CURDATE())
 AS EMP_EXPERIENCE,TIMESTAMPDIFF(YEAR, M.HIREDATE, CURDATE())
 AS MANAGER_EXPERIENCE 
FROM EMP E JOIN EMP M ON E.MGR=M.EMPNO JOIN DEPT D ON E.DEPTNO=D.DEPTNO
WHERE E.MGR IS NOT NULL
ORDER BY D.DNAME,E.ENAME;
select * from emp;
# 10-8-2025 creating Procedure named adjust_salary_info

update emp set sal=1560  where empno=7782;
set @p_increment=2;
call adjust_salary_info(7782,@p_increment,@p_new_salary);
select @p_new_salary as updates_sal;