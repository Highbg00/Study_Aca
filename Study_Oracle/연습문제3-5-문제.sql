--보너스는 
--부서코드가  10~30 이면 급여의 10%
--            40~60 이면 급여의 20%
--           70~100 이면 급여의 30%
--           그외 부서원은 급여의 5%
--
--사번, 성, 부서코드, 급여, 보너스 조회
범위 비교 : CASE ~ END
SELECT  employee_id 사번, last_name 성, department_id 부서코드, salary 급여, 
        CASE
          WHEN department_id BETWEEN 10 AND 30 THEN salary * 0.1 --컴마없음
          WHEN department_id BETWEEN 40 AND 60 THEN salary * 0.2 --컴마없음
          WHEN department_id BETWEEN 70 AND 100 THEN salary * 0.3 --컴마없음
          ELSE salary * 0.05
        END 보너스, hire_date
FROM    employees;

-----------------------------------------------------------------------------------------------
--보너스는 
--부서코드가 20이하 이면           급여의 30%
--급여가 10000 이상이면            급여의 20%
--업무코드가 clerk 종류의 업무이면 급여의 10% 
--그외는                           급여의 5%
--
--사번, 이름, 성, 부서코드, 급여, 업무코드, 보너스 조회
범위 비교
SELECT  employee_id 사번, first_name 이름, last_name 성, department_id 부서코드, salary 급여, job_id 업무코드, 
        CASE 
          WHEN department_id <= 20 THEN salary * 0.3
          WHEN salary >= 10000 THEN salary * 0.2
          WHEN LOWER(job_id) LIKE '%clerk%' THEN salary * 0.1
          ELSE salary * 0.05
        END 보너스
FROM    employees;

-----------------------------------------------------------------------------------------------
--[연습문제 3-5]
--1. 사원들의 사번, 이름, 업무코드, 업무등급 조회
--업무등급은 업무코드에 따라 분류한다.
--DECODE 와 CASE~END 사용하여 조회
--
--업무코드    업무등급
--AD_PRES      A
--ST_MAN       B
--IT_PROG      C
--SA_REP       D
--ST_CLERK     E
--그 외        X

SELECT  employee_id 사번, first_name 이름, job_id 업무코드, 
        DECODE(job_id, 'AD_PRES', 'A',
                       'ST_MAN' , 'B', 
                       'IT_PROG', 'C',
                       'SA_REP' , 'D',
                       'ST_CLERK','E', 'X') 업무등급
FROM    employees;

SELECT  employee_id 사번, first_name 이름, job_id 업무코드, 
        CASE job_id
          WHEN 'AD_PRES'  THEN 'A'
          WHEN 'ST_MAN'   THEN 'B'
          WHEN 'IT_PROG'  THEN 'C'
          WHEN 'SA_REP'   THEN 'D'
          WHEN 'ST_CLERK' THEN 'E' 
          ELSE 'X'
        END   업무등급
FROM    employees;

SELECT  employee_id 사번, first_name 이름, job_id 업무코드, 
        CASE 
          WHEN job_id = 'AD_PRES'  THEN 'A'
          WHEN job_id = 'ST_MAN'   THEN 'B'
          WHEN job_id = 'IT_PROG'  THEN 'C'
          WHEN job_id = 'SA_REP'   THEN 'D'
          WHEN job_id = 'ST_CLERK' THEN 'E' 
          ELSE 'X'
        END   업무등급
FROM    employees;

-----------------------------------------------------------------------------------------------

--2. 모든 사원의 각 사원들의 근무년수, 근속상태를 파악하고자 한다.
--사원들의 사번, 성, 입사일자, 근무개월수, 근무년수, 근속상태 조회
--근무년수는 오늘을 기준으로 근무한 년수를 정수로 표현한다.
--근속상태는 근무년수에 따라 표현한다.
--근무년수가 15년 미만 이면              '15년 미만 근속'으로 표현
--           15년 이상 17년 미만 이면    '17년 미만 근속'으로 표현
--           17년 이상 이면              '17년 이상 근속'으로 표현     
               
SELECT  employee_id 사번, last_name 성, hire_date 입사일자, 
        TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)) 근무개월수, 
        TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)/12) 근무년수, 
        CASE
          WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)/12) < 15 THEN '15년 미만 근속'
          WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)/12) < 17 THEN '17년 미만 근속'
          ELSE '17년 이상 근속'
        END 근속상태1,
        
        CASE
          WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)/12) < 15 THEN '15년 미만 근속'
          WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)/12) BETWEEN 15 AND 16 THEN '17년 미만 근속'
          ELSE '17년 이상 근속'
        END 근속상태2
FROM    employees;







-----------------------------------------------------------------------------------------------
