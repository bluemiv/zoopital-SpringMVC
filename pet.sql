-- Medicament : 약품 정보
drop table medicament;
create table medicament(
	medicament_code number constraint medicament_pk primary key, -- 약품 코드
	medicament_name varchar2(500) not null, -- 약품 이름
    medicament_amount number, -- 약품 개수
    medicament_cost number, -- 약품 가격
    medicament_mandate date, -- 약품 제조일자
	medicament_exdate date, -- 약품 유통기한
    medicament_category varchar2(500) not null, -- 약품 종류
    medicament_cycle number default 0, -- 약품 주기
	store_code varchar2(500) not null -- 지점 코드
);
drop sequence medicament_num;
create sequence medicament_num;
insert into medicament values(medicament_num.nextval, '심쿵약', 100, 5000, '2017-05-04', '17-07-25', '주사', 5 ,'pankyo');
insert into medicament values(medicament_num.nextval, '귀여움방지약', 100, 5000, '2017-05-04', '17-07-25', '알약', default ,'pankyo');
insert into medicament values(medicament_num.nextval, '입냄새너무좋아약', 50, 20000, '2017-05-05', '17-08-25', '주사', 10 ,'pankyo');
insert into medicament values(medicament_num.nextval, '아프냐나도아프다약', 76, 50000, '2017-05-05', '17-08-25', '연고', 10 ,'pankyo');
insert into medicament values(medicament_num.nextval, '강약중약강중약', 44, 35000, '2017-05-05', '17-08-25', '기타', 10 ,'pankyo');
insert into medicament values(medicament_num.nextval, '이게말이되냑', 500, 35000, '2017-05-05', '17-08-25', '알약', 10 ,'pankyo');

insert into medicament values(medicament_num.nextval, '심쿵약', 5000, 5000, '2017-05-04', '17-07-25', '주사', 5 ,'center');
insert into medicament values(medicament_num.nextval, '귀여움방지약', 5000, 5000, '2017-05-04', '17-07-25', '알약', default ,'center');
insert into medicament values(medicament_num.nextval, '입냄새너무좋아약', 3000, 20000, '2017-05-05', '17-08-25', '주사', 10 ,'center');
insert into medicament values(medicament_num.nextval, '아프냐나도아프다약', 5500, 50000, '2016-03-15', '18-09-12', '연고', 10 ,'center');
insert into medicament values(medicament_num.nextval, '강약중약강중약', 7000, 35000, '2017-05-05', '17-08-25', '기타', 10 ,'center');
insert into medicament values(medicament_num.nextval, '이게말이되냑', 500, 35000, '2017-05-05', '17-08-25', '알약', 10 ,'center');
select * from medicament;
commit;

--Store : 지점
drop table  store;
create table store(
    store_code varchar2(500) constraint store_pk primary key,  --지점 코드 및 아이디
    store_name varchar2(500) not null,  --지점 이름
    store_cost varchar2(500) not null,  --지점별 관리비
    store_payment varchar2(500) default 0,  --지점별 급여
    store_income varchar2(500) default 0, --지점별 수입
    store_rentCost varchar2(500) not null,  --임대비
    store_doctor varchar2(500) default 0, --지점 정규직
    store_worker varchar2(500) default 0, --지점 비정규직
    store_date date not null -- 지점 가입 시간
);
--insert into store values('pankyo', '사랑동물병원 판교점', '150만', '800만', '1350만', '200만', '5명', '4명', '17-05-07');
--insert into store values('seohyun', '사랑동물병원 서현점', '250만', '900만', '1750만', '300만', '8명', '6명', '17-05-01');
--insert into store values('center', '사랑동물병원 본사', '250만', '900만', '1750만', '300만', '8명', '6명', '17-05-01');
select * from store;
commit;

--보고서 테이블
drop table report;
create table report(
    report_code number constraint report_pk primary key, -- report pk
    report_reader varchar2(500) not null,-- 결재하는 사람
    report_writer varchar2(500) not null,-- 작성자
    report_position varchar2(500) not null,-- 직위(정규직 또는 비정규직)
    report_date date not null,-- 작성일
    report_contents varchar2(500) not null,-- 보고내용
    report_check varchar2(500) default 'fail' not null  -- 결재 여부
);
drop sequence report_num;
create sequence report_num;
select * from report;
commit;

