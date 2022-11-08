5. 조인 
  : 하나의 테이블로부터 데이터를 조회할 수 없는 경우
    여러개의 테이블로 부터 데이터를 조회하여
    합쳐진 테이블의 데이터를 조회하기 위해
    
departments 테이블
SELECT * FROM departments; --27

employees 테이블
SELECT * FROM employees; --107

jobs 테이블
SELECT * FROM jobs; --19

1. CARTESIAN PRODUCT
  : WHERE 절에 조인 조건식을 기술하지 않아 잘못된 데이터행의 결과를 갖게 되는 현상
  : CROSS 조인이라고도 한다.

사번, 성, 부서명 조회
사번, 성 : employees
부서명   : departments
SELECT  employee_id, last_name, department_name --2,889
FROM    employees, departments;

SELECT  107*27 --2889
FROM    dual;

2. EQUI JOIN(ANSI 에서는 INNER JOIN, 교집합)
  : WHERE 절에 동등연산자(=)를 사용하는 JOIN 형식이다.
    즉, 테이블들간에 공통으로 만족되는 값을 가진 경우의 결과를 반환

※ 조인조건식 ☞ 컬럼의 값이 같은 컬럼에 대해 조인조건식 설정
  (테이블명.컬럼명 = 테이블명.컬럼명)
  
※ 테이블 조인 순서
1. FROM 절에 테이블 목록을 나열하며, 테이블명에 ALIAS 를 지정한다.
   (코드 라인을 줄이고 가독성을 높이기 위해)
2. 조인조건을 WHERE 절에 작성한다.

01. employees, departments 테이블을 이용하여
사번, 성, 부서명 정보를 조회
SELECT  e.employee_id, e.last_name, d.department_name
FROM    employees e, departments d
WHERE   e.department_id = d.department_id;
--WHERE   FK = PK

02. 사원들의 사번, 성, 부서코드, 부서명 조회
SELECT  e.employee_id 사번, e.last_name 이름, d.department_id 부서코드, d.department_name 부서명
FROM    employees e, departments d
WHERE   e.department_id = d.department_id
ORDER BY 이름;

해석순서    내용              ALIAS
                              사용가능여부
5. SELECT  컬럼명1, 컬럼명2   O
1. FROM    테이블명           O
2. WHERE   조건절             X 
3. GROUP BY 그룹지을항목      X
4. HAVING  조건절             X 
6. ORDER BY 정렬시킬항목      O

03. 사번, 성, 업무코드, 업무제목 조회
SELECT  e.employee_id, e.last_name, e.job_id, j.job_title
FROM    employees e, jobs j
WHERE   e.job_id = j.job_id;

04. 사번, 성, 부서명, 업무제목 조회
SELECT  e.employee_id, e.last_name, d.department_name, j.job_title
FROM    employees e, departments d, jobs j --조인조건은 테이블갯수-1 만큼 필요
WHERE   e.department_id = d.department_id
AND     e.job_id        = j.job_id;

05. 사번, 성, 부서코드, 부서명, 업무코드, 업무제목 조회
SELECT  employee_id, last_name, d.department_id, department_name, j.job_id, job_title
FROM    employees e, departments d, jobs j
WHERE   e.department_id = d.department_id
AND     e.job_id = j.job_id;

06. 매니저가 없는 사원의 사번, 이름, 업무제목 조회
SELECT  e.employee_id, e.last_name, j.job_title
FROM    employees e, jobs j
WHERE   e.job_id = j.job_id
AND     e.manager_id IS NULL;






















































































































