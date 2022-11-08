3. NON_EQUI JOIN
  : 비교연산자(<=, >=, <, >), 범위연산자(BETWEEN), IN 연산자 등의
    동등비교연산자(=) 이외의 연산자를 사용하는 JOIN 형식이다.
    JOIN 하는 컬럼이 일치하지 않게 사용한는 JOIN 조건으로 거의 사용하지 않는다.

employees, jobs 테이블을 이용하여
employees 테이블의 급여가 jobs 테이블의 최고급여(max_salary)/최저급여(min_salary) 범위 내에 있는
50번 부서원의 사번, 이름, 급여, 업무제목을 조회한다.
SELECT  e.employee_id, e.first_name, e.salary, j.job_title --45
FROM    employees e, jobs j
WHERE   e.job_id = j.job_id
AND     e.salary BETWEEN j.min_salary AND j.max_salary
AND     e.department_id = 50;

4. OUTER JOIN : NULL 값이 생략되는 정보도 포함해서 표시하기 위한 조인, 합집합
   EQUI JOIN 은 조인조건에 동등비교연산자(=)로 비교한 형태,
   즉, 테이블들 간에 공통적으로 만족되는 값을 가진 경우의 결과를 반환
   
하지만, OUTER JOIN 은 만족되는 값이 없는 경우의 결과까지 반환
만족되는 값이 없는 테이블 컬럼에 (+) 기호를 표시한다.
즉, 데이터행의 누락이 발생되지 않도록 하기 위한 조인 기법
: 조인 조건식에서 (+) 기호를 데이터 행이 부족한 조인 조건쪽에 붙여준다.

--------------------------------------------------------------------------------
employees         departments                 locations
사번 부서코드     부서코드 부서명  위치코드   위치코드 부서위치
100  10           10       영업부  1600       1600     Seattle
101  20           20       총무부  1700       1700     Paris 
178  NULL         NULL     NULL    NULL       NULL     NULL
--------------------------------------------------------------------------------

01. 모든 사원의 사번, 성, 부서코드, 부서명 조회
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name --106
FROM    employees e, departments d
WHERE   e.department_id = d.department_id(+)
-- e.department_id 에는 NULL 이 존재, d.department_id 는 PK 이므로 NULL 에 대한 만족되는 값이 존재하지 않음
ORDER BY 1;

employees테이블의 department_id 가 NULL이 존재 하므로 NULL 갯수 세어보기
SELECT  COUNT(*) cnt --1
FROM    employees
WHERE   department_id IS NULL;

employees   테이블에는   부서배치 받지 않은 사원 데이터 행이 있고(즉, department_id 에 NULL 존재)
departments 테이블에서는 부서코드 NULL 에 대한 데이터 행이 없으므로(즉, PK는 NULL 에 대한 만족되는 값이 존재하지 않음)
--                                ￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣
만족되는 데이터가 없을 수도 있는 쪽의 JOIN 컬럼에 (+) 를 추가(즉, PK에 (+)를 추가)
--       ￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣               
departments 테이블의 department_id 쪽에 OUTER 기호(+)를 붙인다.

OUTER JOIN  ☞ LEFT/RIGHT OUTER JOIN : 기준이 되는 테이블 방향으로 조인한다.
LEFT  OUTER JOIN : 왼  쪽 테이블 기준으로 NULL 포함하여 모두 출력(등호의 오른쪽에 (+) 가 붙음)
RIGHT OUTER JOIN : 오른쪽 테이블 기준으로 NULL 포함하여 모두 출력(등호의 왼  쪽에 (+) 가 붙음)

02. 모든 사원의 사번, 성, 업무코드, 업무제목 조회 --107
SELECT  e.employee_id, e.last_name, e.job_id, j.job_title
FROM    employees e, jobs j
WHERE   e.job_id = j.job_id(+);

NULL갯수 확인
SELECT  COUNT(*) cnt
FROM    employees
WHERE   job_id IS NULL;

03. 모든 사원의 사번, 성, 부서명, 업무제목 조회
SELECT  e.employee_id, e.last_name, d.department_name, j.job_title
FROM    employees e, departments d, jobs j
WHERE   e.department_id = d.department_id(+)
AND     e.job_id = j.job_id;

NULL갯수 파악
SELECT  COUNT(*) cnt --1
FROM    employees
WHERE   department_id IS NULL;

SELECT  COUNT(*) cnt --0
FROM    employees
WHERE   job_id IS NULL;

04. 모든 사원의 사번, 성, 부서코드, 부서명, 위치코드, 도시 조회
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name, d.location_id, l.city
FROM    employees e, departments d, locations l
WHERE   e.department_id = d.department_id(+)
AND     d.location_id = l.location_id(+);

e.department NULL갯수
SELECT  COUNT(*) cnt --1
FROM    employees
WHERE   department_id IS NULL;

d.location_id NULL갯수
SELECT  COUNT(*) cnt --0
FROM    departments
WHERE   location_id IS NULL;

05. 모든 사원의 사번, 성, 부서코드, 부서명, 업무코드, 업무제목 조회
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name, e.job_id, j.job_title
FROM    employees e, departments d, jobs j
WHERE   e.department_id = d.department_id(+)
--AND     e.job_id = j.job_id(+);
AND     e.job_id = j.job_id;


5. SELF JOIN
  : 하나의 테이블을 두번 명시하여 동일한 테이블 2개로 부터 JOIN 을 통해
    데이터를 조회하여 결과를 반환, 즉, 한 테이블 내에서 두 데이터 컬럼이 연관관계가 있다.
    
employees 테이블는 사원정보, 관리자정보도 있다
동일한 테이블을 여러개 준비하여 테이블 조인을 하는 것을 SELF 조인이라 한다.

01. 모든 사원의 사번, 이름, 매니저사번, 매니저이름 조회
SELECT  e.employee_id 사번, e.first_name 이름, e.manager_id 매니저사번, m.first_name 매니저이름
FROM    employees e, employees m
WHERE   e.manager_id = m.employee_id(+)
ORDER BY 1;




























































































































































