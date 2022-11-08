HR 유저에 관리되는 테이블 확인
SELECT  table_name 
FROM    user_tables; --실행 : 블럭 지정 후 Ctrl + Enter, F5

TABLE_NAME                                                                                                                      
--------------------------------------------------------------------------------------------------------------------------------
REGIONS       : 대륙 정보
LOCATIONS     : 위치 정보
DEPARTMENTS   : 부서 정보
JOBS          : 업무 정보
EMPLOYEES     : 사원 정보
JOB_HISTORY   : 업무이력 정보
COUNTRIES     : 국가 정보

2.1 데이터 조회
DESC  테이블명 , DESC = DESCRIBE : 테이블의 구조 보기
DESC  employees;

이름             널?       유형           
-------------- -------- ------------ 
EMPLOYEE_ID    NOT NULL NUMBER(6)    : 사번
FIRST_NAME              VARCHAR2(20) : 이름
LAST_NAME      NOT NULL VARCHAR2(25) : 성
EMAIL          NOT NULL VARCHAR2(25) : 이메일
PHONE_NUMBER            VARCHAR2(20) : 전화번호
HIRE_DATE      NOT NULL DATE         : 입사일
JOB_ID         NOT NULL VARCHAR2(10) : 업무코드
SALARY                  NUMBER(8,2)  : 급여
COMMISSION_PCT          NUMBER(2,2)  : 상여율
MANAGER_ID              NUMBER(6)    : 매너저코드
DEPARTMENT_ID           NUMBER(4)    : 부서코드

SELECT  : 테이블에 저장된 데이터를 조회하기 위한 명령어,
          SQL 문 중에서 가장 많이 사용
          SELECT절, SELECT문에는 반드시 FROM 키워드가 따라와야 함.
FROM    : 테이블 기술
WHERE   : 조건절 기술, 원하는 레코드만 검색하고자 할때

SELECT 안의
*       : 모든 컬럼 조회
컬럼명  : 특정 컬럼만 조회

employees 테이블의 모든 컬럼 조회
SELECT  *
FROM    employees;

employees 테이블의 특정 컬럼 조회
SELECT  컬럼명1, 컬럼명2, ...
FROM    employees;

사원테이블에서 모든 컬럼 조회
SELECT  *
FROM    employees; --실행 : 블럭 지정 후 ctrl + enter -> 처음화면부터 출력
                   --                    F5 -> 결과화면이 출력

사원테이블에서 사번, 이름, 성 조회
SELECT  employee_id, first_name, last_name
FROM    employees;

--사원테이블에서 사번, 이름, 성, 부서코드, 입사일자, 업무코드, 급여 조회
SELECT  employee_id, first_name, last_name, department_id, hire_date, job_id, salary
FROM    employees;

2.2 WHERE 조건절 : 특정 조건에 맞는 데이터 행을 조회하고자 할 경우
                 : WHERE 절에서는 ALIAS 사용 불가 
오라클 구조
SELECT      필드명
FROM        테이블명
WHERE       조건절
GROUP BY    그룹으로 묶을 항목
HAVING      조건절
ORDER BY    정렬기준필드

○ WHERE 절에서 사용 가능한 연산자
1. 산술연산자       : +, -, *, /, -> SELECT, WHERE 절에서 사용 가능   
2. 문자열연결연산자 : || -> SELECT, WHERE 절에서 사용 가능
3. 비교연산자       : =(같다), !=, <>, ^=(같지않다), >(초과), >=(이상), <(미만), <=(이하)
4. 논리조건연산자   : AND, OR, NOT
5. 범위조건연산자   : BETWEEN ~ AND
6. IN조건연산자     : OR조건연산자와 동일 기능 수행
7. LIKE조건연산자   : 컬럼들 값 중에서 특정 문자를 포함하는 값 조회
8. NULL조건처리     : 데이터값이 없는 값, NULL - 비교불가, 산술연산 불가
--                                        ￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣  
                    : 값 = NULL, 값 != NULL (틀린 표현, 비교 불가)
                    : 값 IS NULL, 값 IS NOT NULL (옳은 표현)
--                    ￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣

2.3 연산자
1. 산술연산자
01. 80번 부서 사원의 사번, 성, 급여, 한해동안 받은 급여(즉, 연봉) 조회
SELECT  employee_id, last_name, salary, salary * 12 연봉
FROM    employees
WHERE   department_id = 80;

ALIAS : 별명, 별칭, 애칭

