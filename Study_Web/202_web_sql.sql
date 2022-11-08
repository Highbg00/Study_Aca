-- 테이블 생성 (w_member)
create table w_member (
  name  VARCHAR2(20),
  id    varchar2(20),
  pw    varchar2(20),
  age   number,
  addr  varchar2(50),
  tel   varchar2(20)
);

desc w_member;

select * from w_member;