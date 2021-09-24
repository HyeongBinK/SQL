--USE master
--CREATE DATABASE CorpDB

--USE CorpDB
--CREATE TABLE DEPARTMENT(
--DNO int PRIMARY KEY,
--DNAME nvarchar(20),
--LOC nchar(20)
--)

--INSERT INTO department(dno, dname, loc) VALUES(10, '경리부', '서울')
--INSERT INTO department(dname, loc, dno) VALUES('인사부', '인천', 20)
--INSERT INTO department(loc, dno, dname) VALUES('대전', 30, '영업부')
--INSERT INTO department VALUES(40, '전산부', '부천')

/*
SELECT salary + commision FROM employee
SELECT salary - commision FROM employee
SELECT salary * 12 FROM employee
SELECT salary / 12 FROM employee

SELECT isnull(commision, 0) FROM employee
*/

/*
SELECT salary * 12 + isnull(commision, 0) AS 연봉 FROM employee
SELECT salary * 12 + isnull(commision, 0) 연봉 FROM employee
SELECT salary * 12 + isnull(commision, 0) [연 봉] FROM employee

SELECT DISTINCT dno FROM employee
*/

/*
SELECT * FROM employee WHERE dno = 10
SELECT * FROM employee WHERE salary <> 300
SELECT * FROM employee WHERE salary = 300
SELECT * FROM employee WHERE salary > 300
SELECT * FROM employee WHERE salary < 300
SELECT * FROM employee WHERE salary >= 300
SELECT * FROM employee WHERE salary <= 300
*/

/*
SELECT * FROM employee WHERE commision IS NULL
SELECT * FROM employee WHERE commision IS NOT NULL
SELECT * FROM employee WHERE ename = '조인성'
SELECT * FROM employee WHERE HIREDATE > '2002'
SELECT * FROM employee WHERE HIREDATE > '2002/01/01'
SELECT * FROM employee WHERE HIREDATE > '2003-01-01'
*/

/*
SELECT * FROM employee WHERE SALARY > 200 AND dno > 10
SELECT * FROM employee WHERE SALARY > 200 OR dno > 10
SELECT * FROM employee WHERE NOT SALARY > 200 AND NOT dno < 10

SELECT * FROM employee WHERE SALARY BETWEEN 200 AND 400
SELECT * FROM employee WHERE SALARY NOT BETWEEN 200 AND 400
*/

/*
SELECT * FROM employee WHERE dno IN(10, 30)

SELECT * FROM employee WHERE ename LIKE '이%'
SELECT * FROM employee WHERE ename LIKE '%성%'
SELECT * FROM employee WHERE ename LIKE '%성'
SELECT * FROM employee WHERE ename LIKE '_성%'
SELECT * FROM employee WHERE ename LIKE '__성%'
*/

/*
SELECT * FROM employee ORDER BY SALARY
SELECT * FROM employee ORDER BY SALARY ASC
SELECT * FROM employee ORDER BY SALARY DESC
SELECT * FROM employee ORDER BY SALARY DESC, ename ASC
*/

/*
SELECT TOP(5) * FROM EMPLOYEE ORDER BY SALARY DESC
SELECT TOP(5) WITH TIES * FROM employee ORDER BY SALARY DESC
SELECT TOP(10) PERCENT * FROM EMPLOYEE ORDER BY SALARY DESC
*/

/*
SELECT SUM(salary) [급여 총액] FROM employee
SELECT AVG(salary) [평균 급여] FROM employee
SELECT MAX(salary) [최대 급여], MIN(salary) [최소급여] FROM employee
SELECT COUNT(commision) [커미션 받는 사원 수] FROM employee
SELECT COUNT(DISTINCT job) [업무 수] FROM employee
*/

/*
SELECT dno, AVG(salary) [평균 급여] FROM employee GROUP BY dno
SELECT dno, MAX(salary) [최대 급여], MIN(salary) [최소 급여] FROM employee
GROUP BY dno
SELECT dno, COUNT(*) [부서별 사원 수], COUNT(commision) [커미션 받는 사원 수]
FROM employee GROUP By dno

SELECT dno, AVG(salary) [평균 급여] FROM employee GROUP BY dno HAVING AVG(salary) >= 500
SELECT dno, MAX(salary) [최대 급여], MIN(salary) [최소 급여] FROM employee
GROUP BY dno HAVING MAX(salary) > 500
*/