ALIAS 사용
- 필드명이 너무 길때
- 함수 및 연산자를 사용했을때

ALIAS 사용 방법
필드명 AS 별명
필드명 별명
필드명 AS "별명" --공백 존재시 쌍따옴표
필드명 "별명" --공백 존재시 쌍따옴표

02. 연봉이 150000 이상인 사원들의
사번, 이름, 성, 업무코드, 급여, 연봉 조회
SELECT  employee_id, first_name, last_name, job_id, salary, salary * 12 연봉 --6
FROM    employees
--WHERE   연봉 >= 150000; --WHERE 절에서는 ALIAS 사용 불가, 정식적인 연산자 사용
WHERE   salary * 12 >= 150000;

2. 문자열 연결 연산자
01. 사번이 101번인 사원의 사번, 성명을 조회
성명은 이름과 성을 합해서 사용한다.

SELECT  employee_id, first_name || ' ' || last_name 성명
FROM    employees
WHERE   employee_id = 101;

02. 성명이 'StevenKing' 인 사원의
사번, 성명, 업무코드, 급여, 부서코드 조회
성명은 이름과 성을 합해서 사용한다.
SELECT  employee_id, first_name || ' ' || last_name 성명, job_id, salary, department_id
FROM    employees
WHERE   first_name || last_name = 'StevenKing';

03. 성명이 'Steven King' 인 사원의 
사번, 성명, 업무코드, 급여, 부서코드(dept_id로 ALIAS) 조회
성명은 이름과 성을 합해서 사용(name으로 ALIAS)한다.
SELECT  employee_id, first_name || ' ' || last_name name, job_id, salary, department_id dept_id
FROM    employees
WHERE   first_name || ' ' || last_name = 'Steven King';

공백문자: ' '(홑따옴표 안에 공백 한칸 삽입)
홍 길동

04. 사번이 101번인 사원의 사번, 성명을 조회한다.
성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다.
SELECT  employee_id, first_name || ' ' || last_name name
FROM    employees 
WHERE   employee_id = 101;

05. 사번이 101번인 사원의 성명과 한 해 동안 받은 급여를 조회한다.
성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다
연봉은 'annual salary'로 별명한다.
SELECT  first_name || ' ' || last_name name, salary * 12 "annual salary"
FROM    employees
WHERE   employee_id = 101;

3. 비교연산자
01. 급여가 3000이하인 사원의
사번, 성, 급여, 부서코드, 업무코드 조회
SELECT  employee_id, last_name, salary, department_id, job_id
FROM    employees
WHERE   salary <= 3000;

02. 부서코드가 80 초과인 사원의
사번, 성, 급여, 부서코드 조회
SELECT  employee_id, last_name, salary, department_id --1
FROM    employees
WHERE   department_id > 80;

03. 부서코드가 90인 부서에 속한 사원들의
사번, 이름, 성, 부서코드, 업무코드 조회
SELECT  employee_id, last_name, salary, job_id --3
FROM    employees
WHERE   department_id = 90;

04. 급여가 17000 인 사원들의
사번, 이름, 성, 부서코드, 급여 조회
SELECT  employee_id, last_name, department_id, salary --2
FROM    employees
WHERE   salary = 17000;

05. 급여가 3000 이하인 사원들의
사번, 이름, 성, 업무코드, 급여, 입사일자 조회
SELECT  employee_id, last_name, job_id, salary, hire_date --26
FROM    employees
WHERE   salary <= 3000;

06. 급여가 15000이상인 사원들의
사번, 이름, 성, 업무코드, 급여 조회
SELECT  employee_id, last_name, job_id, salary --3
FROM    employees
WHERE   salary >= 15000;

07. 성이 King 인 사원들의
사번, 이름, 성, 부서코드 조회
SELECT  employee_id, first_name, last_name, department_id --2
FROM    employees
WHERE   last_name = 'King';

* 문자 데이터와 날짜 데이터는 홑따옴표('') 로 묶어 사용한다.

시스템의 오늘날짜를 반환하는 함수
SYSDATE

SELECT  SYSDATE today --날짜의 기본 형식은 YY/MM/DD 형식, '/'로 구분
FROM    dual; --dual : 가짜 데이터

날짜데이터를 사용자가 원하는 문자열 형식으로 바꿔 표현 : TO_CHAR() 함수 사용
SELECT  TO_CHAR(SYSDATE,'YYYY-MM-DD') today --2022-02-10
FROM    dual;

SELECT  TO_CHAR(SYSDATE,'YYYY/MM/DD') today --2022/02/10
FROM    dual;

