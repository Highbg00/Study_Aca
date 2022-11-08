GROUP 함수 : 여러행으로 부터 하나의 결과값을 반환
             전체 데이터를 그룹별로 구분하여 통계적인 결과를 구하기 위해서 사용하는 함수
             반드시 GROUP BY 사용

※ GROUP 함수의 종류
 1. COUNT     : 입력되는 데이터의 총 갯수를 출력
 2. SUM       : 입력되는 데이터의 총 합계를 출력
 3. AVG       : 입력되는 데이터의 총 평균을 출력
 4. MAX       : 입력되는 데이터의 최댓값을 출력
 5. MIN       : 입력되는 데이터의 최솟값을 출력
  
 6. ROLLUP    : 입력되는 데이터의 소계 및 총계값을 출력
 7. CUBE      : 입력되는 데이터의 소계 및 총계값을 출력(아래에 다시 데이터 출력)
 
 8. RANK      : 입력되는 데이터의 순위를 출력 (1, 2, 2, 4) -- GROUP BY 사용안해도 됨
 9. DENSE_RANK: 입력되는 데이터의 순위를 출력 (1, 2, 2, 3) -- GROUP BY 사용안해도 됨

우리회사 사원들이 소속된 부서를 파악
SELECT  DISTINCT department_id 부서 --DISTINCT : 중복값 제거, NULL까지 포함
FROM    employees
ORDER BY 부서; 

SELECT  DISTINCT department_id 부서 --DISTINCT : 중복값 제거, NULL까지 포함
FROM    employees
WHERE   department_id IS NOT NULL --NULL 값 제외
ORDER BY 부서; 

※ 그룹함수  : 여러햄으로부터 하나의 결과를 반환, NULL 제외
1. 입력되는 데이터의 총 갯수를 출력 : COUNT(컬럼명), COUNT(*)
01. 우리회사 사원수
SELECT  *
FROM    employees;

SELECT  COUNT(employee_id) 사원수1, 
        COUNT(*)  사원수2
FROM    employees;

02. 우리회사 부서배치 받은 사원수 --106
SELECT  COUNT(department_id) 부서배치받은사원수 --그룹함수 : NULL 제외
FROM    employees;

SELECT  COUNT(*) 부서배치받은사원수 --그룹함수 : NULL 제외, * 이므로 다 포함
FROM    employees
WHERE   department_id IS NOT NULL;

03. 우리회사 부서수 조회
SELECT  COUNT(DISTINCT department_id) 부서수
FROM    employees
WHERE   department_id IS NOT NULL;

04. 매니저인 사원들 조회
SELECT  DISTINCT manager_id 매니저
FROM    employees;

05. 매니저인 사원수 조회
SELECT  COUNT(DISTINCT manager_id) 매니저수
FROM    employees
WHERE   manager_id IS NOT NULL;

06. 우리회사사원수, 부서배치받은사원수, 부서, 커미션받는사원수 조회
SELECT  COUNT(*) 우리회사사원수, --107,106,11,35
        COUNT(department_id) 부서배치받은사원수, 
        COUNT(DISTINCT department_id) 부서수, 
        COUNT(commission_pct) 커미션받는사원수
FROM    employees;

07. 우리회사 사원들 중 60번 부서에 속한 사원들의 사원 수 조회
SELECT  COUNT(*) "60번부서사원수"
FROM    employees
WHERE   department_id = 60;

08. clerk 종류의 업무를 하는 사원 수 조회
SELECT  COUNT(*) clerk업무사원수
FROM    employees
WHERE   LOWER(job_id) LIKE '%clerk%';

2. 입력되는 데이터의 총 합계를 출력 : SUM(컬럼명)
01. 우리회사 1달 지출되는 급여의 합계
SELECT  TO_CHAR(SUM(salary),'FM$999,999,999') "1달지출급여"
FROM    employees;

02. 부서코드 60번부서에 속한 사원들의 급여 합계 조회
    통화기호와 세자리마다 쉼표 입력
SELECT  TO_CHAR(SUM(salary),'FM$999,999,999') "60번부서급여합계"
FROM    employees
WHERE   department_id = 60;

3. 입력되는 데이터의 최댓값/최솟값을 출력 : MAX/MIN(컬럼명)
01. 우리회사 급여중 가장 많이 받는 급여와 가장 적게 받는 급여를 파악
SELECT  MAX(salary) 우리회사최대급여, 
        MIN(salary) 우리회사최소급여
FROM    employees;

02. 우리회사 직원중 가장 먼저 나오는 성과 가장 나중에 나오는 성 파악
SELECT  MIN(last_name) 가장먼저나오는성,
        MAX(last_name) 가장나중에나오는성
FROM    employees;

03. 우리회사 직원중 가장 먼저 입사한 사원의 입사일자와 가장 나중에 입사한 사원의 입사일자 파악
SELECT  MIN(hire_date) "가장 먼저 입사한 사원의 입사일자",
        MAX(hire_date) "가장 나중 입사한 사원의 입사일자"
FROM    employees;

04. 우리회사 부서코드 60번인 부서에 속한 사원들 중
가장 많은 급여, 가장 적은 급여 조회
SELECT  MAX(salary) "가장 많은 급여", 
        MIN(salary) "가장 적은 급여"
FROM    employees;

4. 입력되는 데이터의 평균값을 출력 
01. 우리회사 사원들의 평균 급여 조회
SELECT  ROUND(AVG(salary),2) 우리회사평균급여
FROM    employees;

