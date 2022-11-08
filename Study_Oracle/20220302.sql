10장. 제약조건
무결성제약조건 INTEGRIRY CONSTRAINT - 정확성, 정합성, 무결성 보장
  - 테이블에 잘못된 데이터 입력 막기 위해 규칙주는것
  - 제약조건명은 30자까지 가능

- 정합성(Integrity) : 어떤 사람들의 언어 혹은 논변이 그것을 포하하는 전체들의 체계를 무너뜨리지 않고 잘 어울린다.
- 무결성 : 데이터의 정확성과 일관성을 유지하고, 데이터에 결손과 부정합이 없음을 보증하는것
         : 학년을 입력할대 1,2,3,4학년만 존재하는데 5학년이 입력되면 무결성이 어긋낫다라고 표현

***제약조건
  : NOT NULL, CHECK, UNIQUE, PRIMARY KEY, FOREIGN KEY, DEFAUL(DEFAULT 는 제약조건은 아님)
  : 제약조건은 테이블 생성시에도 정의 할 수 있고, 생성 후에도 추가/제거할수 있음

※ 테이블 생성시 제약 조건 ※
--------------------------------------------------------------------------------
제약 조건                    |  기능 
--------------------------------------------------------------------------------
- NOT NULL(컬럼레벨에서만,   | NULL 값 입력 금지, 테이블 생성시 컬럼레벨 정의방식으로만 정의
        NULL값 입력 금지)    | 컬럼 레벨만 ☜ id   VARCHR2   NOT NULL