-- pet : 동물 DB
drop table pet;
create table pet (
    pet_code number constraint pet_pk primary key, -- 내부 번호(pk)
    pet_name varchar2(500) not null, -- 동물 이름
    pet_type varchar2(500) not null, -- 동물 종류
    pet_sex varchar2(500) not null, -- 종물 성별
    pet_age number not null, -- 동물 나이
    pet_phone varchar2(500) not null, -- 주인 전화번호
    pet_postCode number not null, -- 우편번호
    pet_addr varchar2(3000) not null, -- 집주소
    pet_addrDetail varchar2(3000) not null, -- 상세 주소
    pet_email varchar2(1000) not null, -- 이메일
    store_code varchar2(500) -- 지점코드
);
drop sequence pet_num;
create sequence pet_num;
select * from pet;
commit;

-- order : 발주 내역
drop table order_pet;
create table order_pet (
    order_code number constraint order_pet_pk primary key,
    order_name varchar2(500), -- 약품 내용
    order_amount number not null, -- 요청한 물품 개수
    order_check varchar2(500) not null, -- 승인 및 거부
    order_delivery varchar2(500) not null, -- 수령 완료 및 미완료 
    order_to varchar2(500) not null, -- 목적지 (대상)
    order_from varchar2(500) not null, -- 출발지 (요청하는 곳)
    store_code varchar2(500) not null 
);
drop sequence order_num;
create sequence order_num;
select * from order_pet;
commit;

-- emp : 직원
drop table emp;
create table emp(
    emp_code varchar2(500) constraint emp_pk primary key, --직원ID
    emp_pwd varchar2(500) not null, -- 비밀번호
    emp_name varchar2(500) not null, --이름
    emp_age number not null, --나이
    emp_tel varchar2(500) not null, -- 전화번호
    emp_hiredate date not null, --일 시작한 날짜
    emp_pay number not null, --급여
    emp_enabled number default 1 not null, -- 활성화(1) 및 비활성화(0) 
    emp_role varchar2(500) not null, -- 권한
    store_code varchar2(500) not null --지점
);
--insert into emp values('7538518', 'oracle', '김태홍', '19', '010-3920-8518', sysdate, '500000', 1,'ROLE_FULL', 'pankyo');
select * from emp;
commit;

-- message : 쪽지함
drop table message;
create table message(
    message_code number constraint message_pk primary key, -- 메세지 pk
    message_title varchar2(500) not null, -- 메세지 제목
    message_body varchar2(2000) not null, -- 메세지 내용
    message_date date not null, -- 메세지 보낸 시간
    message_writer varchar2(500) not null, -- 보낸 사람
    message_reader varchar2(500) not null, -- 받는사람
    message_read varchar2(100) not null, -- 읽음(y), 안읽음(n)
    message_delete_writer varchar2(100) not null, -- 삭제(y), 삭제안함(n)
    message_delete_reader varchar2(100) not null -- 삭제(y), 삭제안함(n)
);
drop sequence message_num;
create sequence message_num;
select * from message order by message_date desc;
commit;

-- pethistory: 처방전
drop table pethistory;
create table pethistory(
  pethistory_key number CONSTRAINT pethistory_pk PRIMARY KEY,
  pethistory_petcode number,
  pethistory_medicine varchar2(500),
  pethistory_m_amount varchar2(500),
  pethistory_coments varchar2(4000),
  pethistory_m_cost number, --약품값
  pethistory_cost number, --진료비
  pethistory_btoday Timestamp,
  pethistory_today Timestamp,
  store_code varchar2(500),
  petaccept_code number
);
drop sequence pethistory_seq;
create sequence pethistory_seq;
select * from pethistory;
commit;

-- shot : 예방 접종
drop table shot;
create table shot(
    SHOT_NAME varchar2(500),
    SHOT_CYCLE number default 0,
    pet_code number,
    shot_petName varchar2(500),
    shot_date date,  
    shot_must date
);
select * from shot;
commit;

---접수DB(초기)
drop table petaccept;
create table petaccept(
  petaccept_code number CONSTRAINT petaccept_pk PRIMARY KEY, --접수코드
  petaccept_petcode number, --펫코드
  petaccept_date timestamp, --방문시간
  petaccept_coments varchar2(2000), --접수 시 전할 말
  store_code varchar2(500),
  petaccept_view varchar2(500) DEFAULT 'N' -- Y, N 으로 waitingList 출력여부 확인
);
create sequence petaccept_seq;
drop sequence petaccept_seq;
select * from petaccept;
commit;

