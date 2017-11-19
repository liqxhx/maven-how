drop sequence seq_t_customers;
drop sequence seq_t_sales;
drop sequence seq_t_reserve_infos;
drop sequence seq_t_reserve_details;
drop sequence seq_t_distributions;
drop sequence seq_t_dis_details;
drop sequence seq_t_locks;

--为每张表创建一个序列
create sequence seq_t_customers
minvalue 1
maxvalue 9999999
start with 1
increment by 1
cache 20;


create sequence seq_t_sales
minvalue 1
maxvalue 9999999
start with 1
increment by 1
cache 20;

create sequence seq_t_reserve_infos
minvalue 1
maxvalue 9999999
start with 1
increment by 1
cache 20;

create sequence seq_t_reserve_details
minvalue 1
maxvalue 9999999
start with 1
increment by 1
cache 20;

create sequence seq_t_distributions
minvalue 1
maxvalue 9999999
start with 1
increment by 1
cache 20;

create sequence seq_t_dis_details
minvalue 1
maxvalue 9999999
start with 1
increment by 1
cache 20;

create sequence seq_t_locks
minvalue 1
maxvalue 9999999
start with 1
increment by 1
cache 20;
--删除表
drop table t_locks;
drop table t_reserve_details;
drop table t_reserve_infos;
drop table t_dis_details;
drop table t_distributions;
drop table t_customers;
drop table t_user_role;
drop table t_sales ;
drop table t_roles;
-------------------------------------------------------------------------------------
--1 创建客户表
create table t_customers (
	id 			number(7) 		  constraint t_cstmr_id_pk primary key,
	name 		varchar2(128) 	constraint t_cstmr_nm_nn not null,
	status	number(1),
  descn 	varchar2(4000)
);
comment on column t_customers.id 	is '客户表ID';
comment on column t_customers.name 	is '客户名称';
comment on column t_customers.status 	is '1启用,0禁用';
comment on column t_customers.descn 	is '客户描述';
-------------------------------------------------------------------------------------
--2 创建销售人员表
create table t_sales(
	id 			number(7) 			constraint t_sal_id_pk 	primary key,
	name 		varchar2(128) 		constraint t_sal_nm_nn 	not null,
	password 	varchar2(128) 		constraint t_sal_pwd_nn not null,
	error_count	number(2)			default 0,
	status 		number(1)			default 1,
	last_login_time	date,
    descn 		varchar2(4000)
);
comment on column t_sales.id 		is '销售人员表ID';
comment on column t_sales.name 		is '公司销售人员名称';
comment on column t_sales.password 	is '销售人员登录系统时的密码';
comment on column t_sales.error_count 	is '销售人员错误登录次数';
comment on column t_sales.status 	is '1启用,0禁用';
comment on column t_sales.last_login_time 	is '最后一次成功登录时间';
comment on column t_sales.descn 	is '描述信息';
-------------------------------------------------------------------------------------
--3 创建预留信息表
create table t_reserve_infos(
	id 			number(7) 		constraint t_rsv_if_id_pk 		primary key,
	name 		varchar2(128)	constraint t_rsv_if_nm_nn 		not null,
	left 		number(7)		constraint t_rsv_if_left_nn 	not null,
	reservable 	number(1)		constraint t_rsv_if_rsvable_ch 	check(reservable in(1,0)),
	reserve		number(7)		constraint t_rsv_if_rsv_nn 		not null,
	reserved	number(7)		constraint t_rsv_if_rsvd_nn 	not null,
	last_update_time			date default sysdate
);
comment on column t_reserve_infos.id			is	'预留信息表ID';
comment on column t_reserve_infos.name			is	'产品名称';
comment on column t_reserve_infos.left			is	'产品剩余数';
comment on column t_reserve_infos.reservable	is	'是否可预留：1可预留，0不能预留';
comment on column t_reserve_infos.reserve		is	'可预留数';
comment on column t_reserve_infos.reserved		is	'已预留数';
comment on column t_reserve_infos.last_update_time		is	'量后一次更新时间';
-------------------------------------------------------------------------------------
--4 预留明细表t_reserve_details
create table t_reserve_details(
	id 				number(7) 	 constraint t_rsv_dtl_id_pk 			primary key,
	reserveinfo_id 	number(7) 	 constraint t_rsv_dtl_resinfoid_fk  	references t_reserve_infos(id),
	sale_id			number(7) 	 constraint t_rsv_dtl_saleid_fk  		references t_sales(id),
	customer_id 	number(7) ,
	reserve			number(7)	 constraint t_rsv_dtl_rsv_nn 			not null,
	reserve_status	number(1)	,-- constraint t_rsv_dtl_stu_ch			check(reserve_status in(-1,1,0)),
	enable			number(1),
	reserve_time 				 date		 default sysdate,
	last_update_time			 date 		 default sysdate
) ;
comment on column t_reserve_details.id 				is '预留明细表ID';
comment on column t_reserve_details.reserveinfo_id 	is '预留信息表ID，表示预留哪个产品';
comment on column t_reserve_details.sale_id 		is '销售人员表ID，表示谁作的预留';
comment on column t_reserve_details.customer_id 	is '客户表ID，表示预留给谁';
comment on column t_reserve_details.reserve 		is '本次预留数';
comment on column t_reserve_details.reserve_status 	is '预留状态：1预留成功，-1预留失败，0已发货';
comment on column t_reserve_details.enable 	is 		'数据是否有效：1有效，0已删除或取消预留';
comment on column t_reserve_details.reserve_time 	is '预留时间，默认数据入库时间';
comment on column t_reserve_details.last_update_time 	is '最后一次修改时间';
-------------------------------------------------------------------------------------
--5 发货表t_distributions
create table t_distributions(
	id					number(7) 		constraint t_dis_id_pk 		primary key,
	express_cmp_nm 		varchar2(128),
	courier_number 		varchar2(128),
	delivery_time  		date 			default sysdate,
	reserve_detail_id 	number(7)		references t_reserve_details(id),
	real_num			number(7),
	delivery_sale_id	number(7) 		references t_sales(id),
	last_update_time 	date 		 	default sysdate
);
comment on column t_distributions.id 				is '发货表ID';
comment on column t_distributions.express_cmp_nm 	is '快递公司名称';
comment on column t_distributions.courier_number 	is '快递号';
comment on column t_distributions.delivery_time 	is '发货日期';
comment on column t_distributions.reserve_detail_id	is '预留明细表ID';
comment on column t_distributions.real_num 			is '实际发货数';
comment on column t_distributions.delivery_sale_id 			is '发货人ID';
comment on column t_distributions.last_update_time 			is '最后一次修改时间';
-------------------------------------------------------------------------------------
--6 发货明细表 t_dis_details
create table t_dis_details(
	id		number(7) 		constraint t_dd_id_pk 		primary key,
	dis_id	number(7) 		constraint t_dd_did_fk 		references t_distributions(id),
	prd_sn  varchar2(128)
) ;
comment on column t_dis_details.id 				is '发货明细表发货表ID';
comment on column t_dis_details.dis_id 			is '发货表ID';
comment on column t_dis_details.prd_sn 			is '产品序列号';

