-- user ����
--create user pet identified by oracle;

--alter user pet account unlock;

--grant create table, resource, connect to pet;

-- Medicament : ��ǰ ����
drop table medicament;
create table medicament(
	medicament_code number constraint medicament_pk primary key, -- ��ǰ �ڵ�
	medicament_name varchar2(500) not null, -- ��ǰ �̸�
    medicament_amount number, -- ��ǰ ����
    medicament_cost number, -- ��ǰ ����
    medicament_mandate date, -- ��ǰ ��������
	medicament_exdate date, -- ��ǰ �������
    medicament_category varchar2(500) not null, -- ��ǰ ����
    medicament_cycle number default 0, -- ��ǰ �ֱ�
	store_code varchar2(500) not null -- ���� �ڵ�
);
drop sequence medicament_num;
create sequence medicament_num;
insert into medicament values(medicament_num.nextval, '������', 100, 5000, '2017-05-04', '17-07-25', '�ֻ�', 5 ,'pankyo');
insert into medicament values(medicament_num.nextval, '�Ϳ��������', 100, 5000, '2017-05-04', '17-07-25', '�˾�', default ,'pankyo');
insert into medicament values(medicament_num.nextval, '�Գ����ʹ����ƾ�', 50, 20000, '2017-05-05', '18-08-25', '�ֻ�', 4 ,'pankyo');
insert into medicament values(medicament_num.nextval, '�����ĳ��������پ�', 76, 50000, '2017-05-05', '18-08-25', '����',7 ,'pankyo');
insert into medicament values(medicament_num.nextval, '�����߾భ�߾�', 44, 35000, '2017-02-03', '18-08-25', '��Ÿ', 5 ,'pankyo');
insert into medicament values(medicament_num.nextval, '�̰Ը��̵ǳ�', 500, 35000, '2017-06-08', '18-08-15', '�˾�', 3 ,'pankyo');
insert into medicament values(medicament_num.nextval, '�ʾ���', 230, 26000, '2017-05-05', '18-08-22', '��Ÿ', 6 ,'pankyo');
insert into medicament values(medicament_num.nextval, '�Ǻκ��麸���', 500, 26000, '2017-05-05', '18-08-22', '����', 6 ,'pankyo');
insert into medicament values(medicament_num.nextval, '�ͱ�����', 500, 26000, '2017-06-06', '18-08-23', '�˾�', 6 ,'pankyo');
insert into medicament values(medicament_num.nextval, '��������', 500, 26000, '2017-04-06', '18-08-23', '��Ÿ', 6 ,'pankyo');


insert into medicament values(medicament_num.nextval, '������', 5000, 5000, '2017-05-04', '17-07-25', '�ֻ�', 5 ,'center');
insert into medicament values(medicament_num.nextval, '�Ϳ��������', 5000, 5000, '2017-05-04', '17-07-25', '�˾�', default ,'center');
insert into medicament values(medicament_num.nextval, '�Գ����ʹ����ƾ�', 3000, 20000, '2017-05-05', '17-08-25', '�ֻ�', 4 ,'center');
insert into medicament values(medicament_num.nextval, '�����ĳ��������پ�', 5500, 50000, '2016-03-15', '18-09-12', '����', 7 ,'center');
insert into medicament values(medicament_num.nextval, '�����߾భ�߾�', 7000, 35000, '2017-02-03', '17-08-25', '��Ÿ', 5 ,'center');
insert into medicament values(medicament_num.nextval, '�̰Ը��̵ǳ�', 500, 35000, '2017-06-08', '17-08-25', '�˾�', 3 ,'center');
insert into medicament values(medicament_num.nextval, '�ʾ���', 250, 26000, '2017-05-05', '18-08-22', '��Ÿ', 6 ,'center');
insert into medicament values(medicament_num.nextval, '�Ǻκ��麸���', 500, 26000, '2017-05-05', '18-08-22', '����', 6 ,'center');
insert into medicament values(medicament_num.nextval, '�ͱ�����', 500, 26000, '2017-06-06', '18-08-23', '�˾�', 6 ,'center');
insert into medicament values(medicament_num.nextval, '��������', 500, 26000, '2017-04-06', '18-08-23', '��Ÿ', 6 ,'center');

