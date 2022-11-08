○ SQL(Structured Query Language) 명령어
- 데이터베이스에서 자료를 검색하고 수정하고 삭제하는 등을 위한 데이터베이스 언어이다.
- 관계형 데이터베이스를 처리하기 위해 고안된 언어이다.
- 독자적인 문법을 갖는 DB표준 언어이다.(ISO에 의해서 지정)
- 대다수 데이터베이스는 SQL을 사용하여 데이터를 조회, 입력, 수정, 삭제한다.

※ SQL 명령문의 종류
DQL : Data Query Language(질의어), SELECT
DML : Data Manipulation Language(데이터 조작어), INSERT, UPDATE, DELETE
TCL : Transaction Control Language(트랜젝션 처리어), COMMIT, ROLLBACK, SAVEPOINT

DDL : Data Definition Language(데이터 정의어), CREATE, ALTER, DROP, TRUNCATE, RENAME
DCL : Data Control Language(데이터 제어어), GRANT, REVOKE

-----------------------------------------------------------------------------------------------
DQL - SELECT문 ☞ 저장된 데이터를 조회

DML - INSERT문 ☞ 새로운 데이터를 삽입
DML - UPDATE문 ☞ 기존의 데이터를 변경
DML - DELETE문 ☞ 기존의 데이터를 삭제

TCL - COMMIT ☞ 변경된 내용을 영구 저장
TCL - ROLLBACK  ☞ 변경되기 이전 상태로 되돌림
TCL - SAVEPOINT ☞ 특정 위치까지는 영구 저장 혹은 이전 상태로 되돌릴 수 있도록 
        트랜잭션 중에 저장점을 만들 때 사용
        
DDL - CREATE문 ☞ 새로운 테이블을 생성
DDL - ALTER문  ☞ 기존의 테이블을 변경(컬럼 추가, 컬럼 크기 변경 등)
DDL - TRUNCATE문 ☞ 객체내의 데이터를 삭제
        DML의 DELETE문과의 차이점 : TCL의 ROLLBACK으로 삭제하기 이전 상태로 되돌릴 수 없다.
DDL - DROP문 ☞ 기존 테이블을 삭제할 때 사용
        테이블의 내용과 구조 자체를 모두 제거한다.
DDL - RENAME문 ☞ 기존의 테이블의 이름을 변경

DCL - GRANT문 ☞ 사용자에게 특정 권한을 부여할 때 사용
DCL - REVOKE문 ☞ 사용자에게 부여했던 특정 권한을 제거할 때 사용
-----------------------------------------------------------------------------------------------