/*
SELECT dno, job, SUM(salary) [급여 총액] FROM employee GROUP BY dno, job WITH ROLLUP

SELECT ename, dno,
CASE
WHEN dno = 10 THEN '경리부'
WHEN dno = 20 THEN '인사부'
WHEN dno = 30 THEN '영업부'
WHEN dno = 40 THEN '전산부'
END[부서명]
FROM employee
*/

--SELECT employee.dno FROM employee

/*
SELECT e.dno FROM employee e
SELECT eno, ename FROM employee, department WHERE employee.dno = department.dno
SELECT e.eno, e.ename, e.dno FROM employee e, department d WHERE e.dno = d.dno AND e.dno = 10
SELECT e.eno, e.ename, d.dno, d.dname FROM employee e JOIN department d ON e.dno = d.dno AND e.dno = 10
*/


/*
SELECT e.ename, e.salary, s.grade FROM employee e, salgrade s WHERE e.salary BETWEEN s.lowsal AND s.highsal
SELECT e.ename, e.salary, s.grade FROM employee e JOIN SALGRADE s ON e.SALARY BETWEEN s.LOWSAL AND s.HIGHSAL

SELECT member.ename [사원이름], manager.ename [직속상관이름] FROM employee member, employee manager
WHERE member.MANAGER = manager.eno
SELECT member.ename [사원이름], manager.ename [직속상관이름] FROM employee member JOIN employee manager
ON member.MANAGER = manager.eno
*/

/*
SELECT member.ename[사원이름], manager.ename[직속상관이름] FROM employee 
member LEFT OUTER JOIN employee manager ON member.manager = manager.eno
*/

/*
SELECT dname FROM department WHERE dno = (SELECT dno FROM employee WHERE ename = '조인성' )
SELECT ename, salary FROM employee WHERE salary > (SELECT AVG(salary) FROM employee)
*/

--SELECT ename, salary, dno FROM employee WHERE dno IN (SELECT DISTINCT dno FROM employee WHERE salary > 500)

/*
--EXISTS 연산자
SELECT * FROM department WHERE EXISTS (SELECT * FROM employee WHERE dno = 10)
SELECT * FROM department d WHERE EXISTS (SELECT * FROM employee e WHERE e.dno = d.dno)
--ANY, SOME 연산자
SELECT ename, salary FROM employee WHERE salary > ANY(SELECT SALARY FROM employee WHERE dno = 30)
--ALL 연산자
SELECT ename, salary FROM employee WHERE salary > ALL(SELECT salary FROM employee WHERE dno = 30)
*/

/*
--SELECT INTO 문
SELECT * INTO employee_cpy FROM employee
SELECT * INTO department_cpy FROM DEPARTMENT
--UPDATE 문
UPDATE employee_cpy SET salary *= 1.1, hiredate = GETDATE() WHERE dno = 10
UPDATE department_cpy SET loc = (SELECT loc FROM department_cpy WHERE dno = 40)
WHERE dno = 20
*/

/*
--DELETE문
DELETE FROM employee_cpy WHERE dno = 30
DELETE FROM employee_cpy WHERE dno = (SELECT dno FROM department WHERE dname = '전산부')
*/
--SELECT * FROM employee_cpy

/*
BEGIN TRAN
DELETE FROM department_cpy
SELECT * FROM department_cpy
ROLLBACK TRAN
SELECT * FROM department_cpy
*/

/*
CREATE DATABASE Test01
ON
PRIMARY

(NAME = Test01,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\test01.mdf',
SIZE = 100MB,
MAXSIZE = 200,
FILEGROWTH = 20 )

LOG ON
( NAME = Test01_LOG,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\test.ldf',
SIZE = 20MB,
MAXSIZE = 50,
FILEGROWTH = 10% )
*/

/*
CREATE TABLE memberTest
(
id int PRIMARY KEY IDENTITY(1, 1),
name varchar(20)
)
GO
INSERT memberTest VALUES('김나리')
INSERT memberTest VALUES('이백합')
INSERT memberTest VALUES('김장미')
*/

/*
ALTER TABLE memberTest ADD [date] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP

ALTER TABLE memberTest ALTER COLUMN name char(10)
*/

/*
ALTER TABLE memberTest DROP CONSTRAINT DF__memberTest__date__15702A09
ALTER TABLE memberTest DROP COLUMN date
*/


--테이블의 모든 ROw(행) 제거
--TRUNCATE TABLE memberTest
--테이블 삭제
--DROP TABLE memberTest