insert into medicament values(medicament_num.nextval, '������', 5000, 5000, '2017-05-04', '17-07-25', '�ֻ�', 5 ,'yatop');
insert into medicament values(medicament_num.nextval, '�Ϳ��������', 5000, 5000, '2017-05-04', '17-07-25', '�˾�', default ,'yatop');
insert into medicament values(medicament_num.nextval, '�Գ����ʹ����ƾ�', 3000, 20000, '2017-05-05', '17-08-25', '�ֻ�', 4 ,'yatop');
insert into medicament values(medicament_num.nextval, '�����ĳ��������پ�', 5500, 50000, '2016-03-15', '18-09-12', '����', 7 ,'yatop');
insert into medicament values(medicament_num.nextval, '�����߾భ�߾�', 7000, 35000, '2017-02-03', '17-08-25', '��Ÿ', 5 ,'yatop');
insert into medicament values(medicament_num.nextval, '�̰Ը��̵ǳ�', 500, 35000, '2017-06-08', '17-08-25', '�˾�', 3 ,'yatop');
insert into medicament values(medicament_num.nextval, '�ʾ���', 250, 26000, '2017-05-05', '18-08-22', '��Ÿ', 6 ,'yatop');
insert into medicament values(medicament_num.nextval, '�Ǻκ��麸���', 500, 26000, '2017-05-05', '18-08-22', '����', 6 ,'yatop');
insert into medicament values(medicament_num.nextval, '�ͱ�����', 500, 26000, '2017-06-06', '18-08-23', '�˾�', 6 ,'yatop');
insert into medicament values(medicament_num.nextval, '��������', 500, 26000, '2017-04-06', '18-08-23', '��Ÿ', 6 ,'yatop');
select * from medicament;
commit;

--Store : ����
drop table  store;
create table store(
    store_code varchar2(500) constraint store_pk primary key,  --���� �ڵ� �� ���̵�
    store_name varchar2(500) not null,  --���� �̸�
    store_cost varchar2(500) not null,  --������ ������
    store_payment varchar2(500) default 0,  --������ �޿�
    store_income varchar2(500) default 0, --������ ����
    store_rentCost varchar2(500) not null,  --�Ӵ��
    store_doctor varchar2(500) default 0, --���� ������
    store_worker varchar2(500) default 0, --���� ��������
    store_date date not null, -- ���� ���� �ð�
    store_role varchar2(500) not null
);
--insert into store values('pankyo', '����������� �Ǳ���', '150��', '800��', '1350��', '200��', '5��', '4��', '17-05-07');
--insert into store values('seohyun', '����������� ������', '250��', '900��', '1750��', '300��', '8��', '6��', '17-05-01');
--insert into store values('center', '����������� ����', '250��', '900��', '1750��', '300��', '8��', '6��', '17-05-01');
select * from store;
commit;

--���� ���̺�
drop table report;
create table report(
    report_code number constraint report_pk primary key, -- report pk
    report_reader varchar2(500) not null,-- �����ϴ� ���
    report_writer varchar2(500) not null,-- �ۼ���
    report_position varchar2(500) not null,-- ����(������ �Ǵ� ��������)
    report_date date not null,-- �ۼ���
    report_contents varchar2(500) not null,-- ������
    report_check varchar2(500) default 'fail' not null  -- ���� ����
);
drop sequence report_num;
create sequence report_num;
select * from report;
commit;

-- pet : ���� DB
drop table pet;
create table pet (
    pet_code number constraint pet_pk primary key, -- ���� ��ȣ(pk)
    pet_name varchar2(500) not null, -- ���� �̸�
    pet_type varchar2(500) not null, -- ���� ����
    pet_sex varchar2(500) not null, -- ���� ����
    pet_age number not null, -- ���� ����
    pet_phone varchar2(500) not null, -- ���� ��ȭ��ȣ
    pet_postCode number not null, -- �����ȣ
    pet_addr varchar2(3000) not null, -- ���ּ�
    pet_addrDetail varchar2(3000) not null, -- �� �ּ�
    pet_email varchar2(1000) not null, -- �̸���
    store_code varchar2(500) -- �����ڵ�
);
drop sequence pet_num;
create sequence pet_num;
select * from pet;
commit;

