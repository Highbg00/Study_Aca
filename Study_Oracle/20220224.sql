6.1 서브쿼리 ☞ 여러번의 쿼리를 수행해야만 얻을 수 있는 결과를 하나의 중첩된 SQL 문장으로 
               결과를 간편하게 얻을 수 있게 하기 위해
  : SQL 문장안에 존재하는 또 다른 SQL 문장
  : 서브쿼리는 괄호로 묶어 사용
  : 서브쿼리가 포함된 쿼리문을 메인쿼리라 한다.
  
  : 서브쿼리는 단일행 또는 복수행 비교 연산자와 함께 사용 가능
  : 서브쿼리에서는 ORDER BY 를 사용하지 못함
    ORDER BY 는 메인쿼리 문장의 마지막에 한번만 위치할 수 있음
  : 서브쿼리의 결과는 메인쿼리의 조건으로 사용
  : 메인쿼리가 서브쿼리를 포함하는 종속적인 관계
  : 서브쿼리는 연산자 오른쪽에 존재
  
※ 서브쿼리가 사용가능한곳
  SELECT  절
  FROM    절
  WHERE   절
  HAVING  절
  ORDER BY 절
  INSERT문의 VALUE절
  UPDATE문의 SET절
  
※ 서브쿼리의 위치에 따른 명칭
  ○ SELECT 절에 사용하는 서브쿼리 - 스칼라 서브쿼리, 스칼라 : 크기하나, 컬럼 표현 용도
  ○ FROM   절에 사용하는 서브쿼리 - 인라인뷰 서브쿼리, 테이블 대체 용도
           ORDER BY 절은 올 수 없음, 출력용도가 아닌 테이블을 대체하는 용도로 굳이 정렬할 필요 없음
           그룹함수는 반드시 ALIAS 사용함으로 하나의 컬럼으로 사용함
  ○ WHERE  절에 사용하는 서브쿼리 - 일반서브쿼리
    - 단일결과행 서브쿼리 : 서브쿼리 결과값이 하나
    - 다중결과행 서브쿼리 : 서브쿼리 결과값이 여러개
    - 다중컬럼   서브쿼리 : 서브쿼리 컬럼이 여러개
    
1. 단일결과행 서브쿼리 
01. 급여가 우리회사 평균급여보다 더 적은 급여를 받는 사원의
사번, 이름, 성, 급여정보 조회
SELECT  e.employee_id, e.first_name, e.last_name, e.salary
FROM    employees e
WHERE   e.salary < AVG(salary); --WHERE절에서는 그룹함수 사용불가 

우리회사 평균급여
SELECT  AVG(salary) avg_sal --6461.831775700934579439252336448598130841
FROM    employees;

SELECT  e.employee_id, e.first_name, e.last_name, e.salary --56
FROM    employees e
WHERE   e.salary < 6461.831775700934579439252336448598130841; --WHERE절에서는 그룹함수 사용불가 
--상수대신 무언가의 결과를 재사용하고 싶을때 서브쿼리 사용

SELECT  e.employee_id, e.first_name, e.last_name, e.salary --56
FROM    employees e
--WHERE   e.salary < (우리회사평균급여);
WHERE   e.salary < ( SELECT AVG(salary) 
                     FROM   employees );
 
02. 우리회사 평균 급여보다 더 많게 받는 사원의
사번, 성, 업무코드, 급여 조회
SELECT  e.employee_id, e.last_name, e.job_id, e.salary --51
FROM    employees e
WHERE   e.salary > ( SELECT AVG(salary)
                     FROM   employees );

03. 우리회사에서 가장 많은 급여를 받는 사원의
사번, 성, 급여 조회
SELECT  e.employee_id, e.last_name, e.salary
FROM    employees e
--WHERE   e.salary = ( 우리회사최대급여 )
WHERE   e.salary = ( SELECT MAX(salary)
                     FROM   employees );

04. 사번 150번 보다 더 많은 급여를 받는 사원들의
사번, 성, 부서코드, 업무코드, 급여 조회
SELECT  e.employee_id, e.last_name, e.department_id, e.job_id, e.salary --15
FROM    employees e
--WHERE   e.salary > ( 150번 사원의 급여 )
WHERE   e.salary > ( SELECT salary 
                     FROM   employees
                     WHERE  employee_id = 150 );

05. 월급여가 가장 많은 사원의
사번, 성, 부서코드, 업무제목 조회
SELECT  e.employee_id, e.last_name, e.department_id, j.job_title
FROM    employees e, jobs j
WHERE   e.job_id = j.job_id
--AND     e.salary = (최대급여);
AND     e.salary = ( SELECT MAX(salary)
                     FROM   employees );

