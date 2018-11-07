-- 人力资源管理
-- 第八组
-- 1.0版本

-- 创建人力资源管理的数据库
create database HR;
-- 选中人力资源管理数据库
use HR;



-- 部门表
create table Section(
s_id int identity(1,1) primary key,-- 部门编号
s_name varchar(50) not null -- 部门名称
);
-- 职别
create table DutyType(
dt_id int identity(1,1) primary key,-- 职别类型
dt_name varchar(50) not null -- 职别类型名称
);
-- 职务
create table Duty(
d_id int identity(1,1) primary key,-- 职务id
d_name varchar(50) not null, -- 职务名称
);
-- 用户信息
create table UserInfo(
ui_id int identity(1,1) primary key,-- 用户编号 即工号
ui_username varchar(50) not null,-- 用户 即姓名
ui_password varchar(50) not null,-- 用户密码(MD5加密过后的密码) 默认1234
s_id int not null,-- 部门
d_id int not null,-- 职务编号
dt_id int not null,-- 职别
ui_entrydate datetime not null,-- 入职日期
ui_identity varchar(18) not null,-- 身份证号
ui_native varchar(50) not null,-- 籍贯 (此部分可进行拓展，通过身份证号自动获取籍贯)
ui_education varchar(50) not null,-- 学历(页面初始)
ui_isjob int not null,-- 在职(0在职 1离职 2调职)
ui_jobstate int not null -- 工作状态(0真实员工 1试用期 2离职)
);
-- 审核状态
create table AuditStatus(
as_id int identity(1,1) primary key, -- 审核状态id
as_state int not null,-- 审核状态 0 同意 1 不同意
as_explain varchar(255), -- 审核说明
as_type int not null -- 审核类型  0校区审核 1部门审核
);
-- 用户安全问题
create table SafetyIssue(
si_id int identity(1,1) primary key,-- 安全问题编号
si_name varchar(100) not null,-- 安全问题
si_answer varchar(50) not null,-- 安全问题答案
ui_id int not null -- 用户编号
);
-- 休假类型
create table LeaveType(
lt_id int identity(1,1) primary key,-- 休假类型编号
lt_name varchar(50) not null -- 休假类型名称
);
-- 用户休假记录单
create table LeaveRecord(
lr_id int identity(1,1) primary key,-- 用户休假id
lr_begintime datetime not null,-- 用户请假开始时间
lr_endtime datetime not null,-- 用户请假结束时间
lr_cause varchar(255) not null,-- 休假原因
lt_id int not null,-- 休假类型
as_id int,-- 审核编号
ui_id int not null -- 用户编号，即申请人 
);
-- 缺打卡申请
create table LackCard(
lc_id int identity(1,1) primary key,-- 缺打卡申请编号
lc_date datetime not null,-- 日期
lc_lacktime datetime not null,-- 缺打考勤时间
lc_reportdate datetime not null,-- 上报日期
lc_cause varchar(255) not null,-- 缺打事由
lc_prove varchar(50) not null, --证明人
as_id int,-- 审核编号
ui_id int not null -- 用户编号，即申请人 
);
-- 调休申请
create table ReplaceRest(
rr_id int identity(1,1) primary key,-- 调休申请id
rr_dutydate datetime not null,-- 上班时间
rr_exchangedate datetime not null,-- 倒休日期
rr_jobplan varchar(255) not null, -- 工作安排
as_id int,-- 审核编号
ui_id int not null -- 用户编号，即申请人 
);
-- 外勤申请
create table GoOutside(
go_id int identity(1,1) primary key,-- 外勤申请编号
go_begintime datetime not null,-- 开始时间
go_endtime datetime not null,-- 结束时间
go_address varchar(50) not null,-- 外勤地
go_cause varchar(255) not null,-- 外勤事由
as_id int,-- 审核编号
ui_id int not null -- 用户编号，即申请人 
);
-- 出差申请
create table GoBusiness(
gb_date datetime primary key, -- 出差日期
gb_destination varchar(50) not null,-- 目的地
gb_cause varchar(255) not null,-- 出差事由
gb_begindate datetime not null,-- 出差日期
gb_endresult varchar(100) not null, -- 预计出差归来结果
gb_price varchar(255) not null, -- 所需支持
as_id int,-- 审核编号
ui_id int not null -- 用户编号，即申请人 
);



-- 部门
insert into Section
values('招生部'),('学工部'),('学术部'),('综合办公室'),('就业部'),('领导');
-- 职务
insert into Duty
values('班主任'),('教员'),('讲师'),('技术支持'),('教务'),('班主任'),('就业老师'),('人事行政'),('网络咨询师'),('主任'),('副主任'),('主导储干');
-- 职别
insert into DutyType
values('基层职工'),('基层职员'),('中层管理'),('储备干部');
-- 休假类型
insert into LeaveType
values('病假'),('事假'),('婚假'),('工伤假'),('产检假'),('产假'),('丧假');