-- order : ���� ����
drop table order_pet;
create table order_pet (
    order_code number constraint order_pet_pk primary key,
    order_name varchar2(500), -- ��ǰ ����
    order_amount number not null, -- ��û�� ��ǰ ����
    order_check varchar2(500) not null, -- ���� �� �ź�
    order_delivery varchar2(500) not null, -- ���� �Ϸ� �� �̿Ϸ� 
    order_to varchar2(500) not null, -- ������ (���)
    order_from varchar2(500) not null, -- ����� (��û�ϴ� ��)
    store_code varchar2(500) not null 
);
drop sequence order_num;
create sequence order_num;
select * from order_pet;
commit;

-- emp : ����
drop table emp;
create table emp(
    emp_code varchar2(500) constraint emp_pk primary key, --����ID
    emp_pwd varchar2(500) not null, -- ��й�ȣ
    emp_name varchar2(500) not null, --�̸�
    emp_age number not null, --����
    emp_tel varchar2(500) not null, -- ��ȭ��ȣ
    emp_hiredate date not null, --�� ������ ��¥
    emp_pay number not null, --�޿�
    emp_enabled number default 1 not null, -- Ȱ��ȭ(1) �� ��Ȱ��ȭ(0) 
    emp_role varchar2(500) not null, -- ����
    store_code varchar2(500) not null --����
);
--insert into emp values('7538518', 'oracle', '����ȫ', '19', '010-3920-8518', sysdate, '500000', 1,'ROLE_FULL', 'pankyo');
select * from emp;
update emp set emp_enabled = 0 where emp_code='seungfff';
commit;
rollback;


-- message : ������
drop table message;
create table message(
    message_code number constraint message_pk primary key, -- �޼��� pk
    message_title varchar2(500) not null, -- �޼��� ����
    message_body varchar2(2000) not null, -- �޼��� ����
    message_date date not null, -- �޼��� ���� �ð�
    message_writer varchar2(500) not null, -- ���� ���
    message_reader varchar2(500) not null, -- �޴»��
    message_read varchar2(100) not null, -- ����(y), ������(n)
    message_delete_writer varchar2(100) not null, -- ����(y), ��������(n)
    message_delete_reader varchar2(100) not null -- ����(y), ��������(n)
);
drop sequence message_num;
create sequence message_num;
select * from message order by message_date desc;
commit;

