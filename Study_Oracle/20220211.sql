3장. 기본함수(단일결과행)
  : 숫자함수, 문자함수, 날짜함수, 형변환함수, 일반함수

함수의 유형 : 단일결과행 함수, 다중결과행(복수행) 함수
함수에 사용하는 파라미터와 반환되는 값의 유형에 따라 함수를 구분
단일결과행 함수 : 하나의 데이터행에 대해 하나의 결과를 반환하는 형태의 함수

숫자함수 : ROUND, TRUNC, CEIL, FLOOR
문자함수 : UPPER, LOWER, TRIM, LTRIM/RTRIM, LPAD/RPAD,
           SUBSTR, INSTR, REPLACE, TRANSLATE
날짜함수 : SYSDATE, MONTHS_BETWEEN, ADD_MONTHS, LAST_DAY
형변환함수 : TO_CHAR, TO_NUMBER, TO_DATE
일반함수 : NVL, NVL2, COALESCE, DECODE, CASE ~ END

3.1 숫자함수
ABS(n) : n의 절대값을 반환하는 함수
SELECT ABS(32), ABS(-32)
FROM   dual; --dual : 테스트를 위한 테이블, 실제로 데이터는 들어가 있지 않음

SIGN(n) : n이 양수면 1, 음수면 -1, 0이면 0 반환
SELECT  SIGN(32), SIGN(-32), SIGN(0)
FROM    dual;

1) 반올림 함수 : ROUND(숫자, 소수이하/이상자릿수)
소수이하/이상자릿수 : 음수지정가능, 생략시 기본값은 0, 즉 정수로 표현
SELECT  ROUND(1234.5678, 2)   r1,
        ROUND(1234.5678, 1)   r2,
        ROUND(1234.5678, 0)   r3,
        ROUND(1234.5678)      r4,
        ROUND(1234.5678, -1)  r5,
        ROUND(1234.5678, -2)  r6
FROM    dual;

2) 무조건 버림 함수 : TRUNC(숫자, 소수이하/이상자릿수)
소수이하/이상자릿수 : 음수지정가능, 생략시 기본값은 0, 즉 정수로 표현
SELECT  TRUNC(1234.5678, 2)   t1,
        TRUNC(1234.5678, 1)   t2,
        TRUNC(1234.5678, 0)   t3,
        TRUNC(1234.5678)      t4,
        TRUNC(1234.5678, -1)  t5,
        TRUNC(1234.5678, -2)  t6
FROM    dual;

3) 숫자와 같거나 큰정수를 반환하는 함수 : CEIL(n) - 무조건 올림의 정수
게시판에서 페이지 나눌때(페이징 처리 할때)
0 ~ 1 사이에는 무수히 많은 실수
SELECT  CEIL(0.0000000000000000000001) c1, 
        CEIL(0.99999999999999999)      c2,
        CEIL(0)                        c3
FROM    dual;

4) 숫자와 같거나 작은정수를 반환하는 함수 : FLOOR(n) - 무조건 내림의 정수
SELECT  FLOOR(0.0000000000000000000001) f1, 
        FLOOR(0.99999999999999999)      f2,
        FLOOR(0)                        f3
FROM    dual;

5) 나머지를 반환하는 함수 : MOD(숫자, 나눌숫자)
SELECT  MOD(17, 4)      m1,
        MOD(17, -4)     m2,
        MOD(-17, 4)     m3,
        MOD(-17, -4)    m4,
        MOD(17, 0)      m5
FROM    dual;
                      값       젯수      몫       나머지
  17    /     4     : 17    =    4   *   4    +     1
  17    /    -4     : 17    =   -4   *  -4    +     1
 -17    /     4     :-17    =    4   *  -4    +   (-1)
 -17    /    -4     :-17    =   -4   *   4    +   (-1)
  17    /     0     : 17    =    0   *   5466545    +   17

숫자데이터를 표현할 수 있는 함수 : ROUND, TRUNC, CEIL, FLOOR
소수점데이터를 표현할 수 있는 함수 : ROUND, TRUNC
정수데이터를 표현할 수 있는 함수 : ROUND/TRUNC(두번째파라미터가 0), CEIL, FLOOR

3.2 문자 함수
1. 대/소문자 변환 함수 : UPPER/LOWER(문자)

01. 문자/날짜 데이터 표현 : 홑따옴표('')로 묶어 사용
성이 King 인 사원들의 사번, 성, 부서코드 조회
SELECT  employee_id, last_name, department_id
FROM    employees
--WHERE   last_name = 'King';
--WHERE   LOWER(last_name) = 'king';
WHERE   UPPER(last_name) = 'KING';

02. 성에 대소문자 구분없이 z 가 들어있는 사원들의
사번, 성, 부서코드 조회
SELECT  employee_id, last_name, department_id
FROM    employees
WHERE   last_name LIKE '%z%'
OR      last_name LIKE '%Z%';

SELECT  employee_id, last_name, department_id
FROM    employees
--WHERE   LOWER(last_name) LIKE '%z%';
WHERE   UPPER(last_name) LIKE '%Z%';

2. 단어 단위로 첫문자는 대문자, 나머지는 소문자로 변환하는 함수 : INITCAP(대상)
  : 이니셜만 대문자로 변환
SELECT  'we are studying oracle'                i1,
        INITCAP('we are studying oracle')       i2,
        INITCAP('WE ARE STUDYING ORACLE')       i3,
        INITCAP('wE aRE sTUDYING oRACLE')       i4
FROM    dual;

