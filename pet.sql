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
select * from admin;
commit;