SELECT  TO_CHAR(SYSDATE,'YY.MM.DD') today --22.02.10
FROM    dual;

08. 입사일이 2004년 1월 1일 이전(즉, 2003년까지) 인 사원들의
사번, 성, 입사일자 조회
SELECT  employee_id, last_name, hire_date --14
FROM    employees
--WHERE   hire_date < TO_DATE('2004/01/01');
--WHERE   hire_date < TO_DATE('04/01/01');
--WHERE   hire_date < TO_DATE('2004-01-01');
--WHERE   hire_date < TO_DATE('04-01-01');
--WHERE   hire_date <= TO_DATE('2003/12/31');
--WHERE   hire_date <= TO_DATE('03/12/31');
--WHERE   hire_date <= TO_DATE('2003-12-31');
--WHERE   hire_date <= TO_DATE('03-12-31');
--WHERE   TO_CHAR(hire_date,'YYYY') <= '2003';
--WHERE   TO_CHAR(hire_date,'YYYY') < '2004'; --문자로 비교
WHERE   TO_CHAR(hire_date,'YYYY') < 2004; --숫자로 비교

4. 논리연산자 : AND, OR, NOT
4.1 AND 연산자
01. 30번 부서 사원 중 급여가 10000 이하인 사원의
사번, 성명, 급여, 부서코드 조회
성명은 이름과 성을 합해서 사용하고 name 으로 별명한다.
SELECT  employee_id, first_name || ' ' || last_name name, salary, department_id
FROM    employees
WHERE   department_id = 30
AND     salary <= 10000;

02. 30번 부서에서 급여가 10000 이하이면서 2005년 이전(2004년까지)에 입사한 사원의 
사원번호, 성명, 급여, 부서코드, 입사일자를 조회한다.
성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다.
SELECT  employee_id, first_name || ' ' || last_name name, department_id, hire_date --1
FROM    employees
WHERE   department_id = 30
AND     salary <= 10000
AND     TO_CHAR(hire_date, 'YYYY') <= 2004;

03. 부서코드가 10 이상 30 이하인 사원들의
사번, 성명, 부서코드 조회
성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다.
SELECT  employee_id, first_name || ' ' || last_name name, department_id --9
FROM    employees
WHERE   department_id >= 10
AND     department_id <= 30;

04. 급여가 10000 이상 15000 이하인 사원들의
사번, 성명, 급여, 업무코드 조회
성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다.
SELECT  employee_id, first_name || ' ' || last_name name, salary, job_id --16
FROM    employees
WHERE   salary >= 10000
AND     salary <= 15000;

05. 부서가 60인 부서에서 급여가 5000 이상인 사원들의
사번, 성명, 부서코드, 급여 조회
성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다.
SELECT  employee_id, first_name || ' ' || last_name name, department_id, salary --2
FROM    employees
WHERE   department_id = 60
AND     salary >= 5000;

4.2 OR 연산자
01. 30번 부서나 60번 부서에 속한 사원의
사번, 성명, 급여, 부서코드 조회
SELECT  employee_id, first_name || ' ' || last_name name, salary, department_id --11
FROM    employees
WHERE   department_id = 30 
OR      department_id = 60;

4.3 AND 연산자와 OR 연산자를 혼합하여 문장을 작성
01. 30번 부서의 급여가 10000 미만인 사원과
    60번 부서의 급여가  5000 이상인 사원의
    성명, 급여, 부서코드 조회
SELECT  first_name || ' ' || last_name name, salary, department_id --7
FROM    employees
WHERE   department_id = 30 AND salary < 10000
OR      department_id = 60 AND salary >= 5000;

더 정확히 표현하려면 관련있는것끼리 괄호로 묶어준다
SELECT  first_name || ' ' || last_name name, salary, department_id --7
FROM    employees
WHERE   (department_id = 30 AND salary < 10000)
OR      (department_id = 60 AND salary >= 5000);    
    
5. 범위 조건 연산자 : BETWEEN ~ AND
BETWEEN 시작값 AND 마지막값 : 시작값 이상 마지막값 이하
BETWEEN 이나 관계연산자 로 비교할 수 있는 값은 숫자, 문자, 날짜 데이터
              
A이상 B이하 : 컬럼명 BETWEEN A AND B
A미만 B초과 : 컬럼명 NOT BETWEEN A AND B
              NOT 컬럼명 BETWEEN A AND B