SELECT  email, INITCAP(email) i1,
        first_name, UPPER(first_name) u1, LOWER(first_name) l1
FROM    employees;

3. 문자데이터에 특정문자를 채워서 반환하는 함수 
  : LPAD/RPAD(대상, 전체크기, 충전문자)
  : 세번째 파라미터는 생략가능, 기본값은 공백문자
  
SELECT  LPAD('abc', 5, '?')     l1, --??abc
        LPAD('abc', 5)          l2, --__abc
        RPAD('abc', 5, '#')     r1, --abc##
        RPAD('abc', 5)          r2, --abc__
        LPAD('abc', 10, '@')    l3  --@@@@@@@abc
FROM    dual;

4. 문자데이터에서 특정문자를 제거하고 반환하는 함수
  : 제거할 문자는 한개만 지정가능 : TRIM
--                ￣￣￣￣￣￣￣￣￣￣￣
  : 입력상자에서 사용자 실수로 공백을 입력시
  : request.getParameter('userId').TRIM()

TRIM([LEADING, TRAILING, BOTH] [TRIM_char][FROM] char)
TRIM(제거할위치 제거할문자한개 FROM 대상문자) --각 파라미터에 컴마 없음
--              ￣￣￣￣￣￣￣
  제거할 위치 - LEADING : 왼쪽부터 제거, TRAILING : 오른쪽부터 제거, BOTH : 양쪽 제거(생략시 기본값)
  제거할 문자 - 생략시 공백

SELECT  TRIM('a' FROM 'abcdcbaaaaa')            t1, --제거할 위치 생략시 BOTH, 양쪽 제거, bcdcb
        TRIM(LEADING 'a' FROM 'abcdcbaaaaa')    t2, --bcdcbaaaaa
        TRIM(TRAILING 'a' FROM 'abcdcbaaaaa')   t3, --abcdcb
        TRIM(BOTH 'a' FROM 'abcdcbaaaaa')       t4, --bcdcb
        TRIM('   abcdcbaaaaa  ')                t5  --abcdcbaaaaa
FROM    dual;


5. 문자데이터에 특정문자를 제거하고 반환하는 함수
  : 제거할 문자를 여러개지정가능 ☜ TRIM 함수와의 차이점
--                ￣￣￣￣￣￣￣
  : LTRIM/RTRIM(대상문자, 제거할문자나열)
  : 두번째 파라미터 생략시 공백
  
SELECT  LTRIM('abcdcba', 'a')       l1, --bcdcba
        LTRIM('abcdcba', 'ba')      l2, --cdcba
        LTRIM('abcdcba', 'acd')     l3  --bcdcba
        RTRIM('abcdcba', 'acd')     r1, --abcdcb
        RTRIM('abcdcba', 'adb')     r2, --abcdc
        RTRIM('abcdcba', 'bc')      r3  --abcdcba
        RTRIM('   abcdcba       ')  r4  --___abcdcba
FROM    dual;

6. 문자열에서 문자열의 일부를 반환하는 함수(몇번째부터 몇글자)
--                                          ￣￣￣￣￣￣￣￣￣
  : SUBSTR(문자열, 시작위치, 몇글자)
  : 시작위치 - 음수지정 가능(오른쪽부터)
--                           ￣￣￣￣￣
  : 몇글자 - 생략시 문자열의 끝까지 반환
--                  ￣￣￣￣￣￣￣￣￣￣
                1   5   9   13
SELECT  SUBSTR('You are not alone', 5, 3)   s1, --are
        SUBSTR('You are not alone', 5)      s2, --are not alone
        SUBSTR('You are not alone', -5, 3)  s3, --alo
        SUBSTR('You are not alone', -5)     s4  --alone
FROM    dual;

7. 문자열에서 특정문자열이 위치한 시작위치를 반환하는 함수
  : INSTR(문자열, 찾는문자열, 문자열찾는위치, 몇번째거)
  : 문자열시작위치 - 음수지정가능(오른쪽부터 쭉쭉쭉 찾아감)
--                                ￣￣￣￣￣￣￣￣￣￣￣￣
  : 몇번째거 - 생략시 기본값 1
               1     7   11 14 17 20  
SELECT  INSTR('Every sha-la-la-la-la', 'la', 1, 2)    i1, --14
        INSTR('Every sha-la-la-la-la', 'la', 12, 2)   i2, --17
        INSTR('Every sha-la-la-la-la', 'la', 12, 4)   i3, --0
        INSTR('Every sha-la-la-la-la', 'la', -3, 2)   i4, --14
        INSTR('Every sha-la-la-la-la', 'la', -3)      i5 --17
FROM    dual;


본인의 이메일에서 아이디(id)와 서비스제공자(servicer)를 조회
SELECT  'honggildong@naver.com' email,
        honggildong             id,
        naver.com               servicer
FROM    dual;

1. @위치 알기
SELECT  INSTR('honggildong@naver.com', '@') "@위치"
FROM    dual;

2. id 가져오기
SELECT  SUBSTR('honggildong@naver.com', 1, INSTR('honggildong@naver.com', '@')-1) id
FROM    dual;

3. servicer 가져오기
SELECT  SUBSTR('honggildong@naver.com', INSTR('honggildong@naver.com', '@')+1) servicer
FROM    dual;

4. 결합
SELECT  'honggildong@naver.com' email,
        SUBSTR('honggildong@naver.com', 1, INSTR('honggildong@naver.com', '@')-1) id,
        SUBSTR('honggildong@naver.com', INSTR('honggildong@naver.com', '@')+1) servicer
FROM    dual;



  
  
  
  
  
  


















