※ GROUP BY 절 : 그룹별로 조회
전체 데이터 행을 하나의 그룹으로 보고 그룹함수로 데이터를 조회
특정기준을 두어 기준으로 그룹을 짓고 그룹별로 하나의 결과를 조회하고자 할때

01. 사원들의 사번, 성, 부서코드, 급여를 조회하여 부서코드 순으로 정렬
SELECT  employee_id 사번, last_name 성, department_id 부서코드, salary 급여
FROM    employees
ORDER BY department_id;

02. 부서코드 50번의 급여 평균 조회
SELECT  ROUND(AVG(salary), 2) avg_sal
FROM    employees 
WHERE   department_id = 50;

03. 부서코드 50번에 속한 사원들의
부서코드, 업무코드, 급여평균 조회
SELECT  department_id 부서코드, job_id 업무코드, ROUND(AVG(salary), 2) 급여평균
FROM    employees
WHERE   department_id = 50
GROUP BY department_id, job_id;

--------------------------------------------------------------------------------
SELECT  목록에 
        그룹함수를 사용한 표현(COUNT, MAX, MIN, SUM, AVG 등)과
        그룹함수를 사용하지 않은 표현(일반컬럼)이 함께 있다면
반드시  그룹함수를 사용하지 않은 표현(일반컬럼)에 대해서는 (즉, 그룹함수 이외의 컬럼)
GROUP BY 절의 기준으로 명시해주어야 한다.
--------------------------------------------------------------------------------

04. 각 부서별 부서코드, 급여 평균을 조회
SELECT  department_id 부서코드, ROUND(AVG(salary)) 급여평균
FROM    employees
GROUP BY department_id
ORDER BY 1;

05. 각 부서별 급여합계, 급여평균, 부서원수 조회
SELECT  department_id, SUM(salary) sum_sal, COUNT(*) cnt
FROM    employees
GROUP BY department_id
ORDER BY 1;

06. 각부서별 업무별 급여평균 조회
SELECT  department_id, job_id, ROUND(AVG(salary)) avg_sal
FROM    employees
GROUP BY department_id, job_id
ORDER BY 1;

07. 우리회사 부서코드 10, 20, 30, 40, 60 번 부서에 속한 사원들이
어떤 업무를 하는지 파악하고자 한다.
해당 부서에 속한 사원들이 하는 업무코드를 조회 --7
SELECT  DISTINCT job_id
FROM    employees
WHERE   department_id IN (10, 20, 30, 40, 60);

SELECT  job_id
FROM    employees
WHERE   department_id IN (10, 20, 30, 40, 60)
GROUP BY job_id;

해석순서      사용예          ALIAS 사용여부
--------------------------------------------------------------------------------
5. SELECT     필드목록        O
1. FROM       테이블명        O
2. WHERE      조건절(일반)    X
3. GROUP BY   그룹지을항목    X
4. HAVING     조건절(그룹)    X
6. ORDER BY   정렬시킬항목    O
--------------------------------------------------------------------------------
GROUP BY 의 결과행에 특정 조건에 맞는 데이터행을 조회하기 위한 조건절
  : HAVING 절을 사용한다.
  조건절 
  WHERE   : 일반조건만 가능, 그룹함수조건 사용불가 
  HAVING  : 일반조건, 그룹함수조건 모두 사용가능, 반드시 GROUP BY 뒤에서 사용

01. 80번 부서의 부서와 급여평균을 조회
SELECT  department_id, ROUND(AVG(salary)) avg_sal
FROM    employees
WHERE   department_id = 80 --일반조건
GROUP BY department_id;

SELECT  department_id, ROUND(AVG(salary)) avg_sal
FROM    employees
GROUP BY department_id
HAVING  department_id = 80; --일반조건

02. 각 부서별로 소속된 사원의 수가 5명 이하인 부서와 그 수를 조회
SELECT  department_id 부서, COUNT(*) 사원수
FROM    employees
--WHERE   department_id IS NOT NULL
GROUP BY department_id
HAVING   COUNT(*) <= 5
ORDER BY 1;

03. 각 부서별 사원의 수가 10 명 이상인 부서의
부서코드, 업무코드, 사원수, 급여평균, 최대급여, 최소급여 조회
SELECT  department_id 부서코드, job_id 업무코드, COUNT(*) 사원수, ROUND(AVG(salary)) 급여평균, 
        MAX(salary) 최대급여, MIN(salary) 최소급여
FROM    employees
--WHERE   사원수 >= 10
GROUP BY  department_id, job_id
HAVING  COUNT(*) >= 10
ORDER BY department_id;

ROLLUP 
GROUP BY 절에서 ROLLUP 함수를 사용하여 GROUP BY 구문에 의한 결과와 함께
단계별 소계, 총계 정보를 구함
--GROUP BY 절에서 ROLLUP 으로 묶은 표현에 대해 총계를 구해줌

01. 각부서별 업무별 사원수와 급여합계, 부서별소계(???), 총계(???)를 구한다.
SELECT  department_id 부서, job_id 업무, COUNT(*) 사원수, SUM(salary) 급여합계
FROM    employees
GROUP BY ROLLUP(department_id, job_id)
ORDER BY 1;

CUBE
GROUP BY 절에서 CUBE 함수를 사용하여 GROUP BY 구문에 의한 결과와 함께
모든 경우의 단계별 소계, 총계 정보를 구함
--GROUP BY 절에서 CUBE 로 묶은 표현에 대해 모든 경우의 단계별 소계, 총계를 구해줌
SELECT  department_id 부서, job_id 업무, COUNT(*) 사원수, SUM(salary) 급여합계
FROM    employees
GROUP BY CUBE(department_id, job_id)
ORDER BY 1;











































































