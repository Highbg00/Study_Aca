3. 다중 컬럼 서브쿼리
  : 서브쿼리의 결과 컬럼이 여러개인 경우,
  : 조건의 결과값을 기준으로 컬럼이 여러개
  : 다중컬럼을 pair(쌍) 형태로 비교

01. 부서별로 가장 많은 급여를 받는 사원의
부서코드, 최대급여 조회
SELECT  e.department_id, MAX(salary) 최대급여 --12
FROM    employees e
GROUP BY e.department_id
ORDER BY 1;

02. 부서별로 가장 많은 급여를 받는 사원의
부서코드, 최대급여, 이름 조회
SELECT  e.department_id 부서코드, MAX(salary) 최대급여, e.first_name 이름 --XXX
FROM    employees e
GROUP BY e.department_id, e.first_name
ORDER BY 1;

다중컬럼 서브쿼리
SELECT  e.department_id 부서코드, e.salary 최대급여, e.first_name 이름 --OOO
FROM    employees e
--WHERE   (e.department_id, e.salary) IN (부서별최대급여)
WHERE   (e.department_id, e.salary) IN ( SELECT  department_id, MAX(salary)
                                         FROM    employees
                                         GROUP BY department_id )
ORDER BY 1;

03. 부서별로 가장 많은 급여를 받는 사원의
사번, 성, 부서코드, 최대급여, 업무코드 조회

부서별 최대급여
SELECT  department_id, MAX(salary)
FROM    employees
GROUP BY department_id;

다중컬럼서브쿼리
SELECT  e.employee_id, e.last_name, e.department_id, e.salary, e.job_id
FROM    employees e
--WHERE   (e.department_id, e.salary) IN ( 부서별최대급여 );
WHERE   (e.department_id, e.salary) IN ( SELECT department_id, MAX(salary)
                                         FROM   employees
                                         GROUP BY department_id );


04. 각 부서별로 가장 최근에 입사한 사원들의
사번, 성, 부서코드, 가장최근입사일자조회

부서별 가장최근입사일자
SELECT  department_id, MAX(hire_date)   
FROM    employees
GROUP BY department_id

다중컬럼서브쿼리
SELECT  e.employee_id, e.last_name, e.department_id, hire_date
FROM    employees e
--WHERE   (e.department_id, e.hire_date) IN (부서별 가장최근입사일자)
WHERE   (e.department_id, e.hire_date) IN ( SELECT  department_id, MAX(hire_date)   
                                            FROM    employees
                                            GROUP BY department_id );

4. 상호연관서브쿼리 : 메인쿼리의 컬럼이 서브쿼리의 조건절에 사용되는 형태
  : 메인쿼리의 값을 서브쿼리에 주고, 서브쿼리의 결과값을 받아서 메인쿼리로 반환해서 수행하는 쿼리
  : 메인쿼리의 컬럼이 서브쿼리의 조건절에 사용되어 메인쿼리에 독립적이지 않은 형식
  : 메인 테이블과 서브쿼리 테이블 간의 JOIN 조건이 사용됨
  : 메인쿼리와 서브쿼리가 계속 주고 받는 다는 의미
  : 스칼라 서브쿼리에서 다룰 예정
  
5. 스칼라 서브쿼리 : SELECT 절에서 사용, 단일결과행, 단일컬럼만 조회가능
  : 단순한 그룹함수의 결과를 SELECT 절에서 조회하고자 할 경우
  : SELECT 절에 서브쿼리를 사용하여 하나의 컬럼으로 사용하기 위한 목적(컬럼표현용도)
  : 조인 조건식이 필요할때는 스칼라 서브쿼리 안에서 WHERE 조건식 사용

1) 단순한 그룹함수의 결과를 SELECT 절에서 조회하고자 할 경우

01. 모든 사원의 사번, 성, 급여, 회사평균급여, 회사최대급여 조회
SELECT  e.employee_id, e.last_name, e.salary, ROUND(AVG(salary)) avg_sal, MAX(salary) max_sal --XXX
FROM    employees e
GROUP BY e.employee_id, e.last_name, e.salary
ORDER BY e.employee_id;

