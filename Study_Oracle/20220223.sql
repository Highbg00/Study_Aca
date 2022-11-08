5.6 ANSI JOIN
  : 모든 DBMS에서 공통적으로 사용할 수 있는 국제 표준 JOIN 형식이다.
  
1. INNER JOIN (오라클의 EQUI 조인), 교집합

--------------------------------------------------------------------------------
오라클 조인                          | ANSI 조인
--------------------------------------------------------------------------------
5. SELECT  컬럼명1, 컬럼명2          | SELECT  컬럼명1, 컬럼명2
1. FROM    테이블명1, 테이블명2      | FROM    테이블명1 INNER JOIN 테이블명2
2. WHERE   조인조건식                | ON      조인조건식
                                     | (또는)  
                                     | USING   (조인컬럼명만)
   AND      추가일반조건식           | WHERE   일반조건식 
3. GROUP BY  그룹지울항목            | GROUP BY
4. HAVING    그룹함수조건식          | HAVING
6. ORDER BY  정렬시킬항목            | ORDER BY
--------------------------------------------------------------------------------
☞ 조인조건식
ON    절 : 조인조건식(테이블명.컬럼명 = 테이블명.컬럼명)
           조인하는 컬럼명이 동일하면 반드시 테이블명을 명시해야한다.
USING 절 : (조인컬럼명만) ☜ 괄호안에 컬럼명만 명시
           조인하는 컬럼명이 동일한 경우에만 사용 가능
           USING 절에 테이블명은 절대로 명시해서는 안된다.

01. 부서코드가 60번인 사원의 사번, 성, 부서코드, 부서명 조회
오라클 조인
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name
FROM    employees e, departments d
WHERE   e.department_id = d.department_id
AND     e.department_id = 60;

ANSI JOIN ON
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name
FROM    employees e INNER JOIN departments d
ON      e.department_id = d.department_id
WHERE   e.department_id = 60;

ANSI JOIN USING
SELECT  e.employee_id, e.last_name, department_id, d.department_name
FROM    employees e INNER JOIN departments d
USING   (department_id)
WHERE   department_id = 60;

02. 사번, 성, 업무코드, 업무제목 조회
오라클 조인
SELECT  e.employee_id, e.last_name, e.job_id, j.job_title
FROM    employees e, jobs j
WHERE   e.job_id = j.job_id;

ANSI JOIN ON
SELECT  e.employee_id, e.last_name, e.job_id, j.job_title
FROM    employees e INNER JOIN jobs j
ON      e.job_id = j.job_id;

ANSI JOIN USING
SELECT  e.employee_id, e.last_name, job_id, j.job_title
FROM    employees e INNER JOIN jobs j
USING   (job_id);

03. 업무코드가 clerk 종류 업무형태를 하는 사번, 성 업무코드, 업무제목 조회
오라클 조인

ANSI JOIN ON

ANSI JOIN USING


04. 부서코드, 부서명, 위치코드, 도시 조회
오라클 조인
SELECT  d.department_id, d.department_name, d.location_id, l.city
FROM    departments d, locations l
WHERE   d.location_id = l.location_id;

ANSI JOIN ON
SELECT  d.department_id, d.department_name, d.location_id, l.city
FROM    departments d INNER JOIN locations l
ON      d.location_id = l.location_id;

ANSI JOIN USING
SELECT  d.department_id, d.department_name, location_id, l.city
FROM    departments d INNER JOIN locations l
USING   (location_id);

05. 매니저의 부서가 60 이상인 부서에 속한 사원들의
사번, 성, 매니저사번, 매니저성 조회
오라클 조인
SELECT  e.employee_id, e.last_name, e.manager_id, m.last_name
FROM    employees e, employees m
WHERE   e.manager_id = m.employee_id
AND     m.department_id >= 60;

ANSI JOIN ON
SELECT  e.employee_id, e.last_name, e.manager_id, m.last_name
FROM    employees e INNER JOIN employees m
ON      e.manager_id = m.employee_id
WHERE   m.department_id >= 60;

ANSI JOIN USING --XXX

--------------------------------------------------------------------------------
조인에 사용되는 테이블이 3개 이상일 경우
첫번째 조인의 결과에 두번째 조인을 추가하는 형태로 조인형식을 사용한다.
--------------------------------------------------------------------------------

06. 부서코드 10, 20, 40, 60 인 부서에 속한 사원들의
사번, 성, 부서코드, 부서명, 업무코드, 업무제목 조회
오라클 조인
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name, e.job_id, j.job_title
FROM    employees e, departments d, jobs j
WHERE   e.department_id = d.department_id
AND     e.job_id = j.job_id
AND     e.department_id IN (10,20,40,60);

ANSI JOIN ON
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name, e.job_id, j.job_title
FROM    employees e INNER JOIN departments d
ON      e.department_id = d.department_id
INNER JOIN jobs j
ON      e.job_id = j.job_id
WHERE   e.department_id IN (10,20,40,60);

ANSI JOIN USING
SELECT  e.employee_id, e.last_name, department_id, d.department_name, job_id, j.job_title
FROM    employees e INNER JOIN departments d
USING   (department_id)
INNER JOIN jobs j
USING   (job_id)
WHERE   department_id IN (10,20,40,60);

2. OUTER JOIN : 오라클에서 기호 (+)를 사용, 합집합

01. 모든 사원들의 사번, 성, 부서코드, 부서명 조회
오라클 조인
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name
FROM    employees e, departments d
WHERE   e.department_id = d.department_id(+);

SELECT  COUNT(*) cnt --1
FROM    employees
WHERE   department_id IS NULL;

ANSI JOIN ON
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name
FROM    employees e LEFT OUTER JOIN departments d
ON      e.department_id = d.department_id;

ANSI JOIN USING
SELECT  e.employee_id, e.last_name, department_id, d.department_name
FROM    employees e LEFT OUTER JOIN departments d
USING   (department_id);

02. 모든 사원들의 사번, 성, 부서코드, 부서명, 도시 조회
오라클 조인
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name, l.city
FROM    employees e, departments d, locations l
WHERE   e.department_id = d.department_id(+)
AND     d.location_id = l.location_id(+);

ANSI JOIN ON
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name, l.city
FROM    employees e LEFT OUTER JOIN departments d
ON      e.department_id = d.department_id
LEFT OUTER JOIN locations l
ON      d.location_id = l.location_id;

ANSI JOIN USING
SELECT  e.employee_id, e.last_name, department_id, d.department_name, l.city
FROM    employees e LEFT OUTER JOIN departments d
USING   (department_id)
LEFT OUTER JOIN locations l
USING   (location_id);

03. 모든 사원들의 사번, 성, 매니저사번, 매니저성 조회
오라클 조인
SELECT  e.employee_id, e.last_name, e.manager_id, m.last_name
FROM    employees e, employees m
WHERE   e.manager_id = m.employee_id(+);

ANSI JOIN ON
SELECT  e.employee_id, e.last_name, e.manager_id, m.last_name
FROM    employees e LEFT OUTER JOIN employees m
ON      e.manager_id = m.employee_id;

ANSI JOIN USING --XXX

























































































































































