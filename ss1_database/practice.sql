create database if not exists `my_database1`;
use my_database1;
create table student(
  id int primary key, 
  `name` varchar(50), 
  age int, 
  country varchar(50)
);
select 
  * 
from 
  student;
insert into student value(1, Lan, 18, QB);
