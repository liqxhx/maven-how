-- create table space
--为项目单独建一个表空间
create tablespace ims_tbs datafile '/u01/oracle/oradata/LQHDB01/datafile/ims-tbs01.dbf' size 10m;
--临时表空间使用当前用户默认的临时表空间
create temporary tablespace temp_ims_tbs tempfile '/u01/oracle/oradata/LQHDB01/datafile/temp-ims-tbs01.dbf' size 10m;
alter database tempfile '/u01/oracle/oradata/LQHDB01/datafile/temp-ims-tbs01.dbf' resize 50m;
--extend 1
--extend auto
--select AUTOEXTENSIBLE from dba_data_files where tablespace_name=‘SRTBS’;
--alter database datafile ‘/u01/app/oracle/oradata/lqhdb/siglent-reserve-tbs01.dbf’ autoextend on;

--extend 2
--alter database datafile '/u01/app/oracle/oradata/lqhdb/siglent-reserve-tbs01.dbf' resize 20m;

--extend 3
--alter tablespace srtbs add datafile '/u01/app/oracle/oradata/lqhdb/siglent-reserve-tbs02.dbf' size 10m;

-- create user
--drop user ims cascade;
create user ims identified by ims default tablespace ims_tbs temporary tablespace temp_ims_tbs quota unlimited on ims_tbs;

-- grant
grant connect,resource to ims with admin option;


--表数据倒入倒出
exp lqh/lqh tables=T_CUSTOMERS,T_SALES,T_RESERVE_INFOS,T_RESERVE_DETAILS,T_DISTRIBUTIONS,T_DIS_DETAILS,T_LOCKS rows=Y file=~/t1.dmp log=~/t1.log
scp ~/t1.dmp oracle@192.168.1.5:~/
imp sys/oracle file=~/t1.dmp fromuser=lqh touser=ims log=~/imp.log

--建序列
select 'create sequence ims.' || SEQUENCE_NAME || ' minvalue ' ||
       MIN_VALUE || ' maxvalue ' || MAX_VALUE || ' start with ' ||
       LAST_NUMBER || ' increment by ' || INCREMENT_BY || ' cache ' ||
       CACHE_SIZE || ' ;'
  from dba_sequences
 where SEQUENCE_OWNER = 'LQH';