-- notice: 공지사항
drop table notice;
create table notice(
    notice_code number constraint notice_num primary key, -- 내부 글번호
    notice_title varchar2(500) not null, -- 글 제목
    notice_view number not null, -- 조회수
    notice_writer varchar2(500) not null, -- 작성자
    notice_regDate timestamp not null, -- 작성 날짜
    notice_contents varchar2(3000) not null, -- 글 내용
    notice_reply number not null, -- 댓글 수
    store_code varchar2(500) not null -- 지점 코드
);
drop sequence notice_num;
create sequence notice_num;
select * from notice;
commit;

-- reply: 공지사항 댓글
drop table reply;
create table reply(
    reply_code number constraint reply_num primary key, -- 내부 글번호
    reply_title varchar2(500) not null, -- 댓글 제목
    reply_writer varchar2(500) not null, -- 댓글 작성자
    reply_regDate timestamp not null, -- 댓글 작성 날짜
    reply_contents varchar2(3000) not null, -- 댓글 내용
    notice_code number not null, -- 부모글 pk
    store_code varchar2(500) not null -- 지점 코드
);
drop sequence reply_num;
create sequence reply_num;
select * from reply;
commit;

--client : 고객
drop table client;
create table client(
    client_id varchar2(500) constraint client_pk primary key, -- ID
    client_pw varchar2(500), -- pwd
    client_name varchar2(500),-- 이름
    client_tel varchar2(500), -- 전화번호
    client_email varchar2(500), -- 이메일
    client_join_date date, --가입 일자
    client_enabled number default 1 not null, --(비)활성화
    client_add varchar2(500), -- 주소
    client_add_detail varchar2(1000), -- 상세 주소
    client_postcode varchar2(500) -- 우편번호
);
select * from client;
commit;

-- reserver : 예약
drop table reserve;
create table reserve (
  reserve_code varchar2(500) constraint reserve_pk primary key,
  reserve_date date,
  reserve_start_time number,
  reserve_end_time number,
  emp_name varchar2(500),
  reserve_contents varchar2(4000),
  store_code varchar2(500),
  reserve_status varchar2(500), --Reserved는 예약완료, Visited는 방문완료, NotVisited는 미방문
  pet_code number
  );
drop sequence reserve_seq;
create SEQUENCE reserve_seq;
select * from reserve;
commit;

--로그디비
drop table saleslog;
create table saleslog(
  saleslog_key number CONSTRAINT saleslog_pk PRIMARY KEY,
  saleslog_m_income number, --약품수익
  saleslog_t_income number, --진료수익
  saleslog_income number,  --수익합
  saleslog_spending number, --지출
  saleslog_net_income number, --순수익
  saleslog_year number, --년
  saleslog_month number, --월
  saleslog_day number, --일
  saleslog_date Date, --date
  store_code varchar2(500)
);
drop sequence saleslog_seq;
create sequence saleslog_seq;
select * from saleslog;
commit;

-- product : 상품
drop table product;
create table product(
    product_code number constraint product_pk primary key, -- 상품 내부 코드
    product_name varchar2(500) not null, -- 상품 이름
    product_cost number not null, -- 상품 가격
    product_amount number not null, -- 상품 개수
    product_category varchar2(500) not null, -- 상품 종류
    product_regdate varchar2(500) not null, -- 상품 등록 날짜
    product_modifyDate varchar2(500), -- 수정 날짜
    product_url varchar2(500) -- 상품 이미지 경로
);
drop sequence product_num;
create sequence product_num;
select * from product;
commit;

-- basket :  장바구니
drop table basket;
create table basket(
    basket_code number constraint basket_pk primary key, -- 내부 코드
    product_code varchar2(500) not null, -- 상품 이름
    product_amount number not null, -- 상품 개수
    client_id varchar2(500) not null -- 고객 아이디
);
drop sequence basket_num;
create sequence basket_num;
select * from basket;
commit;

-- systemLogin :  장바구니
drop table systemLogin;
create table systemLogin(
    systemLogin_code varchar2(500) constraint systemLogin_pk primary key,
    systemLogin_pwd varchar2(500) not null,
    systemLogin_role varchar2(500) not null
);
insert into systemLogin values('system', 'oracle', 'ROLE_SUPER_FULL');
select * from systemLogin;
commit;