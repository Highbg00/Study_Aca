※ 일반함수 : NULL 이 계산되었을때 결과값이 모두 NULL 로 변경이 되어버림

※ NULL 처리 함수 
1. NVL(대상, NULL일때 반환표현)
--           ￣￣￣￣￣￣￣￣￣
2. NVL2(대상, NULL이 아닐때 반환표현, NULL 일때 반환표현)
--            ￣￣￣￣￣￣￣￣￣￣￣  ￣￣￣￣￣￣￣￣￣￣

commission_pct 확인
SELECT  commission_pct
FROM    employees;

커미션 금액이 1000 미만인 사원의
사번, 이름, 급여, 커미션요율, 커미션금액을 조회
커미션금액 = 급여 * 커미션요율
SELECT  employee_id 사번, first_name 이름, salary 급여, commission_pct 커미션요율,
        salary * commission_pct 커미션금액
FROM    employees
WHERE   salary * commission_pct < 1000;

조회된 NULL 값을 치환하는 함수 : NVL(Null VaLue), NVL2 함수

1. 데이터 값이 NULL 인 경우 다른 값으로 대체하여 반환하는 함수
  : NVL(대상, NULL일때 반환표현) ☜ 데이터 타입이 일치
--      ￣￣￣￣￣￣￣￣￣￣￣￣   ￣￣￣￣￣￣￣￣￣
  ※ 반드시 (대상과 NULL일때 반환표현)의 데이터 타입이 일치해야 함.
  
커미션 금액이 1000 미만인 사원의
사번, 이름, 급여, 커미션요율, 커미션금액을 조회
커미션금액 = 급여 * 커미션요율
SELECT  employee_id 사번, first_name 이름, salary 급여, --78
        commission_pct 커미션요율1,
        NVL(commission_pct,0) 커미션요율2,
        salary * NVL(commission_pct,0) 커미션금액
FROM    employees
WHERE   salary * NVL(commission_pct,0) < 1000;

DESC employees;

모든 사원의 사번, 성, 커미션요율, 커미션금액, 총급여 조회
커미션금액 = 급여 * 커미션요율
총급여 = 급여 + 커미션금액
SELECT  employee_id 사번, last_name 성, commission_pct 커미션요율1, NVL(commission_pct,0) 커미션요율2, 
        salary * NVL(commission_pct,0) 커미션금액, 
        salary + salary * NVL(commission_pct,0) 총급여
FROM    employees;

2. 데이터값이 NULL 인 경우에 다른값으로 대체하여 반환하는 함수 : NVL2
  : 데이터값이 NULL 인 경우 반환표현 과 NULL 이 아닌경우 반환표현을 각각 저장 할 수 있는 형태의 함수
  
  : NVL2(대상, 대상이 NULL 이 아닌 경우 반환값, 대상이 NULL 인 경우 반환값) ☜ 데이터 타입이 일치
--             ￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣
  : NVL2(대상, 값이 있을때,                   , NULL 일때)
  
모든 사원의 사번, 성, 커미션요율, 커미션금액, 총급여 조회 ☜ NVL2 로 조회
커미션금액 = 급여 * 커미션요율
총급여 = 급여 + 커미션금액  
SELECT  employee_id 사번, last_name 성, commission_pct 커미션요율1, 
        NVL2(commission_pct, commission_pct, 0) 커미션요율2, 
        salary * NVL2(commission_pct, commission_pct, 0) 커미션금액, 
        salary + salary * NVL2(commission_pct, commission_pct, 0)총급여
FROM    employees;

※ 조건문 : DECODE, CASE ~ END WHEN THEN ELSE

1. DECODE : 조건문에 해당하는 함수
  : DECODE(컬럼, A, 1, B, 2, 3) : 컬럼값이 A이면 1, B이면 2, 그것도 아니면 3
  : DECODE(대상표현, 비교데이터표현1, 반환데이터1,
--         ￣￣￣￣￣￣￣￣￣￣￣￣￣ ☜ 데이터 타입이 일치해야 함
                     비교데이터표현2, 반환데이터2,
                     비교데이터표현3, 반환데이터3,
                     default반환데이터) ALIAS명