-- pethistory: ó����
drop table pethistory;
create table pethistory(
  pethistory_key number CONSTRAINT pethistory_pk PRIMARY KEY,
  pethistory_petcode number,
  pethistory_medicine varchar2(500),
  pethistory_m_amount varchar2(500),
  pethistory_coments varchar2(4000),
  pethistory_m_cost number, --��ǰ��
  pethistory_cost number, --�����
  pethistory_btoday Timestamp,
  pethistory_today Timestamp,
  store_code varchar2(500),
  petaccept_code number,
  emp_name varchar2(500)
);
drop sequence pethistory_seq;
create sequence pethistory_seq;
select * from pethistory;
commit;
-- into pethistory values(pethistory_seq.nextval, 1, '�Ϳ��������', 3, '�Ф�', 12000, 1000, '16/06/10 14:58:43.000000000','16/06/10 14:58:43.000000000','pankyo', 1, '����ȫ');
--insert into pethistory values(pethistory_seq.nextval, 1, '�Ϳ��������', 3, '�Ф�', 12000, 1000, '17/06/10 14:58:43.000000000','17/06/10 14:58:43.000000000','pankyo', 1, '����ȫ');
--insert into pethistory values(pethistory_seq.nextval, 1, '�Ϳ��������', 3, '�Ф�', 12000, 1000, '0517//10 14:58:43.000000000','17/05/10 14:58:43.000000000','pankyo', 1, '����ȫ');
--insert into pethistory values(pethistory_seq.nextval, 1, '�Ϳ��������', 3, '�Ф�', 12000, 1000, '17/05/10 14:58:43.000000000','17/05/10 14:58:43.000000000','pankyo', 1, '����ȫ');
--insert into pethistory values(pethistory_seq.nextval, 1, '�Ϳ��������', 3, '�Ф�', 12000, 1000, '17/05/10 14:58:43.000000000','17/04/10 14:58:43.000000000','pankyo', 1, '����ȫ');
--insert into pethistory values(pethistory_seq.nextval, 1, '�Ϳ��������', 3, '�Ф�', 12000, 1000, '17/05/10 14:58:43.000000000','17/04/10 14:58:43.000000000','pankyo', 1, '����ȫ');
--insert into pethistory values(pethistory_seq.nextval, 1, '�Ϳ��������', 3, '�Ф�', 12000, 1000, '17/05/10 14:58:43.000000000','17/03/10 14:58:43.000000000','pankyo', 1, '����ȫ');
--insert into pethistory values(pethistory_seq.nextval, 1, '�Ϳ��������', 3, '�Ф�', 12000, 1000, '17/05/10 14:58:43.000000000','17/03/10 14:58:43.000000000','pankyo', 1, '����ȫ');
--insert into pethistory values(pethistory_seq.nextval, 1, '�Ϳ��������', 3, '�Ф�', 12000, 1000, '17/05/10 14:58:43.000000000','17/03/10 14:58:43.000000000','pankyo', 1, '����ȫ');
--insert into pethistory values(pethistory_seq.nextval, 1, '�Ϳ��������', 3, '�Ф�', 12000, 1000, '17/05/10 14:58:43.000000000','17/03/10 14:58:43.000000000','pankyo', 1, '����ȫ');
--insert into pethistory values(pethistory_seq.nextval, 1, '�Ϳ��������', 3, '�Ф�', 12000, 1000, '17/05/10 14:58:43.000000000','17/02/10 14:58:43.000000000','pankyo', 1, '����ȫ');
--insert into pethistory values(pethistory_seq.nextval, 1, '�Ϳ��������', 3, '�Ф�', 12000, 1000, '17/05/10 14:58:43.000000000','17/02/10 14:58:43.000000000','pankyo', 1, '����ȫ');
--select to_char(PETHISTORY_TODAY, 'mm'), count(*) from pethistory where to_char(PETHISTORY_TODAY, 'yy') < 18 and to_char(PETHISTORY_TODAY, 'yy') >= 17 and store_code = 'pankyo' group by  to_char(PETHISTORY_TODAY, 'mm');
commit;

-- shot : ���� ����
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

---����DB(�ʱ�)
drop table petaccept;
create table petaccept(
  petaccept_code number CONSTRAINT petaccept_pk PRIMARY KEY, --�����ڵ�
  petaccept_petcode number, --���ڵ�
  petaccept_date timestamp, --�湮�ð�
  petaccept_coments varchar2(2000), --���� �� ���� ��
  store_code varchar2(500),
  petaccept_view varchar2(500) DEFAULT 'N', -- Y, N ���� waitingList ��¿��� Ȯ��
  emp_name varchar2(500)
);
drop sequence petaccept_seq;
create sequence petaccept_seq;
select * from petaccept;
commit;

-- notice: ��������
drop table notice;
create table notice(
    notice_code number constraint notice_num primary key, -- ���� �۹�ȣ
    notice_title varchar2(500) not null, -- �� ����
    notice_view number not null, -- ��ȸ��
    notice_writer varchar2(500) not null, -- �ۼ���
    notice_regDate timestamp not null, -- �ۼ� ��¥
    notice_contents varchar2(3000) not null, -- �� ����
    notice_reply number not null, -- ��� ��
    store_code varchar2(500) not null -- ���� �ڵ�
);
drop sequence notice_num;
create sequence notice_num;
select * from notice;
commit;

-- reply: �������� ���
drop table reply;
create table reply(
    reply_code number constraint reply_num primary key, -- ���� �۹�ȣ
    reply_title varchar2(500) not null, -- ��� ����
    reply_writer varchar2(500) not null, -- ��� �ۼ���
    reply_regDate timestamp not null, -- ��� �ۼ� ��¥
    reply_contents varchar2(3000) not null, -- ��� ����
    notice_code number not null, -- �θ�� pk
    store_code varchar2(500) not null -- ���� �ڵ�
);
drop sequence reply_num;
create sequence reply_num;
select * from reply;
commit;

