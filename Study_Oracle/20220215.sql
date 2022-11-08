8. 문자열에서 특정문자열을 찾아 다른 문자열로 바꿔 반환하는 함수
--단어를 통채로 변환
  : REPLACE(대상문자열, 찾는문자열, 대체될문자열)
  : 세번째 파라미터 생략시 기본값은 NULL
  
SELECT  REPLACE('You are not alone', 'You', 'We') r1, --We are not alone
        REPLACE('You are not alone', 'not')       r2, --You are__alone
        REPLACE('You are not alone', 'not', NULL) r3  --You are__alone
FROM    dual;

9. 문자열에 있는 특정문자 전체를 다른 특정문자로 하나씩 1:1로 대응해서 바꿔 반환하는 함수
--단어를 한글자씩 1:1 변환
  : TRANSLATE(대상문자열, 찾는문자열의나열, 대체될문자열)
  
SELECT  TRANSLATE('You are not alone', 'You', 'We') t1 --We are net alene
FROM    dual;                         --Y -> W
                                      --o -> e
                                      --u -> Null
              
3.3 날짜 함수 : 송금, 출결, 회원가입날짜, 결제시간
1. 시스템의 현재 날짜를 반환하는 함수 - SYSDATE
다른 함수와는 달리 파라미터가 없어 () 사용하지 않음

SELECT  SYSDATE today
FROM    dual;
  
날짜 +/- 숫자 : 날짜
날짜 - 날짜 : 숫자

오늘날짜 + 1 : 내일 날짜
오늘날짜 - 1 : 어제 날짜

오늘로부터 30일 후 
SELECT  SYSDATE + 30 "30일 후"
FROM    dual;
  
밀리초까지 조회
SELECT  SYSTIMESTAMP
FROM    dual;
  
2. 특정 날짜로 부터 몇개월 전/후 의 날짜를 반환하는 함수
  : ADD_MONTHS(날짜, +/-개월수)
오늘로부터 6개월 후 의 날짜와 3개월 전의 날짜 조회
SELECT  ADD_MONTHS(SYSDATE, 6) "6개월 후", 
        ADD_MONTHS(SYSDATE, -3) "3개월 전"
FROM    dual;

3. 두 날짜 사이의 개월 수의 차이를 반환하는 함수
  : MONTHS_BETWEEN(날짜1, 날짜2) -> 날짜1 > 날짜2 해야함
교육 시작 일자 : 2021/12/27
교육 종료 일자 : 2022/07/01

SELECT  TRUNC(MONTHS_BETWEEN(SYSDATE, TO_DATE('2021/12/27')),1) "교육진행월수",
        TRUNC(MONTHS_BETWEEN(TO_DATE('2022/07/01'), SYSDATE),1) "교육잔여월수"
FROM    dual;

4. 해당 날짜가 포함된 달의 마지막 일자를 반환하는 함수
  : LAST_DAY(날짜)

SELECT  LAST_DAY(SYSDATE) "이달 마지막 일자",
        LAST_DAY(ADD_MONTHS(SYSDATE, -1)) "앞달 마지막 일자",
        LAST_DAY(ADD_MONTHS(SYSDATE, +1)) "다음달 마지막 일자"
FROM    dual;

5. 해당 날짜 이후의 날짜 중에서 char(요일)로 명시된 요일에 해당하는 첫번째 날짜 반환하는 함수
  : NEXT_DAY(날짜, char)
SELECT  NEXT_DAY(SYSDATE, '일요일') n1,
        NEXT_DAY(SYSDATE, '일')     n2,
        NEXT_DAY(SYSDATE, 1)        n3
FROM    dual;

3.4 형변환 함수
문자화 함수 : TO_CHAR
숫자화 함수 : TO_NUMBER
날짜화 함수 : TO_DATE
--------------------------------------------------------------------------------

        TO_CHAR           TO_DATE
          ->                ->
숫자              문자              날짜
NUMBER            CHARACTER         DATE
          <-                  <-
        TO_NUMBER           TO_CHAR  
--------------------------------------------------------------------------------
1. 숫자화 함수 : TO_NUMBER(대상) -> 문자를 숫자로 변환
암묵적 형변환
SELECT  10 + 20       n1,
        '10' + '20'   n2,
        10 + '20'     n3
