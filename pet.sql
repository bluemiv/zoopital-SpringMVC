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
insert into admin values('pankyo2', 'oracle', 1, 'ROLE_ADMIN', 'pankyo');
select * from admin;
commit;


-- Medicament : 약품 정보
drop table medicament;
create table medicament(
   medicament_code number constraint medicament_pk primary key, -- 약품 코드
   medicament_name varchar2(500) not null, -- 약품 이름
    medicament_amount number, -- 약품 개수
    medicament_cost number, -- 약품 가격
    medicament_mandate date, -- 약품 제조일자
   medicament_exdate date, -- 약품 유통기한
   store_code varchar2(500) not null -- 지점 코드
);
drop sequence medicament_num;
create sequence medicament_num;
insert into medicament values(medicament_num.nextval, '심쿵약', 100, 5000, '2017-05-04', '17-07-25','pankyo');
insert into medicament values(medicament_num.nextval, '심쿵약', 0, 5000, '2017-05-04', '17-07-25','seohyun');
insert into medicament values(medicament_num.nextval, '심쿵약', 5000, 5000, '2017-05-04', '17-07-25','center');
select * from medicament;
commit;

-- store
drop table store;
--DB 구조 설계
create table store(
Store_Code varchar2(500) primary key,  --지점 코드
Store_ID varchar2(500), -- 지점 아이디
Store_Password varchar2(500), -- 지점 패스워드
Store_Name varchar2(500),  --지점 이름
Store_Cost varchar2(500),  --지점별 관리비
Store_Payment varchar2(500),  --지점별 급여
Store_Income varchar2(500), --지점별 수입
Store_RentCost varchar2(500),  --임대비
Store_Doctor varchar2(500), --지점 의사
Store_Worker varchar2(500), --지점 직원
Store_Date date -- 지점 가입 시간
);

select * from store;
commit;

create table pet (
  pet_code number constraint pet_pk primary key,
  pet_name varchar2(500),
  pet_type varchar2(500),
  pet_sex varchar2(500),
  pet_age number,
  pet_phone number,
  store_code varchar2(500)
  );
  create SEQUENCE pet_seq;
  
  drop table reserve;
create table reserve (
  reserve_code varchar2(500) constraint reserve_pk primary key,
  reserve_date date,
  reserve_start_time number,
  reserve_end_time number,
  emp_name varchar2(500),
  reserve_contents varchar2(4000),
  store_code varchar2(500),
  reserve_status varchar2(500) --reserved는 예약완료, visited는 방문완료, notvisited는 미방문
  );
  drop sequence reserve_seq;
  create SEQUENCE reserve_seq;
  commit;
  
  select * from reserve
  		where store_code = 'pankyo'
  		and reserve_status = 'Reserved'
  		order by reserve_date
  		, reserve_start_time;
      
  select * from reserve;