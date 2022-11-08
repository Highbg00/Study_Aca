8장. DML ☞ 데이터조작어, 반드시 TCL 과 함께 사용하여야 함
DML(Data Manipulation Language : SELECT, INSERT, UPDATE, DELETE) + TCL(Transaction Control Language : COMMIT, ROLLBACK)

1. 삽입저장 : INSERT
1.1 INSERT INTO 테이블명
    VALUES ( 테이블 구조 순서에 맞는 데이터값 목록 )
1.2 INSERT INTO 테이블명 (컬럼명 나열)
    VALUES ( 나열된 컬럼명 순서에 맞는 데이터값 목록 )
1.3 INSERT INTO 테이블명 --AS 없음
    조회쿼리문 ☞ SELECT 문
    ☜ ITAS : VALUES 절 없이 SELECT 절 사용해 서브쿼리로 테이블로부터 여러 데이터 행을 복사 저장
             INSERT 절의 저장할 컬럼목록과 SELECT 절의 컬럼 목록 갯수가 같아야 함

DESC  departments;

이름              널?       유형           
--------------- -------- ------------ 
DEPARTMENT_ID   NOT NULL NUMBER(4)    NOT NULL ☜ 반드시 값을 입력  
DEPARTMENT_NAME NOT NULL VARCHAR2(30) NOT NULL ☜ 반드시 값을 입력
MANAGER_ID               NUMBER(6)    
LOCATION_ID              NUMBER(4) 

01. 
INSERT INTO departments
VALUES (300, '영업부', NULL, NULL); 
02. 
INSERT INTO departments
VALUES (310, '개발부', '', ''); 
03. 
INSERT INTO departments
VALUES (320, '총무부', DEFAULT, DEFAULT); 

SELECT  * 
FROM    departments;

ROLLBACK; --작업취소

02. 모든 데이터값의 기본값 DEFAULT 는 NULL 이다.
테이블 구조에서의 NOT NULL 컬럼에는 반드시 값을 담아야 데이터행이 저장된다.

INSERT INTO departments(department_id) --에러
VALUES  (330);

03. 
DESC  employees;

이름             널?       유형           
-------------- -------- ------------ 
EMPLOYEE_ID    NOT NULL NUMBER(6)    NOT NULL ☜ 반드시 값을 입력
FIRST_NAME              VARCHAR2(20) 
LAST_NAME      NOT NULL VARCHAR2(25) NOT NULL ☜ 반드시 값을 입력
EMAIL          NOT NULL VARCHAR2(25) NOT NULL ☜ 반드시 값을 입력
PHONE_NUMBER            VARCHAR2(20) 
HIRE_DATE      NOT NULL DATE         NOT NULL ☜ 반드시 값을 입력
JOB_ID         NOT NULL VARCHAR2(10) NOT NULL ☜ 반드시 값을 입력
SALARY                  NUMBER(8,2)  
COMMISSION_PCT          NUMBER(2,2)  
MANAGER_ID              NUMBER(6)    
DEPARTMENT_ID           NUMBER(4) 

INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_id, salary, department_id)
VALUES                (301,         '길동',     '홍',      'GILDONG', TO_DATE('10/10/10'), 'MK_REP', 3000, 300);

SELECT  *
FROM    employees;

COMMIT; --작업확정

1.3 ITAS ☞ 여러행을 한번에 삽입 저장
INSERT INTO 테이블명 --AS없음, 기존 테이블에 삽입 저장
  조회쿼리문(SELECT 문)
  
01. departments 테이블에 새로운 department_id(department_id + 1) 를 삽입저장
INSERT INTO departments
  SELECT  department_id + 1, department_name, manager_id, location_id
  FROM    departments;

SELECT  *
FROM    departments;
--------------------------------------------------------------------------------
* CTAS (Create Table As Select) ☜ NOT NULL 이외의 제약조건(Primary Key 등)은 복사되지 않는다.
CREATE TABLE 테이블명 AS  
  조회쿼리문(SELECT 문)

CREATE TABLE emp AS
  SELECT  employee_id deptno, first_name, last_name, hire_date, job_id, department_id dept_id
  FROM    employees;

SELECT  *
FROM    emp;

CREATE TABLE emp AS --구조만 복사
  SELECT  employee_id id, first_name, last_name, hire_date, job_id, department_id dept_id
  FROM    employees
  WHERE   1 = 2; --엉터리조건
  
SELECT  *
FROM    emp1;

DESC  emp1;
--------------------------------------------------------------------------------
DROP TABLE  emp;

DROP TABLE  emp1;
--------------------------------------------------------------------------------
휴지통 확인
SELECT  *
FROM    RECYCLEBIN;
--------------------------------------------------------------------------------
휴지통 복원
FLASHBACK TABLE emp TO BEFORE DROP;
--------------------------------------------------------------------------------
휴지통 비우기
PURGE RECYCLEBIN;
--------------------------------------------------------------------------------