FROM    dual;

명시적 형변환
SELECT  '12345'             n1,
        TO_NUMBER('12345')  n2,
        12345               n3
FROM    dual;

2. 문자화 함수 : TO_CHAR(대상[,포맷형식]), 숫자나 날짜를 문자로 변환
  포맷 형식
  9 : 숫자 한자리, 무효의 숫자는 공백으로 채워짐, 자릿수 부족할때 #으로 표시
  0 : 숫자 한자리, 무효의 숫자라도 0으로 채워짐,  자릿수 부족할때 #으로 표시
  , : 천단위구분기호
  L : 통화기호

1) 숫자 -> 문자
SELECT  123456                          c1,
        TO_CHAR(123456)                 c2,
        TO_CHAR(123456,'999999')        c3,
        TO_CHAR(123456,'999999999')     c4,
        TO_CHAR(123456,'9999')          c5,
        TO_CHAR(123456,'999,999,999')   c6,
        TO_CHAR(123456,'L999,999,999')  c7,
        TO_CHAR(123456,'$999,999,999')  c7
FROM    dual;

○ 공백제거1 : trim()
SELECT  trim(123456)                          c1,
        trim(TO_CHAR(123456))                 c2,
        trim(TO_CHAR(123456,'999999'))        c3,
        trim(TO_CHAR(123456,'999999999'))     c4,
        trim(TO_CHAR(123456,'9999'))          c5,
        trim(TO_CHAR(123456,'999,999,999'))   c6,
        trim(TO_CHAR(123456,'L999,999,999'))  c7
FROM    dual;

○ 공백제거2 : FM사용
SELECT  123456                            c1,
        TO_CHAR(123456)                   c2,
        TO_CHAR(123456,'FM999999')        c3,
        TO_CHAR(123456,'FM999999999')     c4,
        TO_CHAR(123456,'FM9999')          c5,
        TO_CHAR(123456,'FM999,999,999')   c6,
        TO_CHAR(123456,'FML999,999,999')  c7
FROM    dual;

2) 날짜 -> 문자 : TO_CHAR(대상[,포맷형식])
포맷형식 :  년 - YEAR(년도를 영문으로 표시 : TWENTY TWENTY-TWO)
                 YYYY, 년도 4자리, 2000년 이후 사용
                 YY , 년도 2자리
                 RRRR, 년도 4자리, 2000년 이전 사용
                 RR, 년도 2자리
            월 - MONTH(월의 영문표기 모두 표시) --JANUARY, 한글 윈도우여서 변화없음
                 MON(3글자로 된 월의 이름)      --JAN,     한글 윈도우여서 변화없음
                 MM(월 2자리)
            일 - DD(일 2자리)
            요일 - DAY(한글, 월요일), DD(한글, 월, 화)
            시 - HH(12시간제), HH24(24시간제)
            분 - MI(분 2자리)
            초 - SS(초 2자리)

SELECT  TO_CHAR(SYSDATE, 'YYYY-MM-DD DY HH24:MI:SS')      d1,
        TO_CHAR(SYSDATE, 'YEAR-MONTH-DAY HH24:MI:SS')     d2,
        TO_CHAR(SYSDATE, 'YYYY-MON-DD DAY HH24:MI:SS')    d3,
        TO_CHAR(SYSDATE, 'YYYY/MM/DD DY HH24:MI:SS')      d4
FROM    dual;

3. 날짜화 함수 : TO_DATE(대상[, 표현형식]) ☞ 날짜로 변환된 것은 '/'로만 구분(YY/MM/DD 형태로만 조회)
SELECT  '221006'                            d1,
        TO_DATE('22-10-06')                 d2,
        TO_DATE('221006','DDMMRR')          d3,
        TO_DATE('221006','YYMMDD')          d4,
        TO_DATE('221006','YY/MM/DD')        d5,
        TO_DATE('221006','YY-MM-DD')        d6,
        TO_DATE('20221006','YYYY-MM-DD')      d7 --리터럴이 형식 문자열과 일치하지 않음
FROM    dual;






