01. 사번 110 번 부터 120 번 까지의
사번, 성명, 급여, 부서코드 조회
SELECT  employee_id, first_name || ' ' || last_name name, salary, department_id
FROM    employees
--WHERE   employee_id >= 110
--AND     employee_id <= 120;
WHERE   employee_id BETWEEN 110 AND 120;

02. 사번 110 번 미만부터 120 번 초과까지의
사번, 성명, 급여, 부서코드 조회
SELECT  employee_id, first_name || ' ' || last_name name, salary, department_id
FROM    employees
--WHERE   employee_id < 110
--OR      employee_id > 120;
WHERE   employee_id NOT BETWEEN 110 AND 120;

03. 2005년 1월 1일 부터 2007년 12월 31일 사이에 입사한 사원의
사번, 성명, 급여, 입사일자 정보 조회
SELECT  employee_id, first_name || ' ' || last_name name, salary, hire_date --72
FROM    employees
--WHERE   hire_date >= TO_DATE('2005/01/01')
--AND     hire_date <= TO_DATE('2007/12/31');
--WHERE   hire_date BETWEEN TO_DATE('2005/01/01') AND TO_DATE('2007/12/31');
--WHERE   TO_CHAR(hire_date,'YYYY') BETWEEN 2005 AND 2007;
WHERE   TO_CHAR(hire_date,'YYYY') BETWEEN '2005' AND '2007';

DATE 타입의 hire_date 의 값을 문자값으로 비교했음에도
오류없이 결과가 나오는 이유는 오라클 SQL 엔진이 자동으로 묵시적 형변환을 했기 때문이다.
하지만 가급적 명시적으로 형변환하는것이 바람직하다.
명시적 형변환 함수는 TO_DATE() 함수이다.

04. 입사일자가 2003년 8월 1일 부터 2005년 7월 31일 에 해당하는 사원들의
사번, 성, 급여, 입사일자 조회
SELECT  employee_id, last_name, salary, hire_date --28
FROM    employees
WHERE   hire_date BETWEEN TO_DATE('2003/08/01') AND TO_DATE('2005/07/31');

6. IN 조건 연산자 : OR 연산자와 동일한 기능을 수행
01. 부서코드가 20, 30, 40, 60, 100, 110 인 부서의 속한 사원들의 
사번, 성, 부서코드 조회
SELECT  employee_id, last_name, department_id
FROM    employees
WHERE   department_id = 20
OR      department_id = 30
OR      department_id = 40
OR      department_id = 60
OR      department_id = 100
OR      department_id = 110;

SELECT  employee_id, last_name, department_id
FROM    employees
WHERE   department_id IN (20,30,40,60,100,110);

2022-02-10 오후
--------------------------------------------------------------------------------
7. 검색어에 해당하는 연산자 : 필드명 = 데이터값
                              필드명 LIKE 조건연산자(포함하는)
                              필드명 NOT LIKE 조건연산자(포함하지 않는)
                              
컬럼값들 중 특정 패턴에 속하는 값을 조회하고자 할 때 LIKE 연산자를 사용
  % : 모든것
  _ : 한글자, _z : 두번째글자가 z인것, _z% : 두번째글자가 z 로 시작하는 

컬럼명 LIKE 검색문자 + %

WHERE 성명 = '홍';        --성명이 홍인것
WHERE 성명 LIKE '홍%';    --성명이 홍으로 시작하는 모든것, 홍길동, 홍시
WHERE 성명 LIKE '%홍';    --성명이 홍으로   끝나는 모든것, 분홍, 다홍
WHERE 성명 LIKE '%홍%';   --성명이 홍을   포함하는 모든것, 홍길동, 홍시, 분홍, 다홍

01. 이름이 K로 시작되는 사원들의
사번, 이름, 성, 입사일자 조회
SELECT  employee_id, first_name, last_name, hire_date --7
FROM    employees
WHERE   first_name LIKE 'K%'; --K로 시작하는

02. 이름이 s로 끝나는 사원들의
사번, 이름, 성, 입사일자 조회
SELECT  employee_id, first_name, last_name, hire_date --7
FROM    employees
WHERE   first_name LIKE '%s';

03. 성이 소문자 z가 포함된 성을 가진 사원들의
사번, 이름, 성, 입사일자 조회
SELECT  employee_id, first_name, last_name, hire_date --4
FROM    employees
WHERE   last_name LIKE '%z%';

04. 성이 대소문자 무관하게 z가 포함된 성을 가진 사원들의
사번, 이름, 성, 입사일자 조회
--대소문자 무관하게 z가 포함된 : 대문자 Z, 소문자 z 가 하나라도 포함된

