-- Admin : ������ ����
drop table admin;
create table admin(
    admin_id varchar2(500) constraint admin_pk primary key, -- admin ID
    admin_pwd varchar2(500) not null, -- admin ��й�ȣ
    admin_enabled int default 1 not null, -- Ȱ��ȭ(1) �� ��Ȱ��ȭ(0) 
    admin_role varchar2(500) not null, -- ����
    store_code varchar2(500) not null -- ���� �ڵ�
);
insert into admin values('pankyo', 'oracle', 1, 'ROLE_ADMIN', '�Ǳ�');
insert into admin values('pankyo2', 'oracle', 1, 'ROLE_ADMIN', 'pankyo');
select * from admin;
commit;


-- Medicament : ��ǰ ����
drop table medicament;
create table medicament(
   medicament_code number constraint medicament_pk primary key, -- ��ǰ �ڵ�
   medicament_name varchar2(500) not null, -- ��ǰ �̸�
    medicament_amount number, -- ��ǰ ����
    medicament_cost number, -- ��ǰ ����
    medicament_mandate date, -- ��ǰ ��������
   medicament_exdate date, -- ��ǰ �������
   store_code varchar2(500) not null -- ���� �ڵ�
);
drop sequence medicament_num;
create sequence medicament_num;
insert into medicament values(medicament_num.nextval, '������', 100, 5000, '2017-05-04', '17-07-25','pankyo');
insert into medicament values(medicament_num.nextval, '������', 0, 5000, '2017-05-04', '17-07-25','seohyun');
insert into medicament values(medicament_num.nextval, '������', 5000, 5000, '2017-05-04', '17-07-25','center');
select * from medicament;
commit;

-- store
drop table store;
--DB ���� ����
create table store(
Store_Code varchar2(500) primary key,  --���� �ڵ�
Store_ID varchar2(500), -- ���� ���̵�
Store_Password varchar2(500), -- ���� �н�����
Store_Name varchar2(500),  --���� �̸�
Store_Cost varchar2(500),  --������ ������
Store_Payment varchar2(500),  --������ �޿�
Store_Income varchar2(500), --������ ����
Store_RentCost varchar2(500),  --�Ӵ��
Store_Doctor varchar2(500), --���� �ǻ�
Store_Worker varchar2(500), --���� ����
Store_Date date -- ���� ���� �ð�
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
  reserve_status varchar2(500) --reserved�� ����Ϸ�, visited�� �湮�Ϸ�, notvisited�� �̹湮
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