--------------------------------------------------------------------------------
- DEFAULT(컬럼레벨에서만,    | 데이터 입력(수정)할때 값 미지정시 기본값 지정
          기본값 지정        | 데이블 생성시 컬럼레벨에서만 정의
          제약조건 아님      | 컬럼 레벨만 ☜ gender  CHAR(3) DEFAULT '남'
--------------------------------------------------------------------------------
- CHECK(입력값의 제한        | 조건으로 설정된 값만 입력 허용
        즉, 설정값만 허용)   | 컬럼레벨 ☜ gender CHAR(3) CHECK( gender IN ('남','여') )
(도메인 무결성 제약조건)     | 테이블레벨 ☜ CHECK ( gender IN ('남','여') )
--------------------------------------------------------------------------------
- UNIQUE(개체 무결성,        | 중복값 입력 금지(NULL값은 중복입력가능), NOT NULL과 함께 사용도 가능
         중복값 입력금지)    | 컬럼레벨 ☜ job VARCHAR2(15)  UNIQUE
                             | 테이블레벨 ☜ UNIQUE(job)
                             | 2개 이상의 컬럼을 이용하여 기본키 지정(복합키)
--------------------------------------------------------------------------------
- PRIMARY KEY(개체무결성,    | NOT NULL + UNIQUE, 2개 이상의 컬럼을 이용하여 기본키 지정가능(복합키)
  NOT NULL + UNIQUE)         | 컬럼레벨 ☜ id NUMBER(8)  PRIMARY KEY
                             | 테이블레벨 ☜ PRIMARY KEY(id)
--------------------------------------------------------------------------------
- FOREIGN KEY(참조무결성,    | 다른테이블의 컬럼을 조회해서 무결성 검사
다른테이블의 PK, UK 참조)    | 컬럼레벨 ☜ deptid NUMBER(4) REFERENCES dept(deptid)
(부모테이블의 PK, UK 참조)   | 테이블레벨 ☜ FOREIGN KEY(deptid) REFERENCES dept(deptid)
--------------------------------------------------------------------------------

※ 제약조건에 이름 지정하기(관리목적으로 생성)
- 이름을 지정하지 않으면 자동으로 생성됨(SYS...로 시작)
- 나중에 제약조건을 비활성화하거나 삭제하는 등의 관리를 위해서는 제약조건에 이름을 지정해주는것이 좋다


--제약조건 선언 - COLUMN 레벨, TABLE 레벨
1. 컬럼레벨
--------------------------------------------------------------------------------
1.1. 컬럼레벨의 제약조건 기술방법(컬럼 정의시 그 라인 안에서 제약조건을 정의하는것)
--------------------------------------------------------------------------------
☞ 컬럼명 데이터타입(크기) [CONSTRAINT 제약조건명(테이블명약어_컬럼명약어_제약조건약어) 제약조건]
--------------------------------------------------------------------------------
CREATE  TABLE 테이블명(
  컬럼명 데이터타입(크기) [CONSTRAINT 제약조건명(테이블명약어_컬럼명약어_제약조건약어) 제약조건]
  .....
  .....
);
--------------------------------------------------------------------------------
CREATE  TABLE emp000 (
  empno   NUMBER(4)     PRIMARY KEY,  --제약조건명 미지정시 SYS....로 시작하는 제약조건명 생성
  ename   VARCHAR2(15)  NOT NULL,
  job     VARCHAR2(15)  UNIQUE,
  deptid  NUMBER(2)     REFERENCES  dept(deptid),
  gender  CHAR(3)       DEFAULT '남' CHECK( gender IN ('남','여') )
);
--------------------------------------------------------------------------------
1.2. 제약조건명 추가한 컬럼레벨의 제약조건기술 방법(컬럼 정의시 그 라인 안에서 제약조건을 정의하는것)
--------------------------------------------------------------------------------
CREATE  TABLE emp000 (
  empno   NUMBER(4)     CONSTRAINT emp000_empno_pk  PRIMARY KEY,
  ename   VARCHAR2(15)  CONSTRAINT emp000_ename_nn  NOT NULL,
  job     VARCHAR2(15)  CONSTRAINT emp000_job_uk    UNIQUE,
  deptid  NUMBER(2)     CONSTRAINT emp000_deptid_fk REFERENCES  dept(deptid),
  gender  CHAR(3)       DEFAULT '남' CONSTRAINT emp000_gender_ck CHECK( gender IN ('남','여') )
);
--------------------------------------------------------------------------------
※ CTAS 로 departments 테이블을 이용하여 dept 테이블 생성
department_id -> deptid
department_name -> deptname
manager_id -> manager_id
location_id -> location_id

CREATE TABLE dept AS
  SELECT  department_id deptid, department_name deptname, manager_id, location_id
  FROM    departments;
  
SELECT  table_name
FROM    user_tables;

DESC    dept;
이름          널?       유형           
----------- -------- ------------ 
DEPTID               NUMBER(4)        : CTAS는 NOT NULL 만 복사, PRIMARY KEY 복사 되지 않음, 
                                      : PRIMARY KEY로 지정
DEPTNAME    NOT NULL VARCHAR2(30) 
MANAGER_ID           NUMBER(6)    
LOCATION_ID          NUMBER(4)

DESC    departments;
이름              널?       유형           
--------------- -------- ------------ 
DEPARTMENT_ID   NOT NULL NUMBER(4)    : PRIMARY KEY
DEPARTMENT_NAME NOT NULL VARCHAR2(30) 
MANAGER_ID               NUMBER(6)    
LOCATION_ID              NUMBER(4) 

dept 테이블의 deptid 를 PRIMARY KEY 로 지정
ALTER TABLE dept
MODIFY (deptid PRIMARY KEY);

Table DEPT이(가) 변경되었습니다.

DESC    dept;
이름          널?       유형           
----------- -------- ------------ 
DEPTID      NOT NULL NUMBER(4)      : PRIMARY KEY 생성
DEPTNAME    NOT NULL VARCHAR2(30) 
MANAGER_ID           NUMBER(6)    
LOCATION_ID          NUMBER(4)
--------------------------------------------------------------------------------
DROP TABLE  dept CASCADE CONSTRAINTS; --자식테이블이 존재해도 부모테이블 제거가 가능
Table DEPT이(가) 삭제되었습니다.


--------------------------------------------------------------------------------
2. 테이블 레벨
--------------------------------------------------------------------------------
2.1. 테이블레벨의 제약조건 기술방법(컬럼 정의 후 다시 아래에서 제약조건 정의하는것)
--------------------------------------------------------------------------------
CREATE TABLE 테이블명(
  컬럼명 데이터타입(크기),
  ...,
  CONSTRAINT 제약조건명(테이블명약어_컬럼명약어_제약조건약어) 제약조건,
  ...
);
--------------------------------------------------------------------------------
CREATE  TABLE emp000 (
  empno   NUMBER(4),
  ename   VARCHAR2(15)  NOT NULL,
  job     VARCHAR2(15),
  deptid  NUMBER(2),
  gender  CHAR(3)       DEFAULT '남',
  
  PRIMARY KEY(empno),
  UNIQUE  (job),
  FOREIGN KEY(deptid) REFERENCES dept(deptid),
  CHECK(gender IN ('남','여'))
);
--------------------------------------------------------------------------------
2.2. 제약조건명 추가한 테이블 레벨의 제약조건(컬럼 정의 후 다시 아래에서 제약조건 정의하는것)
--------------------------------------------------------------------------------
CREATE  TABLE emp000 (
  empno   NUMBER(4),
  ename   VARCHAR2(15)  CONSTRAINT  emp000_ename_nn NOT NULL,
  job     VARCHAR2(15),
  deptid  NUMBER(2),
  gender  CHAR(3)       DEFAULT '남',
  
  CONSTRAINT  emp000_empno_pk   PRIMARY KEY(empno),
  CONSTRAINT  emp000_job_uk     UNIQUE  (job),
  CONSTRAINT  emp000_deptid_fk  FOREIGN KEY(deptid) REFERENCES dept(deptid),
  CONSTRAINT  emp000_gender_ck  CHECK(gender IN ('남','여'))
);
--------------------------------------------------------------------------------

DROP  TABLE   emp000;
DROP  TABLE   dept;

CREATE TABLE dept AS
  SELECT  department_id deptid, department_name deptname, manager_id, location_id
  FROM    departments;

dept 테이블의 deptid 를 PRIMARY KEY 로 지정
ALTER TABLE dept
MODIFY (deptid PRIMARY KEY);


--------------------------------------------------------------------------------
1. 제약조건 삭제 --제약조건명 삭제
  ALTER TABLE 테이블명
  DROP CONSTRAINT 제약조건명

2. 제약조건 추가
  ALTER TABLE 테이블명
  ADD CONSTRAINT 제약조건명 제약조건

3. 제약조건 이름변경
  ALTER TABLE 테이블명
  RENAME CONSTRAINT 기존제약조건명  TO 바꿀제약조건명
--------------------------------------------------------------------------------
  ALTER TABLE dept
  RENAME CONSTRAINT SYS_C008414  TO dept_deptid_pk;

  ALTER TABLE dept
  DROP CONSTRAINT SYS_C008413;

1. NOT NULL
테이블 생성시 NOT NULL 지정 안하면 NULL 로 지정 됨

테이블 생성 후 NOT NULL 지정(추가)
ALTER TABLE 테이블명
MODIFY (컬럼명 NOT NULL) --ADD 아니고 MODIFY, 제약조건명도 지정할 수 없음

--굳이 제약조건명 지정하려면
ALTER TABLE 테이블명
RENAME CONSTRAINT SYS..... TO 새제약조건명

ALTER TABLE 테이블명
DROP CONSTRAINT  제약조건명

2. UNIQUE
ALTER TABLE 테이블명
ADD CONSTRAINT  제약조건명 UNIQUE(컬럼명)

ALTER TABLE 테이블명
DROP CONSTRAINT  제약조건명

3. CHECK
ALTER TABLE 테이블명
ADD CONSTRAINT  제약조건명 CHECK( 컬럼명 조건식 )
--ADD CONSTRAINT  제약조건명 CHECK( gender IN ('남','여') )

ALTER TABLE 테이블명
DROP CONSTRAINT  제약조건명

4. DEFAULT
DEFAULT 제약조건이 아니므로 제약조건 및 제약조건명 지정 불가

DEFAULT 값 삭제(변경)
ALTER TABLE 테이블명
MODIFY  컬럼명 데이터타입(크기) DEFAULT NULL --삭제
MODIFY  컬럼명 데이터타입(크기) DEFAULT '여' --변경

5. FOREIGN KEY
ALTER TABLE 테이블명
ADD CONSTRAINT 제약조건명 FOREIGN KEY(컬럼명) REFERENCES 부모테이블(부모컬럼명)

ALTER TABLE 테이블명
DROP CONSTRAINT  제약조건명

6. PRIMARY KEY
ALTER TABLE 테이블명
ADD CONSTRAINT 제약조건명 PRIMARY KEY(컬럼명)

ALTER TABLE 테이블명
DROP CONSTRAINT  제약조건명


11장. VIEW(뷰) : 가상의 테이블
- 실제로 데이터가 존재하는 객체는 아니다
- 테이블의 데이터를 뷰를 통해 접근한다.
  1. 보안 - 접근 권한
  2. 복잡한 쿼리문을 단순한 쿼리문으로 사용할 수 있다.

뷰를 사용하면 테이블처럼 사용가능하며 SELECT 절에서만 쿼리 가능
INSERT, DELETE, UPDATE 가 불가능하다.

* 뷰생성
CREATE OR REPLACE VIEW 뷰명 AS --☜ CVAS
  SELECT 조회문

* CTAS
CREATE  TABLE 테이블명 AS --☜ CTAS
  SELECT 조회문

* ITAS
INSERT INTO 테이블명 --☜ AS 없음
  SELECT 조회문

CREATE OR REPLACE VIEW view_60 AS
  SELECT  employee_id id, first_name || ' ' || last_name name, department_id dept_id,
          job_id, hire_date, email
  FROM    employees
  WHERE   department_id = 60;

뷰 조회
SELECT  *
FROM    view_60;

뷰 삭제
DROP  VIEW view_60;

※ 시퀀스 생성
CREATE  SEQUENCE 시퀀스명
START WITH  시작숫자
INCREMENT BY 증감숫자;

DROP TABLE emp;

--emp 테이블 생성
CREATE TABLE emp(
  id    NUMBER(4)   CONSTRAINT emp_id_pk    PRIMARY KEY,
  name  VARCHAR(30) CONSTRAINT emp_name_nn  NOT NULL
);

--emp sequence 생성
CREATE  SEQUENCE  emp_seq
START   WITH 1
INCREMENT BY 1;

시퀀스값의 접근 : CURRVAL, NEXTVAL
SELECT  emp_seq.NEXTVAL FROM dual; --1

현재시퀀스 값 확인
SELECT  emp_seq.CURRVAL FROM dual; --1

emp 테이블의 PK 인 id 컬럼에 시퀀스를 적용하여 데이터 행을 삽입저장한다.
INSERT INTO emp(id, name)
VALUES (emp_seq.CURRVAL,'이순신');

INSERT INTO emp
VALUES (emp_seq.NEXTVAL,'홍길동');

조회
SELECT  *
FROM    emp;

* 시퀀스 삭제
DROP SEQUENCE 시퀀스명;
DROP SEQUENCE emp_seq;

* 시퀀스 수정 ☞ 시퀀스 삭제하고 시퀀스 재생성해야 함
ALTER TABLE 시퀀스명
START WITH 시작값 --시작값 수정 불가
INCREMENT BY 1;





