SELECT  employee_id, first_name, last_name, hire_date --5
FROM    employees
WHERE   last_name LIKE '%z%'  --소문자가 포함된
OR      last_name LIKE '%Z%'; --대문자가 포함된

05. 성명에 대소문자 무관하게 z가 포함된 성을 가진 사원들의
--  ￣￣
사번, 이름, 성, 입사일자 조회
--대소문자 무관하게 z가 포함된 : 대문자 Z, 소문자 z 가 하나라도 포함된
SELECT  employee_id, first_name, last_name, hire_date --8
FROM    employees
WHERE   first_name LIKE '%z%'  --소문자가 포함된
OR      first_name LIKE '%Z%'  --대문자가 포함된
OR      last_name LIKE '%z%'   --소문자가 포함된
OR      last_name LIKE '%Z%';  --대문자가 포함된

SELECT  employee_id, first_name, last_name, hire_date --8
FROM    employees
WHERE   first_name || last_name LIKE '%z%'
OR      first_name || last_name LIKE '%Z%';

06. 성에 소문자 z가 앞에서 2번째에 위치해 있는 성을 가진 사원들의
사번, 성, 부서코드 조회
SELECT  employee_id, last_name, department_id --1
FROM    employees
WHERE   last_name LIKE '_z%'; --성에 소문자 z 가 2번째 위치해 있는

07. 성에 소문자 z가 앞에서 5번째에 위치해 있는 성을 가진 사원들의
사번, 성, 부서코드 조회
SELECT  employee_id, last_name, department_id --2
FROM    employees
WHERE   last_name LIKE '____z%'; --성에 소문자 z 가 5번째 위치해 있는

08. 성에 소문자 z가 뒤에서 5번째에 위치해 있는 성을 가진 사원들의
사번, 성, 부서코드 조회
SELECT  employee_id, last_name, department_id --1
FROM    employees
WHERE   last_name LIKE '%z____';

LIKE 연산자 역시 BETWEEN A AND B 이나 IN 과 같이 NOT 연산자를 함께 사용할 수 있다.

09. 전화번호가 6으로 시작하지 않는 사원의
사번, 성, 급여, 전화번호 조회
SELECT  employee_id, last_name, salary, phone_number
FROM    employees
WHERE   phone_number NOT LIKE '6%';

10. 입사일자가 12월에 입사한 사원들의
사번, 성, 입사일자 조회 --7
SELECT  employee_id, last_name, hire_date
FROM    employees
--WHERE   hire_date LIKE '%12%'; --XXX, 무조건 12가 포함된
--WHERE   hire_date LIKE '%/12/%';
--WHERE   hire_date LIKE '__/12/%';
--WHERE   hire_date LIKE '__/12%';
--WHERE   hire_date LIKE '___12___';
--WHERE   TO_CHAR(hire_date,'MM') = 12;
WHERE   TO_CHAR(hire_date,'MM') = '12';

11. 업무코드(job_id)가 _A 인 사원들의
사번, 성, 업무코드 조회 --7
: 예를 들어, FI_ACCOUNT, AD_ASST, AC_ACCOUNT
SELECT  employee_id, last_name, job_id
FROM    employees
--WHERE   job_id LIKE '%_A%'; --'%_A%' ☞ _ : 한글자, 한마디로 한글자A : A앞에 한글자가 있는 모든것
WHERE   job_id LIKE '%\_A%' ESCAPE '\';

--WHERE   job_id LIKE '%\__A%' ESCAPE '\'; ☞ 3글자중에서 _를 포함하면서 A앞에 한글자 있는것

LIKE 연산자와 함께 사용하는 %, _ 를 문자 자체로 인식시키려면
%, _ 앞에 특수문자를 붙이고 옵션을 지정한다.

컬럼명 LIKE '%특수문자_%' ESCAPE '특수문자' : 컬럼명 LIKE '%\_%' ESCAPE '\'
컬럼명 LIKE '%특수문자%%' ESCAPE '특수문자' : 컬럼명 LIKE '%\%%' ESCAPE '\'

8. NULL 처리 : 비교 불가, 연산 불가    
컬럼명 IS NULL, 컬럼명 IS NOT NULL 로 표현

SELECT  department_id
FROM    employees;

01. 부서를 배치 받지 못한 사원들의(부서코드가 NULL 인 사원들의)
사번, 성, 부서코드, 업무코드, 급여 조회
SELECT  employee_id, last_name, department_id, job_id, salary --1
FROM    employees
WHERE   department_id IS NULL;