employees 테이블의 10번, 20번 부서원들의 정보를 복사하여
emp 테이블에 데이터행을 삽입저장

INSERT INTO emp --AS 없음
--  조회쿼리문
  SELECT  employee_id, first_name, last_name, hire_date, job_id, department_id
  FROM    employees
  WHERE   department_id IN (10, 20);
  
SELECT  *
FROM    emp;

2. 변경저장 : UPDATE - 반드시 조건절 기술
UPDATE  테이블명
SET     컬럼명1 = 데이터값1, 컬럼명2 = 데이터값2, ...
WHERE   조건절;

COMMIT;

SELECT  *
FROM    emp;

        ID FIRST_NAME           LAST_NAME                 HIRE_DAT JOB_ID        DEPT_ID
---------- -------------------- ------------------------- -------- ---------- ----------
       200 Jennifer             Whalen                    03/09/17 AD_ASST            10
       201 Michael              Hartstein                 04/02/17 MK_MAN             20
       202 Pat                  Fay                       05/08/17 MK_REP             20
       
01. emp 테이블에서 id가 202 인 사원의 dept_id를 30으로 job_id 를  programmer 로 변경
UPDATE  emp
SET     dept_id = 30, job_id = 'programmer'
WHERE   id = 202;

SELECT  *
FROM    emp;

02. emp테이블에서 id 가 202 인 사원의 job_id 를 PU_CLERK 로 변경
UPDATE  emp
SET     job_id = 'PU_CLERK'
WHERE   id = 202;

SELECT  *
FROM    emp;

03. emp테이블에서 id가 202 인 사원의 dept_id 를 NULL로 변경
UPDATE  emp
SET     dept_id = NULL
WHERE   id = 202;

SELECT  *
FROM    emp;

04. 서브쿼리로 데이터 행 변경
emp 테이블의 부서배치 받지 않은 사원들의 부서코드를 
employees 테이블의 job_id 가 AD_PRES 인 사원의 부서코드로 변경
UPDATE  emp
--SET     dept_id = (서브쿼리) --employees 테이블의 job_id 가 AD_PRES 인 사원의 부서코드
SET     dept_id = ( SELECT  department_id 
                    FROM  employees 
                    WHERE job_id = 'AD_PRES' )
WHERE   dept_id IS NULL; --부서배치받지않은

SELECT  *
FROM    emp;

05. employees 테이블의
301번 사원의 salary를 4000으로 first_name을 우치로 last_name을 전으로 변경저장
UPDATE  employees
SET   salary = 4000, first_name = '우치', last_name = '전'
WHERE employee_id = 301;

SELECT  *
FROM    employees
WHERE   employee_id = 301;

06. employees 테이블의
300번 부서에 속한 사원들의 salary를 5000으로 변경저장
UPDATE  employees
SET     salary = 5000
WHERE   department_id = 300;

SELECT  *
FROM    employees
WHERE   employee_id = 301;

07. employees 테이블에 새로운 사원정보 삽입저장
사번은 300, 급여는 60번 부서의 평균급여로 저장
employee_id, first_name, last_name, email, hire_date, job_id, salary
300, 길동, 홍, hong@naver.com, 오늘날짜, IT_PROG, 60번부서의 평균급여
INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_id, salary)
VALUES  (300, '길동','홍', 'hong@naver.com', SYSDATE, 'IT_PROG', 
         ( SELECT AVG(salary)
           FROM   employees
           WHERE  department_id = 60 ) );

SELECT  *
FROM    employees
WHERE   employee_id = 300;

08. employees 테이블의
300번 사원의 급여를 우리회사 최고급여로, 전화번호는 062.1234.5678 로 변경저장
UPDATE  employees
SET     salary = (SELECT  MAX(salary) FROM  employees ),
        phone_number = '062.1234.5678'
WHERE   employee_id = 300;

SELECT  *
FROM    employees
WHERE   employee_id = 300;    
    
실습
01. emp 테이블의 202 사원의 입사일자를 
오늘로부터 6개월 전 날짜로 변경
UPDATE emp
SET    hire_date = ( SELECT ADD_MONTHS(SYSDATE, -6) FROM dual )
WHERE  id = 202;

SELECT  *
FROM    emp
WHERE   id = 202;

02. emp 테이블의 200번 사원에 대해
employees 테이블의 60번 부서원들 중 가장 최근에 입사한 사원의 입사일자로 변경
UPDATE  emp
--SET     hire_date = (가장최근입사한 사원의 입사일자)
SET     hire_date = ( SELECT  MAX(hire_date) FROM employees WHERE department_id = 60 )
WHERE   id = 200;

SELECT  *
FROM    emp
WHERE   id = 200;
    
3. 데이터행 삭제 : DELETE -- 반드시 조건기술
DELETE FROM 테이블명
WHERE  조건절

01. employees 테이블에서 300번 사원코드를 삭제
DELETE  FROM employees
WHERE   employee_id = 300;
    