--client : ��
drop table client;
create table client(
    client_id varchar2(500) constraint client_pk primary key,
    client_pw varchar2(500),
    client_name varchar2(500),
    client_tel varchar2(500),
    client_email varchar2(500),
    client_join_date date,
    client_enabled number default 1 not null,
    client_add varchar2(500),
    client_add_detail varchar2(1000),
    client_postcode varchar2(500),
    client_pw_qst varchar2(2000),
    client_pw_asw varchar2(2000)
);
select * from client;
commit;

-- reserver : ����
drop table reserve;
create table reserve (
  reserve_code varchar2(500) constraint reserve_pk primary key,
  reserve_date date,
  reserve_start_time number,
  reserve_end_time number,
  emp_name varchar2(500),
  reserve_contents varchar2(4000),
  store_code varchar2(500),
  reserve_status varchar2(500), --Reserved�� ����Ϸ�, Visited�� �湮�Ϸ�, NotVisited�� �̹湮
  pet_code number
  );
drop sequence reserve_seq;
create SEQUENCE reserve_seq;
select * from reserve;
commit;

--�α׵��
drop table saleslog;
create table saleslog(
  saleslog_key number CONSTRAINT saleslog_pk PRIMARY KEY,
  saleslog_m_income number, --��ǰ����
  saleslog_t_income number, --�������
  saleslog_income number,  --������
  saleslog_spending number, --����
  saleslog_net_income number, --������
  saleslog_year number, --��
  saleslog_month number, --��
  saleslog_day number, --��
  saleslog_date Date, --date
  store_code varchar2(500)
);
drop sequence saleslog_seq;
create sequence saleslog_seq;
--insert into saleslog values(saleslog_seq.nextval, 100000, 20000, 120000, 0, 120000, 17, 5, 1, '17/05/01', 'pankyo');
--insert into saleslog values(saleslog_seq.nextval, 300000, 20000, 320000, 0, 320000, 17, 5, 11, '17/05/11', 'pankyo');
--insert into saleslog values(saleslog_seq.nextval, 200000, 40000, 240000, 0, 240000, 17, 4, 1, '17/04/01', 'pankyo');
--insert into saleslog values(saleslog_seq.nextval, 700000, 50000, 750000, 0, 750000, 17, 3, 3, '17/03/03', 'pankyo');
--insert into saleslog values(saleslog_seq.nextval, 500000, 70000, 570000, 0, 570000, 17, 2, 15, '17/02/15', 'pankyo');
select * from saleslog;
commit;

-- product : ��ǰ
drop table product;
create table product(
    product_code number constraint product_pk primary key, -- ��ǰ ���� �ڵ�
    product_name varchar2(500) not null, -- ��ǰ �̸�
    product_cost number not null, -- ��ǰ ����
    product_amount number not null, -- ��ǰ ����
    product_category varchar2(500) not null, -- ��ǰ ����
    product_regdate varchar2(500) not null, -- ��ǰ ��� ��¥
    product_modifyDate varchar2(500), -- ���� ��¥
    product_url varchar2(500) -- ��ǰ �̹��� ���
);
drop sequence product_num;
create sequence product_num;
select * from product;
commit;

-- basket :  ��ٱ���
drop table basket;
create table basket(
    basket_code number constraint basket_pk primary key, -- ���� �ڵ�
    product_code varchar2(500) not null, -- ��ǰ �ڵ�
    product_amount number not null, -- ��ǰ ����
    client_id varchar2(500) not null -- �� ���̵�
);
drop sequence basket_num;
create sequence basket_num;
select * from basket;
commit;

-- systemLogin :  �ý��� �α���
drop table systemLogin;
create table systemLogin(
    systemLogin_code varchar2(500) constraint systemLogin_pk primary key,
    systemLogin_pwd varchar2(500) not null,
    systemLogin_role varchar2(500) not null
);
insert into systemLogin values('system', 'oracle', 'ROLE_SUPER_FULL');
select * from systemLogin;
commit;

-- buyList : ���Ÿ��
drop table buyList;
create table buyList(
    buyList_code number constraint buyList_pk primary key, -- ���� �ڵ�
    product_code number not null, -- ��ǰ �ڵ�
    product_amount number not null, -- ��ǰ ����
    butList_date varchar2(500) not null, -- ������ ��¥
    client_id varchar2(500) not null -- �� ���̵�
);
drop sequence buyList_num;
create sequence buyList_num;
select * from buyList;
commit;

-- ������