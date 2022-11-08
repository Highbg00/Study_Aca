CREATE TABLE tblmember(
  num   NUMBER    PRIMARY KEY, --PRIMARY KEY : NOT NULL, UNIQUE
  name  VARCHAR2(10), --필드구분은 컴마로 구분
  age   NUMBER(3),
  addr  VARCHAR2(50),
  tel   VARCHAR2(20) --마지막 필드는 컴마 없음
); --명령문의 끝은 세미콜론으로 끝남, 실행은 실행구문을 블럭 지정 후 ctrl + enter, 또는 F5

--Table TBLMEMBER이(가) 생성되었습니다.

--컬럼명 변경
ALTER   TABLE   tblmember
RENAME  COLUMN  adder TO addr;

--tblmember 테이블 구조 보기
DESC  tblmember; --DESC == DESCRIBE

이름   널?       유형           
---- -------- ------------ 
NUM  NOT NULL NUMBER       
NAME          VARCHAR2(10) 
AGE           NUMBER(3)    
ADDR          VARCHAR2(50) 
TEL           VARCHAR2(20) 

--레코드 삽입, 실행 : 명령문 블럭 지정 후 ctrl + enter
INSERT INTO tblmember(num, name, age, addr, tel)
VALUES  (1,'홍길동',30,'광주시 서구 농성동','010-1111-1111'); --문자나 날짜 입력시 반드시 ''(홑따옴표)로 감쌈
--1 행 이(가) 삽입되었습니다.
INSERT INTO tblmember
VALUES  (2,'김길동',27,'광주시 서구 쌍촌동','010-2222-2222'); --문자나 날짜 입력시 반드시 ''(홑따옴표)로 감쌈
--1 행 이(가) 삽입되었습니다.

--삽입 되어진 전체 레코드 검색(조회)
SELECT  *
FROM    tblmember; --스크립트 출력 형태로 조회시 블럭 지정 후 F5

       NUM NAME              AGE ADDR                                               TEL                 
---------- ---------- ---------- -------------------------------------------------- --------------------
         1 홍길동             30 광주시 서구 농성동                                 010-1111-1111       
         2 김길동             27 광주시 서구 쌍촌동                                 010-2222-2222 

--삽입 되어진 몇개의 항목(필드)만 조회
SELECT  name, tel --조회하고자 하는 필드명
FROM    tblmember;

DML(Data Manipulation Language, 데이터 조작어, SELECT, INSERT, UPDATE, DELETE)은 
  반드시 TCL(Transaction Control Language)와 함께 사용해야 함
: 기본적으로 메모리에만 일시적으로 저장되기 때문에 작업 확정, 작업취소 명령인 TCL 과 함께 사용해야 함.

--메모리에 입력되어 있는 내용을 최종적으로 DB에 저장 : TCL 중 COMMIT(작업확정)
--작업취소(ROLLBACK)
COMMIT; 작업 확정

커밋 완료.

데어터 조작어 사용시
DB에서는 COMMIT을 반드시 사용해줘야 하지만
프로그램상에서는 AUTO COMMIT 이 됨

--tblmember 구조보기
DESC  tblmember;
이름   널?       유형           
---- -------- ------------ 
NUM  NOT NULL NUMBER       
NAME          VARCHAR2(10) 
AGE           NUMBER(3)    
ADDR          VARCHAR2(50) 
TEL           VARCHAR2(20)

[DDL : Data Definition Language, 데이터 정의어, AUTO COMMIT 이 됨], 
CREATE
ALTER
DROP
TRUNCATE
RENAME
--tblmember 에 phone 필드 추가
--구조 변경 : ALTER
ALTER TABLE   tblmember
ADD   phone   VARCHAR2(10);
--Table TBLMEMBER이(가) 변경되었습니다.
--구조보기
DESC  tblmember;
이름    널?       유형           
----- -------- ------------ 
NUM   NOT NULL NUMBER       
NAME           VARCHAR2(10) 
AGE            NUMBER(3)    
ADDR           VARCHAR2(50) 
TEL            VARCHAR2(20) 
PHONE          VARCHAR2(10) --추가됨

--tblmember 에 phone 필드 변경(13자로)
ALTER   TABLE tblmember
MODIFY  phone CHAR(13);
--Table TBLMEMBER이(가) 변경되었습니다.
--tblmember 구조보기
DESC  tblmember;
이름    널?       유형           
----- -------- ------------ 
NUM   NOT NULL NUMBER       
NAME           VARCHAR2(10) 
AGE            NUMBER(3)    
ADDR           VARCHAR2(50) 
TEL            VARCHAR2(20) 
PHONE          CHAR(13)