사번, 성, 부서코드, 급여, 보너스 조회
부서코드가 10 이면 급여의 10%, 
           20 이면 급여의 20%, 
           30 이면 급여의 30%, 
           나머지 부서원은 급여의 5%

SELECT  employee_id, last_name, department_id, salary, 
        DECODE(department_id, 10, salary * 0.1,
                              20, salary * 0.2, 
                              30, salary * 0.3,
                              salary * 0.05) bonus
FROM    employees;

동등비교
SELECT  employee_id, last_name, department_id, salary, 
        CASE  department_id
          WHEN 10 THEN salary * 0.1 --컴마없음
          WHEN 20 THEN salary * 0.2 --컴마없음
          WHEN 30 THEN salary * 0.3 --컴마없음
          ELSE salary * 0.05
        END bonus
FROM    employees;

범위비교
SELECT  employee_id, last_name, department_id, salary, 
        CASE  
          WHEN department_id = 10 THEN salary * 0.1 --컴마없음
          WHEN department_id = 20 THEN salary * 0.2 --컴마없음
          WHEN department_id = 30 THEN salary * 0.3 --컴마없음
          ELSE salary * 0.05
        END bonus
FROM    employees;

사원들의 사번, 성, 업무코드, 업무등급 조회
업무등급은 업무코드에 따라 분류
업무코드    업무등급
AD_PRES     A
ST_MAN      B
IT_PROG     C
그외        X

SELECT  employee_id, last_name, job_id, 
        DECODE(job_id, 'AD_PRES','A',
                       'ST_MAN', 'B',
                       'IT_PROG','C',
                       'X') job_grade
FROM    employees;

2. CASE ~ END WHEN THEN ELSE
  : DECODE 함수 보다 더 큰 개념을 가진 표현식
  -- DECODE 함수는 동등비교연산만 가능
  -- CASE ~ END 함수는 동등비교 및 범위비교연산까지도 가능
범위 비교 조건을 사용하는 경우 CASE ~ END 함수 사용

CASE ~ END
동등비교
CASE  대상표현
  WHEN 비교데이터값1 THEN 반환데이터1 --컴마없음
  WHEN 비교데이터값2 THEN 반환데이터2 --컴마없음
  ...
  ELSE 반환데이터n
END ALIAS 명

범위비교
CASE  
  WHEN 대상표현 연산자 비교데이터값1 THEN 반환데이터1 --컴마없음, 연산자 : >=, <=, !=, >, < 등
--     ￣￣￣￣￣￣￣￣           
  WHEN 대상표현 연산자 비교데이터값2 THEN 반환데이터2 --컴마없음
  ...
  ELSE 반환데이터n
END ALIAS 명

사원들의 사번, 성, 업무코드, 업무등급 조회
업무등급은 업무코드에 따라 분류
업무코드    업무등급
AD_PRES     A
ST_MAN      B
IT_PROG     C
그외        X

동등비교
SELECT  employee_id, last_name, job_id, 
        CASE job_id
          WHEN  'AD_PRES' THEN 'A' --컴마없음
          WHEN  'ST_MAN'  THEN 'B' --컴마없음
          WHEN  'IT_PROG' THEN 'C' --컴마없음
          ELSE 'X'
        END job_grade
FROM    employees;

범위비교
SELECT  employee_id, last_name, job_id, 
        CASE 
          WHEN job_id = 'AD_PRES' THEN 'A' --컴마없음
          WHEN job_id = 'ST_MAN'  THEN 'B' --컴마없음
          WHEN job_id = 'IT_PROG' THEN 'C' --컴마없음
          ELSE 'X'
        END job_grade
FROM    employees;

사번, 성, 부서코드, 급여, 보너스 조회
보너스는 
부서코드가 10~30  이면 급여의 10%
           40~60  이면 급여의 20%
           70~100 이면 급여의 30%
           그외 부서원의 급여의 5%
SELECT  employee_id, last_name, department_id, salary, 
        CASE 
          WHEN department_id >= 10 AND department_id <= 30 THEN salary * 0.1 --컴마없음
          WHEN department_id BETWEEN 40 AND 60 THEN salary * 0.2 --컴마없음
          WHEN department_id BETWEEN 70 AND 100 THEN salary * 0.3 --컴마없음
          ELSE salary * 0.05
        END bonus
FROM    employees;






























