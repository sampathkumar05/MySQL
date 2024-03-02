show databases;
create database ExcelR;
use excelr;
show tables;

create table students(
sid integer,
sname char(30),
age integer,
course char(30));

desc students;

insert into students values(1,'shiva',25,'analytics');
insert into students values(2,'krishna',25,'MySQL');

select * from students;


create table patients(
pid integer,
pname varchar(30),
bod date,
toa datetime);

insert into patients values(196,'ramesh','1999-08-16','2024-01-03 09:25:30');
insert into patients values(197,'rakesh','2000-08-16','2024-01-15 23:35:30');

select * from patients;
select * from students;
alter table students add column marks integer;
alter table students drop column age;
alter table students change column sid stdid integer;
desc students;
alter table students modify column sname varchar(30);
alter table students rename to myclass;
show tables;

rename table myclass to students;

create table temp(id_no integer, pname varchar(30));
drop table temp;

insert into students values(3,'balaji','mysql',50);
insert into students values(4,'ram',null,50);
insert into students (stdid,sname,course) values(5,'lakshman','datascience');
insert into students values(6,'balaram','mysql',67),(7,'lalitha','fullstack',62),(8,'devi','devops',63);
select * from students;

set sql_safe_updates=0;

update students set sname='tharun' where stdid=1;

update students set marks=60 where sname='ram';

update students set marks=0 where marks is null;

update students set course='Analytics',marks=58 where stdid=3;

#transactions
create table tt (id char);
start transaction;

insert into tt values ('a'),('b');
savepoint sp;
insert into tt values ('c'),('d');
savepoint sd;
insert into tt values ('e'),('f');

select * from tt;
rollback to sd;