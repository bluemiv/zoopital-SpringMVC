-- Admin : 관리자 계정
drop table admin;
create table admin(
    admin_id varchar2(500) constraint admin_pk primary key, -- admin ID
    admin_pwd varchar2(500) not null, -- admin 비밀번호
    admin_enabled int default 1 not null, -- 활성화(1) 및 비활성화(0) 
    admin_role varchar2(500) not null, -- 권한
    store_code varchar2(500) not null -- 지점 코드
);
insert into admin values('pankyo', 'oracle', 1, 'ROLE_ADMIN', '판교');
select * from admin;
commit;