06. 사원들의 급여가 우리회사 평균급여 이상 최대급여 이하에 해당하는 사원들의
사번, 성, 부서코드, 급여 조회
SELECT  e.employee_id, e.last_name, e.department_id, e.salary
FROM    employees e
--WHERE   e.salary BETWEEN (평균급여) AND (최대급여);
WHERE   e.salary BETWEEN ( SELECT AVG(salary) FROM employees ) 
                 AND     ( SELECT MAX(salary) FROM employees );


2. 다중결과행 서브쿼리 
  : 연산자 - IN, NOT IN
  : 비교의 대상이 두개 이상은 대소비교 불가, 그래서, IN, NOT IN 연산자 사용
  : 서브쿼리 결과가 여러개일 경우, 대소비교 불가
  : WHERE 절에서는 그룹함수 사용 불가
  : WHERE 절 안의 서브쿼리에서는 그룹함수 사용 가능
--      WHERE   e.salary = ( SELECT MAX(salary) FROM employees ) 

01. 부서의 위치코드가 1700인 부서에 속한 사원들의
사번, 성, 부서코드, 업무코드 조회
일반쿼리
SELECT  e.employee_id, e.last_name, e.department_id, e.job_id --18
FROM    employees e, departments d
WHERE   e.department_id = d.department_id(+)
AND     d.location_id = 1700;

서브쿼리
SELECT  e.employee_id, e.last_name, e.department_id, e.job_id --18
FROM    employees e
--WHERE   e.department_id = ( 부서의 위치코드가 1700인 부서 )
--WHERE   e.department_id IN ( 10, 30, 90, 100, 110, 120, 130, 140, 150, 160, 170, 180, 190, 200, 210, 220, 230, 240, 250, 260, 270 )
WHERE   e.department_id IN ( SELECT  department_id
                             FROM    departments
                             WHERE   location_id = 1700 );


02. 우리회사에서 mgr 업무에 종사하는 사원들과 같은 부서에 속한 사원들의
사번, 성, 업무코드, 부서코드 조회
서브쿼리
SELECT  e.employee_id, e.last_name, e.job_id, e.department_id
FROM    employees e
--WHERE   e.department_id = ( mgr 업무에 종사하는 사원들과 같은 부서 )
WHERE   e.department_id IN ( SELECT  department_id
                             FROM    employees
                             WHERE   LOWER(job_id) LIKE '%mgr%' );

03. 각 부서의 최소급여가 40번 부서의 최소급여보다 더 많이 받는 부서의
부서코드, 최소급여
SELECT  e.department_id, MIN(e.salary) 최소급여
FROM    employees e
--WHERE   
GROUP BY e.department_id --각 부서별
--HAVING  MIN(salary) > ( 40번 부서의 최소급여 ) 
HAVING  MIN(salary) > ( SELECT  MIN(salary)
                        FROM    employees
                        WHERE   department_id = 40 ) 
ORDER BY 1;

04. 근무지의 국가코드가 UK(country_id 가 UK) 인 위치(코드)에 있는 
부서코드, 위치코드, 부서명 조회
일반쿼리
SELECT  d.department_id, d.location_id, d.department_name --2
FROM    departments d, locations l
WHERE   d.location_id = l.location_id
AND     LOWER(l.country_id) LIKE '%uk%';

서브쿼리
SELECT  d.department_id, d.location_id, d.department_name --2
FROM    departments d
--WHERE   d.location_id IN ( 근무지의 국가코드가 UK(country_id 가 UK) 인 위치(코드) )
WHERE   d.location_id IN ( SELECT location_id
                           FROM   locations
                           WHERE  LOWER(country_id) LIKE '%uk%' );
                           
--------------------------------------------------------------------------------
성에 대소문자 무관하게 z 가 포함된 성을 가진 사원들의
사번, 성, 부서코드, 업무코드 조회
SELECT  e.employee_id, e.last_name, e.department_id, e.job_id --5
FROM    employees e
WHERE   LOWER(e.last_name) LIKE '%z%';
--------------------------------------------------------------------------------
05. 성에 대소문자 무관하게 z 가 포함된 성을 가진 사원들과 같은 부서에 속한 사원들의
사번, 성, 부서코드, 업무코드 조회
SELECT  e.employee_id, e.last_name, e.department_id, e.job_id --41
FROM    employees e
--WHERE   e.department_id IN ( 성에 대소문자 무관하게 z 가 포함된 성을 가진 사원들의 부서 )
WHERE   e.department_id IN ( SELECT department_id
                             FROM   employees
                             WHERE  LOWER(last_name) LIKE '%z%' );
--------------------------------------------------------------------------------
















































    
    
    
    
    
    
    
    
    
    
   