-- ������Դ����
-- �ڰ���
-- 1.0�汾

-- ����������Դ��������ݿ�
create database HR;
-- ѡ��������Դ�������ݿ�
use HR;



-- ���ű�
create table Section(
s_id int identity(1,1) primary key,-- ���ű��
s_name varchar(50) not null -- ��������
);
-- ְ��
create table DutyType(
dt_id int identity(1,1) primary key,-- ְ������
dt_name varchar(50) not null -- ְ����������
);
-- ְ��
create table Duty(
d_id int identity(1,1) primary key,-- ְ��id
d_name varchar(50) not null, -- ְ������
);
-- �û���Ϣ
create table UserInfo(
ui_id int identity(1,1) primary key,-- �û���� ������
ui_username varchar(50) not null,-- �û� ������
ui_password varchar(50) not null,-- �û�����(MD5���ܹ��������) Ĭ��1234
s_id int not null,-- ����
d_id int not null,-- ְ����
dt_id int not null,-- ְ��
ui_entrydate datetime not null,-- ��ְ����
ui_identity varchar(18) not null,-- ���֤��
ui_native varchar(50) not null,-- ���� (�˲��ֿɽ�����չ��ͨ�����֤���Զ���ȡ����)
ui_education varchar(50) not null,-- ѧ��(ҳ���ʼ)
ui_isjob int not null,-- ��ְ(0��ְ 1��ְ 2��ְ)
ui_jobstate int not null -- ����״̬(0��ʵԱ�� 1������ 2��ְ)
);
-- ���״̬
create table AuditStatus(
as_id int identity(1,1) primary key, -- ���״̬id
as_state int not null,-- ���״̬ 0 ͬ�� 1 ��ͬ��
as_explain varchar(255), -- ���˵��
as_type int not null -- �������  0У����� 1�������
);
-- �û���ȫ����
create table SafetyIssue(
si_id int identity(1,1) primary key,-- ��ȫ������
si_name varchar(100) not null,-- ��ȫ����
si_answer varchar(50) not null,-- ��ȫ�����
ui_id int not null -- �û����
);
-- �ݼ�����
create table LeaveType(
lt_id int identity(1,1) primary key,-- �ݼ����ͱ��
lt_name varchar(50) not null -- �ݼ���������
);
-- �û��ݼټ�¼��
create table LeaveRecord(
lr_id int identity(1,1) primary key,-- �û��ݼ�id
lr_begintime datetime not null,-- �û���ٿ�ʼʱ��
lr_endtime datetime not null,-- �û���ٽ���ʱ��
lr_cause varchar(255) not null,-- �ݼ�ԭ��
lt_id int not null,-- �ݼ�����
as_id int,-- ��˱��
ui_id int not null -- �û���ţ��������� 
);
-- ȱ������
create table LackCard(
lc_id int identity(1,1) primary key,-- ȱ��������
lc_date datetime not null,-- ����
lc_lacktime datetime not null,-- ȱ����ʱ��
lc_reportdate datetime not null,-- �ϱ�����
lc_cause varchar(255) not null,-- ȱ������
lc_prove varchar(50) not null, --֤����
as_id int,-- ��˱��
ui_id int not null -- �û���ţ��������� 
);
-- ��������
create table ReplaceRest(
rr_id int identity(1,1) primary key,-- ��������id
rr_dutydate datetime not null,-- �ϰ�ʱ��
rr_exchangedate datetime not null,-- ��������
rr_jobplan varchar(255) not null, -- ��������
as_id int,-- ��˱��
ui_id int not null -- �û���ţ��������� 
);
-- ��������
create table GoOutside(
go_id int identity(1,1) primary key,-- ����������
go_begintime datetime not null,-- ��ʼʱ��
go_endtime datetime not null,-- ����ʱ��
go_address varchar(50) not null,-- ���ڵ�
go_cause varchar(255) not null,-- ��������
as_id int,-- ��˱��
ui_id int not null -- �û���ţ��������� 
);
-- ��������
create table GoBusiness(
gb_date datetime primary key, -- ��������
gb_destination varchar(50) not null,-- Ŀ�ĵ�
gb_cause varchar(255) not null,-- ��������
gb_begindate datetime not null,-- ��������
gb_endresult varchar(100) not null, -- Ԥ�Ƴ���������
gb_price varchar(255) not null, -- ����֧��
as_id int,-- ��˱��
ui_id int not null -- �û���ţ��������� 
);



-- ����
insert into Section
values('������'),('ѧ����'),('ѧ����'),('�ۺϰ칫��'),('��ҵ��'),('�쵼');
-- ְ��
insert into Duty
values('������'),('��Ա'),('��ʦ'),('����֧��'),('����'),('������'),('��ҵ��ʦ'),('��������'),('������ѯʦ'),('����'),('������'),('��������');
-- ְ��
insert into DutyType
values('����ְ��'),('����ְԱ'),('�в����'),('�����ɲ�');
-- �ݼ�����
insert into LeaveType
values('����'),('�¼�'),('���'),('���˼�'),('�����'),('����'),('ɥ��');