우리회사 평균급여
SELECT  ROUND(AVG(salary)) --6462
FROM    employees;

우리회사 최대급여
SELECT  MAX(salary) --24000
FROM    employees;

SELECT  e.employee_id, e.last_name, e.salary, 
        ( SELECT ROUND(AVG(salary)) FROM employees ) avg_sal, 
        ( SELECT MAX(salary) FROM employees ) max_sal
FROM    employees e;

2) 코드성 테이블에서 코드명(즉, 데이터 컬럼명)을 SELECT 절에서 조회하고자 할경우
: 상호연관서브쿼리

01. 모든 사원의 사번, 성, 부서코드, 부서명 조회
일반쿼리
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name
FROM    employees e, departments d
WHERE   e.department_id = d.department_id(+);

스칼라서브쿼리
SELECT  e.employee_id, e.last_name, e.department_id, 
        ( SELECT  department_name
          FROM    departments 
          WHERE   department_id = e.department_id ) department_name
FROM    employees e;

6. FROM 절에 사용하는 인라인 뷰 서브쿼리
SELECT 절의 결과를 FROM 절에서 하나의 테이블처럼 사용(테이블 대체용도)
FROM 절에서 사용하는 인라인뷰 서브쿼리에서 그룹함수는 반드시 ALIAS 지정해야 함
메인쿼리에서 ALIAS 명을 컬럼명으로 사용하기 위해

01. 우리회사 최대급여, 최소급여, 평균급여 조회
SELECT  MAX(salary) max_sal,
        MIN(salary) min_sal,
        ROUND(AVG(salary)) avg_sal
FROM    employees;

02. 사번, 성, 급여, 최대급여, 최소급여, 평균급여를 조회
스칼라서브쿼리
SELECT  employee_id, last_name, salary,
        (SELECT MAX(salary) FROM employees) max_sal,
        (SELECT MIN(salary) FROM employees) min_sal,
        (SELECT ROUND(AVG(salary)) FROM employees) avg_sal
FROM    employees;

인라인뷰서브쿼리
SELECT  e.employee_id, e.last_name, e.salary, max_sal, min_sal, avg_sal
FROM    employees e, ( SELECT MAX(salary) max_sal, 
                              MIN(salary) min_sal, 
                              ROUND(AVG(salary)) avg_sal 
                       FROM employees );

03. 급여가 회사평균이상 최대급여 이하에 해당하는 사원들의
사번, 성, 급여, 우리회사최대급여, 우리회사최소급여, 우리회사평균급여 조회
스칼라서브쿼리
SELECT  employee_id, last_name, salary, 
        ( SELECT MAX(salary) FROM employees ) 우리회사최대급여, 
        ( SELECT MIN(salary) FROM employees ) 우리회사최소급여, 
        ( SELECT ROUND(AVG(salary)) FROM employees ) 우리회사평균급여
FROM    employees
--WHERE   salary BETWEEN 회사평균급여 AND 회사최대급여
WHERE   salary BETWEEN ( SELECT ROUND(AVG(salary)) FROM employees ) 
               AND     ( SELECT MAX(salary) FROM employees );

인라인뷰서브쿼리
SELECT  employee_id, last_name, salary, max_sal, min_sal, avg_sal
FROM    employees, ( SELECT MAX(salary) max_sal,
                            MIN(salary) min_sal,
                            ROUND(AVG(salary)) avg_sal
                     FROM   employees )
WHERE   salary BETWEEN avg_sal AND max_sal;

04. 각 부서별로 가장 많은 급여를 받는 사원의
사번, 성, 부서코드, 급여 조회
다중컬럼 서브쿼리
SELECT  e.employee_id, e.last_name, e.department_id, e.salary
FROM    employees e
WHERE   (e.department_id, e.salary) IN (SELECT  department_id, MAX(salary)
                                        FROM    employees
                                        GROUP BY department_id)