02. departments 테이블에서 300번 부서를 삭제하자
SELECT  *
FROM    departments
WHERE   department_id = 300; --PK
    
SELECT  *
FROM    employees
WHERE   department_id = 300; --FK
    
DELETE  FROM  departments
WHERE   department_id = 300;
--무결성 제약조건(HR.EMP_DEPT_FK)이 위배되었습니다- 자식 레코드가 발견되었습니다

※ 자식레코드 삭제 후 부모레코드 삭제
1. 자식레코드 삭제
DELETE  FROM  employees
WHERE   department_id = 300;

2. 부모레코드 삭제
DELETE  FROM  departments
WHERE   department_id = 300;

COMMIT;

03. emp테이블의 20번 부서의 정보를 삭제
DELETE  FROM  emp
WHERE   dept_id = 20;

SELECT  *
FROM    emp;

COMMIT;



9장. DDL(Data Definition Language) --Auto Commit
--Create, Alter, Drop, Truncate, Rename

1. 테이블 생성 --CREATE
CREATE  TABLE 테이블명 (
  컬럼명1 데이터타입(크기),
  컬럼명2 데이터타입(크기),
  ...
);

※ 데이터타입 종류 : 문자, 숫자, 날짜
- 문자 : CHAR, VARCHAR2
    CHAR(n) - 고정문자 : 지정된 크기만클 메모리 확보
      CHAR(10) : 메모리를 10바이트 확보한 후 저장
               : abcd를 저장한다면 abcd______
    VARCHAR(n) - 가변문자 : 데이터를 저장할 때 메모리 확보
      VARCHAR(10) : 저장할때 메모리 확보
                  : abcd
- 숫자 : NUMBER
    NUMBER(n) : 정수데이터
      NUMBER(8) - 99999999
    NUMBER(n,p) : 부동소수점데이터, 정수부 : n-p, 소수부 : p
      NUMBER(8,2) : 소수부 : 2, 정수부 : 8-2 -> 6
- 날짜 : DATE

CREATE TABLE  temp(
  id    NUMBER(4) PRIMARY KEY,
  name  VARCHAR2(30)
);

01. 삽입저장
INSERT INTO temp
VALUES  (100, '홍길동');

INSERT INTO temp
VALUES  (101, '이순신');

COMMIT;

SELECT  *
FROM    temp;

02. 변경저장
UPDATE  temp
SET     name = '홍명보'
WHERE   id = 101;

SELECT  *
FROM    temp;

2. 테이블구조변경 --ALTER

1) 컬럼 추가 --ADD
    ALTER TABLE 테이블명
    ADD ( 컬럼명1 데이터타입(크기), 컬럼명2 데이터타입(크기),... );

    temp테이블에 숫자 8자리를 담을 salary 컬럼 추가
    
    ALTER TABLE temp
    ADD (salary NUMBER(8)); --추가시 기본값은 NULL 값이 추가

    DESC temp;

    - 101번 id의 salary 를 3000으로 변경
    UPDATE  temp
    SET     salary = 3000
    WHERE   id = 101;
    
    SELECT  *
    FROM    temp
    WHERE   id = 101;

2) 데이터 타입 및 크기변경 --MODIFY
  ALTER TABLE 테이블명
  MODIFY (컬럼명 데이터타입(크기));

  temp 테이블의 salary 컬럼의 크기를 숫자 10으로 변경
  ALTER TABLE temp
  MODIFY (salary NUMBER(10));
  
  DESC  temp;

3) 컬럼 삭제  --DROP COLUMN
  ALTER TABLE 테이블명
  DROP COLUMN 컬럼명;
  
  temp 테이블의 salary 컬럼 삭제
  ALTER TABLE temp
  DROP COLUMN salary;

  DESC  temp;
  
4) 컬럼명 변경 --RENAME COLUMN
  ALTER TABLE 테이블명
  RENAME COLUMN 기존컬럼명 TO 새컬럼명
  
  temp 테이블의 id 컬럼명을 temp_id 로 변경
  ALTER TABLE temp
  RENAME COLUMN id TO temp_id;
  
  DESC  temp;
  
3. 테이블 삭제 -- DROP 
  DROP TABLE 테이블명;
  
  DROP TABLE temp;
  
--휴지통 확인
  SELECT  *
  FROM    RECYCLEBIN;
  
--복원
  FLASHBACK TABLE temp TO BEFORE DROP;
  
--휴지통 비우기
  PURGE RECYCLEBIN;
  
4. 데이터행 삭제 --TRUNCATE : 조건절 사용 불가
  TRUNCATE 테이블명; --구조만 남기고 데이터 행 모두 삭제
  

5. 테이블명 변경
  RENAME  기존테이블명 TO 새테이블명
  RENAME  temp TO test;

  SELECT  table_name
  FROM    user_tables;
  
  
  
  
  
  
  