--7 lock
create table t_locks(
id number(7) constraint t_lock_id_pk primary key,
sale_id number(7),
lock_time date default sysdate,
reserveinfo_id number(7)
);
comment on column t_locks.id is '锁定表ID';
comment on column t_locks.reserveinfo_id is '锁定预留信息表的ID';
comment on column t_locks.sale_id is '锁定人';
comment on column t_locks.lock_time is '锁定时间';
-----------------------------
--角色
create table t_roles(
    id number(7) primary key ,
    name varchar2(128),
    descn varchar2(256)
);
--用户角色连接表
create table t_user_role(
    user_id number(7) references t_sales(id),
    role_id number(7) references t_roles(id)
);
--------------------------------------------------
insert into t_sales(id,name,password,status,descn) values(1,'admin','0570566bfb2ca3080935a8c65dfe5b90',1,'管理员');
insert into t_sales(id,name,password,status,descn) values(2,'lqh','bdbadbcea9b3c594d7e4d766b6d3c807',1,'用户');
insert into t_sales(id,name,password,status,descn) values(3,'zkq','385825c2f52c9d44a502252a697f3c9c',1,'用户');


insert into t_customers(id,name,status) values(1,'张三',1);
insert into t_customers(id,name,status) values(2,'李四',1);
insert into t_customers(id,name,status) values(2,'王五',1);
insert into t_customers(id,name,status) values(2,'赵六',1);

insert into T_RESERVE_INFOS(id,name,left,reservable,reserve,reserved) values(100,'电流表',1000,1,1000,0);
insert into T_RESERVE_INFOS(id,name,left,reservable,reserve,reserved) values(101,'电压表',2000,1,1899,101);
insert into T_RESERVE_INFOS(id,name,left,reservable,reserve,reserved) values(102,'示波器',3000,0,3000,0);
insert into T_RESERVE_INFOS(id,name,left,reservable,reserve,reserved) values(103,'test',4000,0,0,4000);
insert into T_RESERVE_INFOS(id,name,left,reservable,reserve,reserved) values(104,'aaa',5,0,0,5);
insert into T_RESERVE_INFOS(id,name,left,reservable,reserve,reserved) values(105,'bbb',6,1,6,0);
insert into T_RESERVE_INFOS(id,name,left,reservable,reserve,reserved) values(1,'ccc',1,1,1,0);
insert into T_RESERVE_INFOS(id,name,left,reservable,reserve,reserved) values(2,'ddd',100,1,69,31);
insert into T_RESERVE_INFOS(id,name,left,reservable,reserve,reserved) values(3,'eee',1000,0,999,1);
insert into T_RESERVE_INFOS(id,name,left,reservable,reserve,reserved) values(4,'abc',1000,1,1000,0);
insert into T_RESERVE_INFOS(id,name,left,reservable,reserve,reserved) values(5,'liqxhx',1,1,1,0);



insert into t_roles(id,name,descn) values(1,'ROLE_ADMIN','管理员角色');
insert into t_roles(id,name,descn) values(2,'ROLE_USER','用户角色');

insert into t_user_role(user_id,role_id) values(1,1);
insert into t_user_role(user_id,role_id) values(1,2);
insert into t_user_role(user_id,role_id) values(2,2);
insert into t_user_role(user_id,role_id) values(3,2);