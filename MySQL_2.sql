select * from myemp;
select * from myemp limit 5;
select emp_id, first_name, last_name, salary from myemp limit 3,10; #from 3 to total 10
select emp_id, first_name, last_name,salary, salary*0.15 as bonus from myemp;
select 
emp_id as EMPNO,
first_name as FNAME,
last_name as LNAME,
salary,
salary*0.15 as bonus,
salary+salary*0.15 as total_salary
from myemp;

select distinct dep_id from myemp; #distinct = unique

select * from film;

select filmid,
title, oscarnominations,oscarwins from film;

select budgetdollars, boxofficedollars from film;

select * from person;
select distinct fname,lname from person;

select * from myemp limit 10;

select * from myemp order by salary ;

select * from myemp order by hire_date desc;

select first_name,dep_id from myemp order by dep_id, first_name;

select emp_id, first_name, last_name,salary, salary*0.15 as bonus from myemp order by bonus desc;

select * from myemp where DEP_ID=60;

select * from myemp where HIRE_DATE>='2000-01-01';

select * from myemp where salary between 10000 and 15000;

select * from film;
select title from film where releasedate between '2000-01-01 00:00:00' and '2000-12-31 00:00:00';

select * from film where BudgetDollars>BoxOfficeDollars;

select * from film where BudgetDollars<BoxOfficeDollars;


select * from myemp where dep_id != 80;

select * from myemp where salary>1000 and dep_id=60;

select * from myemp where salary>1000 or dep_id=60;

select * from myemp where dep_id=60 or dep_id=30;

select * from myemp where dep_id in (60,30,80);

select * from myemp where dep_id not in (50,80);

#like command

select * from myemp;

select * from myemp where first_name like 'a%';

select * from myemp where first_name like '%a';

select * from myemp where first_name like 'a%a';

select * from myemp where first_name like '%a%';

select * from myemp where first_name like '% %';

select * from myemp where first_name like 'a_____';

select title from film where title like '%star%';

#Grouping
select * from myemp;

select avg(SALARY) from myemp;

select DEP_ID, avg(SALARY) from myemp group by DEP_ID;

select DEP_ID, avg(SALARY) from myemp group by DEP_ID order by DEP_ID;

select DEP_ID, MGR_ID, avg(SALARY) as avg_sal from myemp group by DEP_ID, MGR_ID order by DEP_ID;

select DEP_ID, count(DEP_ID) from myemp group by DEP_ID order by DEP_ID;

select DEP_ID, MGR_ID from myemp group by DEP_ID, MGR_ID order by DEP_ID;

select DEP_ID, min(salary), max(salary) from myemp group by DEP_ID order by DEP_ID;

use excelr;

select * from film;

select GenreID ,count(title) from film group by GenreID order by GenreID;

select GenreID ,count(*) from film group by GenreID order by GenreID;

#joins

select * from movies;
select * from members;

select * from movies join members on id=movieid;
select * from movies inner join members on id=movieid;
select * from movies join members on movieid=id;

select * from movies inner join members on id=movieid;

select * from movies left join members on id=movieid;

select * from movies right join members on id=movieid;

use excelr;

select * from meals;
select * from drinks;

select mealname, meals.rate, drinkname from meals cross join drinks;

select m.mealname, m.rate, d.drinkname, d.rate from meals as m cross join drinks as d;

select * from myemp; 
select emp.first_name, emp.last_name, mgr.first_name, mgr.last_name from myemp as emp join myemp as mgr on emp.mgr_id=mgr.emp_id;

select emp.emp_id,
emp.first_name as emp_fname, 
emp.last_name as emp_lname, 
mgr.first_name as mgr_fname, 
mgr.last_name as mgr_lname from myemp as emp join myemp as mgr on emp.mgr_id=mgr.emp_id limit 10;

drop table students;

#constrains

create table students(
sid integer unique,
sname varchar(30) not null,
age integer check(age>18),
course varchar(10));

show create table authors;

desc table students;
insert into students values (1,'sampath',23,'mysql');
insert into students values (2,'rama',22,'tableau');
insert into students (sid,sname,age,course) values (3,'laxman',25,'DS');
select * from students; 

drop table authors;
drop table books;
drop table authors;

create table authors (authorid integer primary key, aname varchar(40));
desc authors;

create table books(
bookid integer Primary key,
title varchar(255),
authorid integer,
foreign key (authorid) references authors(authorid)
on delete cascade
on update cascade);

desc books;

insert into Authors values(1,'J K Rowling');
insert into Authors values(2,'Thomas Hardy');
insert into Authors values(3,'Oscar Wilde');
insert into Authors values(4,'Sidney Sheldon');
insert into Authors values(5,'Alistair MacLean');
insert into Authors values(6,'Jane Austen');
insert into Authors values(7,'Chetan Bhagat');
insert into Authors values(8,'Oscar Wilde');

select * from authors;

insert into Books values(1,'Harry Potter and the Philosopher\'s Stone',1);
insert into Books values(2,'Harry Potter and the Chamber of Secrets',1);
insert into Books values(3,'Harry Potter and the Half-Blood Prince',1);
insert into Books values(4,'Harry Potter and the Goblet of Fire',1);

insert into Books values(5,'Night Without End',5);
insert into Books values(6,'Fear is the Key',5);
insert into Books values(7,'Where Eagles Dare',5);

insert into Books values(8,'Sense and Sensibility',6);
insert into Books values(9,'Pride and Prejudice',6);
insert into Books values(10,'Emma',6);
insert into Books values(11,'Five Point Someone',7);
insert into Books values(12,'Two States',7);
insert into Books values(13,'Salome',8);
insert into Books values(14,'The Happy Prince',8);

select * from books;

select books.bookid, books.title, authors.aname from books join authors on books.authorid=authors.authorid;











#auto increment

create table test (id integer primary key auto_increment,
iname varchar(30),
age integer);

desc test;
insert into test values (100,'sampath',25);
insert into test values ('ram',22),('pavan',24);
select * from test;

select * from marks;

select * from movies;
select * from members;

select title, first_name, last_name from movies left join members on movieid=id;
select title, ifnull(first_name,'-') as fname, ifnull(last_name,'-')as lname from movies left join members on movieid=id;


select * from products limit 10;
desc orders;

#date commands

select * from myemp;

select first_name,last_name,hire_date,year(hire_date) from myemp limit 10;
select first_name,last_name,hire_date,year(hire_date),monthname(hire_date),day(hire_date),dayname(hire_date) from myemp limit 10;