--tblmember 테이블의 phone 필드 이름을 mobilephone으로 이름 변경
--                                     ￣￣￣￣￣￣￣￣￣￣￣￣￣
ALTER TABLE tblmember
RENAME COLUMN phone TO mobilephone;

Table TBLMEMBER이(가) 변경되었습니다.
구조보기
DESC tblmember;

이름          널?       유형           
----------- -------- ------------ 
NUM         NOT NULL NUMBER       
NAME                 VARCHAR2(10) 
AGE                  NUMBER(3)    
ADDR                 VARCHAR2(50) 
TEL                  VARCHAR2(20) 
MOBILEPHONE          CHAR(13)     

--tblmember 테이블에서 mobilephone 필드 삭제
ALTER   TABLE   tblmember
DROP    COLUMN  mobilephone;
Table TBLMEMBER이(가) 변경되었습니다.

구조보기
DESC  tblmember;
이름   널?       유형           
---- -------- ------------ 
NUM  NOT NULL NUMBER       
NAME          VARCHAR2(10) 
AGE           NUMBER(3)    
ADDR          VARCHAR2(50) 
TEL           VARCHAR2(20)

--tblmember 테이블 제거
DROP  TABLE tblmember (CASCADE);
Table TBLMEMBER이(가) 삭제되었습니다.

--tblmember 테이블 복구
FLASHBACK TABLE tblmember TO BEFORE DROP;
Flashback을(를) 성공했습니다.

[DML : 데이터 조작어, INSERT, UPDATE, DELETE]
레코드 삽입
INSERT INTO tblmember
VALUES  (3,'박길동',47, '광주시 북구 용봉동','010-3333-3333');
INSERT INTO tblmember(num, name, age)
VALUES  (4,'이순신',55);

SELECT  * 
FROM    tblmember;
  
COMMIT; --작업확정
  
--4번 레코드의 정보를 수정(업데이트, 갱신)
주소 : 광주시 광산구 신가동
전화번호 : 010-4444-4444 로 수정

UPDATE  tblmember --UPDATE 구문, 반드시 조건절 지정
SET     addr = '광주시 광산구 신가동', tel = '010-4444-4444';

조회
SELECT  *
FROM    tblmember;

실행취소
ROLLBACK;

조회
SELECT  *
FROM    tblmember;

UPDATE  tblmember --UPDATE 구문, 반드시 조건절 지정
SET     addr = '광주시 광산구 신가동', tel = '010-4444-4444'
WHERE   num = 4;      --조건절
1 행 이(가) 업데이트되었습니다.

조회
SELECT  *
FROM    tblmember;

COMMIT; --작업확정

3번 레코드를 주소 : 서울시 강남구 개포동 으로 수정
UPDATE  tblmember
SET     addr = '서울시 강남구 개포동'
WHERE   num = 3;
1 행 이(가) 업데이트되었습니다.

COMMIT;
커밋 완료.

--4번 레코드 정보를 삭제
DELETE  FROM  tblmember --반드시 조건절 지정
WHERE   num = 4;

조회
SELECT  *
FROM    tblmember;

작업취소
ROLLBACK;

조회
SELECT  *
FROM    tblmember;

--원하는 필드만 조회, 번호, 이름, 주소만 출력
SELECT  num, name, addr
FROM    tblmember;

--이름이 김길동인 사람만 조회
SELECT  *
FROM    tblmember
WHERE   name = '김길동';

--이름이 김길동인 사람의 이름, 나이, 주소만 조회
SELECT  name, age, addr
FROM    tblmember
WHERE   name = '김길동';

--나이가 40세 이상인 회원의 이름, 나이, 주소만 출력
SELECT  name, age, addr --2
FROM    tblmember
WHERE   age >= 40;

--나이가 30세~50세 인 회원만 출력
SELECT  * 
FROM    tblmember
WHERE   age >= 30 
AND     age <= 50;

SELECT  * 
FROM    tblmember
WHERE   age BETWEEN 30 AND 50;


--주소에 특정 문자가 포함된 회원을 출력(★★★★★ LIKE ★★★★★)
오%  : 오 로 시작되는
%오  : 오 로   끝나는
%오% : 오 를 포함하는

주소가 광으로 시작하는 레코드 출력
SELECT  *
FROM    tblmember
--WHERE   addr LIKE '광%'; --광으로 시작하는
--WHERE   addr LIKE '%광'; --광으로 끝나는
WHERE   addr LIKE '%서구%'; --서구를 포함하는

COMMIT; --작업확정

SELECT  *
FROM    tblmember;