ORDER BY 3;

인라인뷰서브쿼리
SELECT  e.employee_id, e.last_name, e.department_id, e.salary
FROM    employees e, ( SELECT department_id, MAX(salary) max_sal
                       FROM   employees 
                       GROUP BY department_id ) m
WHERE   NVL(e.department_id,0) = NVL(m.department_id,0)
AND     e.salary = m.max_sal
ORDER BY 3;

05. 사번, 성, 부서코드, 급여, 각부서별 부서원수, 부서최대급여, 부서최소급여, 부서평균급여 조회
SELECT  e.employee_id, e.last_name, e.department_id, e.salary, 
        m.cnt, m.max_sal, m.min_sal, m.avg_sal
FROM    employees e, ( SELECT department_id, COUNT(*) cnt, MAX(salary) max_sal, MIN(salary) min_sal, ROUND(AVG(salary)) avg_sal
                       FROM   employees
                       GROUP BY department_id ) m
WHERE   NVL(e.department_id,0) = NVL(m.department_id,0);

7. 데이터 행 조회
  : ROWNUM - 테이블에 존재하지 않는 컬럼은 아니지만 사용할 수 있는 가짜 컬럼(PSEUDO COLUMN),
           - SELECT 및 WHERE 절에서 사용
           - 쿼리문의 결과(조회 후, 즉 SELECT 절의 결과)로 나온 각 행에 대한 순서값
           - 서브쿼리에서 먼저 정렬 한 후 메인쿼리에서 순번 매기기(ROWNUM)
           - ROWNUM과 인라인뷰의 특성을 이용하여 페이징 처리 등의 작업을 수행

우리회사 사원들의 
사번, 성, 급여 조회
SELECT  ROWNUM, employee_id, last_name, salary
FROM    employees;

우리회사 사원들의 대해 급여를 많이 받는 순으로 정렬하여
사번, 성, 급여 조회 --조회후 내림차순
SELECT  ROWNUM, employee_id, last_name, salary --2. 컬럼조회
FROM    employees --1. 테이블 조회 후
ORDER BY salary DESC; --3. salary로 내림차순

우리회사 사원들 사번순으로 조회하여 10번까지
사번, 성, 급여 조회
SELECT  ROWNUM, employee_id, last_name, salary --2. 컬럼조회
FROM    employees --1. 테이블 조회 후
WHERE   ROWNUM <= 10 --2. 10개 까지
ORDER BY salary DESC;

인라인뷰를 사용하여 
급여 상위 10명에 대해
사번, 성, 급여 조회
--SELECT  ROWNUM, e.employee_id, e.last_name, e.salary
SELECT  ROWNUM, e.*
FROM    ( SELECT  employee_id, last_name, salary 
          FROM    employees
          ORDER BY salary DESC ) e
WHERE   ROWNUM <= 10;

인라인뷰를 사용하여 
급여 하위 10명에 대해
사번, 성, 급여 조회

SELECT  ROWNUM, e.*
FROM    ( SELECT  employee_id, last_name, salary
          FROM    employees
          ORDER BY salary ) e
WHERE   ROWNUM <= 10;

8. 순위 함수 
  : RANK() OVER(순위결정기준)       : 1,2,2,4 
  : DENSE_RANK() OVER(순위결정기준) : 1,2,2,3,3,4

입사일자 기준으로 10위까지 등수구하기
순위, 사번, 성, 입사일자 조회
SELECT  e.*
FROM    ( SELECT  RANK() OVER(ORDER BY hire_date) rank,
                  employee_id, last_name, hire_date
          FROM    employees
          ORDER BY hire_date ASC ) e
WHERE   e.rank <= 10;

SELECT  e.*
FROM    ( SELECT  DENSE_RANK() OVER(ORDER BY hire_date) rank,
                  employee_id, last_name, hire_date
          FROM    employees
          ORDER BY hire_date ASC ) e
WHERE   e.rank <= 10;












































    
    
    
    
    
    
    
    
    
    
   