--내장함수(COUNT, SUM, AVG, MAX, MIN)

조회
SELECT  *
FROM    tblmember;

ALIAS : 별명, 별칭, 애칭
ALIAS 사용방법
- 필드명이 너무 길때
- 함수를 사용했을때

필드명 AS 별명
필드명 별명
필드명 AS "별명" --공백 존재시 쌍따옴표
필드명 "별명" --공백 존재시 쌍따옴표

SELECT  COUNT(name) 인원수--name 필드 갯수
FROM    tblmember;

SELECT  COUNT(name) "인원수"--name 필드 갯수
FROM    tblmember;

SELECT  COUNT(name) AS 인원수--name 필드 갯수
FROM    tblmember;

SELECT  SUM(age) 나이합계 --159
FROM    tblmember;

SELECT  AVG(age) 나이평균 --39.75
FROM    tblmember;

SELECT  MAX(age) 최대나이 --55
FROM    tblmember;

SELECT  MIN(age) 최소나이 --27
FROM    tblmember;

서구에서 사는 사람들의 나이 평균
SELECT  AVG(age) --28.5
FROM    tblmember
WHERE   addr LIKE '%서구%';

SELECT  *
FROM    tblmember;

모든 회원의 내년 나이
SELECT  num, name, age 올해나이, age+1 내년나이, addr, tel
FROM    tblmember;

--기타연산
num = 1 이거나 num = 3 인 회원 조회
SELECT  *
FROM    tblmember
WHERE   num = 1 
OR      num = 3;

IN 연산자 == OR 연산자
SELECT  *
FROM    tblmember
WHERE   num IN (1,3);

오늘날짜 : SYSDATE
SELECT  SYSDATE today --날짜 형식 : YY/MM/DD, 슬래시로 구분
FROM    dual; --가짜테이블

SELECT  TO_CHAR(SYSDATE,'YYYY-MM-DD') today
FROM    dual;

--tblpanme 테이블 생성
CREATE TABLE tblpanme(
  code    VARCHAR2(10)  PRIMARY KEY,
  part    VARCHAR2(20),
  price   NUMBER --세미콜론 없음
);

--레코드 입력
INSERT INTO tblpanme  (code, part, price) VALUES ('001','A영업부', 3000);
INSERT INTO tblpanme  VALUES ('002','B영업부', 6000);
INSERT INTO tblpanme  VALUES ('003','A영업부', 2000);
INSERT INTO tblpanme  VALUES ('004','B영업부', 5000);
INSERT INTO tblpanme  VALUES ('005','C영업부', 1000);
INSERT INTO tblpanme  VALUES ('006','D영업부', 4000);

--전체 레코드 검색
SELECT  *
FROM    tblpanme;

--작업확정
COMMIT;

--각 부서별로 판매금액의 총합을 구하여 출력
SELECT  part, SUM(price) sum_price 
FROM    tblpanme
GROUP BY part; --반드시 GROUP BY 생성

ORA-00937: 단일 그룹의 그룹 함수가 아닙니다.
그룹함수(SUM 등)를 사용하면 그룹함수 아닌 일반 필드를 GROUP BY (그룹별) 에 명시해줘야 한다.

--각 부서별로 판매금액의 총합을 구하여 부서의 내림차순으로 출력
SELECT  part, SUM(price) sum_sal
FROM    tblpanme
GROUP BY part
--ORDER BY part DESC; --ORDER BY part (ASC) : 기본값, 오름차순, ORDER BY part DESC : 내림차순
ORDER BY part;

--부서명만 출력
SELECT  part
FROM    tblpanme;

PART                
--------------------
A영업부
B영업부
A영업부
B영업부
C영업부
D영업부

--부서명만 출력, DISTINCT : 중복제거
SELECT  DISTINCT part
FROM    tblpanme;

--부서갯수 출력
SELECT  COUNT(DISTINCT part) cnt
FROM    tblpanme;

--각 부서별로 판매금액의 총합을 구하여 부서의 오름차순으로 정렬하여 출력
--단 부서가 2개 이상 있는 부서만 대상으로 하시오 ☞ A영업부, B영업부

SELECT  part, SUM(price) sum_price
FROM    tblpanme
--WHERE   COUNT(part) >= 2 --WHERE 절에서는 그룹함수 사용 불가
GROUP BY part
HAVING  COUNT(part) >= 2
ORDER BY part ASC;


--------------------------------------------------------------------------------
SELECT    필드명1, 필드명2,...
FROM      테이블명
WHERE     조건절 --그룹함수 사용 불가, 일반조건만 가능
GROUP BY  그룹
HAVING    조건절 --그룹함수 사용 가능, 일반조건도 가능, 반드시 GROUP BY 와 같이 사용
ORDER BY  정렬시키고자하는 필드명
--------------------------------------------------------------------------------












