02. 커미션을 받는 사원들의
사번, 성, 부서코드, 커미션요율 조회
SELECT  employee_id, last_name, department_id, commission_pct --35
FROM    employees
WHERE   commission_pct IS NOT NULL;

2.4 데이터 행 정렬 : ORDER BY 절 - 항상 쿼리문의 제일 마지막에 위치
ORDER BY 정렬기준표현 +  ASC (오름차순, 기본값, 생략시 오름차순)
ORDER BY 정렬기준표현 + DESC (내림차순)
         (컬럼명
         컬럼위치번호
         ALIAS 명)
01. 80번 부서의 사번, 성, 급여, 부서코드에 대해 성을 내림차순으로 조회
SELECT  employee_id 사번, last_name 성, salary 급여, department_id 부서코드
FROM    employees
WHERE   department_id = 80
--ORDER BY last_name DESC; --컬럼명
--ORDER BY 성 DESC;        --ALIAS명
ORDER BY 2 DESC;           --컬럼위치번호 

--------------------------------------------------------------------------------
해석순서                  ALIAS 사용 가능절  그룹함수사용가능
5. SELECT    필드명       가능               사용가능
1. FROM      테이블명     가능               
2. WHERE     조건절       불가능             사용불가능 
3. GROUP BY  그룹항목     불가능
4. HAVING    조건절       불가능             사용가능
6. ORDER BY  정렬항목     가능
--------------------------------------------------------------------------------

02. 60번 부서의 
사번, 성, 연봉 조회
연봉을 기준으로 오름차순으로 조회
SELECT  employee_id, last_name, salary * 12 annual_salary
FROM    employees
WHERE   department_id = 60
--ORDER BY salary * 12 ASC;     --컬럼명
--ORDER BY annual_salary ASC;   --ALIAS명
ORDER BY 3 ASC;                 --컬럼위치번호

03. 사번, 성, 부서코드를 조회하는데
부서는 오름차순, 월급여는 내림차순으로 조회
department_id 를 dept_id 로 ALIAS
SELECT  employee_id, last_name, department_id dept_id
FROM    employees
--ORDER BY department_id ASC, salary DESC;
--ORDER BY dept_id ASC, salary DESC;
ORDER BY 3 ASC, salary DESC;

04. 사번, 성, 부서코드, 급여, 입사일자 조회, 
성 내림차순으로 정렬한다.
SELECT  employee_id, last_name, department_id, salary, hire_date
FROM    employees
ORDER BY last_name DESC;

05. 사번, 성, 부서코드, 급여, 입사일자 조회, 
부서 순으로 정렬한다.
SELECT  employee_id, last_name, department_id, salary, hire_date
FROM    employees
ORDER BY department_id DESC;

06. 사번, 성, 부서코드, 급여, 입사일자 조회,
입사일자 순으로 정렬한다.
SELECT  employee_id, last_name, department_id, salary, hire_date
FROM    employees
ORDER BY 5 DESC;

07. 사번, 성, 부서코드, 급여, 입사일자 조회,
급여 순으로 정렬한다.
SELECT  employee_id, last_name, department_id, salary, hire_date
FROM    employees
ORDER BY salary;

08. 사번, 성, 부서코드, 급여, 입사일자 조회
부서코드 순, 급여 내림차순으로 정렬한다.
SELECT  employee_id, last_name, department_id, salary, hire_date
FROM    employees
ORDER BY 3, 4 DESC;

SELECT  *
FROM    locations
ORDER BY 5;

정렬시 
오름차순일때는 NULL은 맨뒤에 위치(즉, 마지막 순위를 가짐)
내림차순일때는 NULL은 맨앞에 위치(즉, 우선 순위를 가짐)
그래서, 
오름차순일때는 NULL을 맨앞에 위치시키려면  ASC NULLS FIRST
내림차순일때는 NULL을 맨뒤에 위치시키려면 DESC NULLS LAST

SELECT  *
FROM    locations
ORDER BY 5 ASC; --NULL값이 맨뒤에 위치

SELECT  *
FROM    locations
ORDER BY 5 ASC NULLS FIRST; --NULL값을 맨앞에 위치

SELECT  *
FROM    locations
ORDER BY 5 DESC; --NULL값이 맨앞에 위치

SELECT  *
FROM    locations
ORDER BY 5 DESC NULLS LAST; --NULL값을 맨뒤에 위치
















































