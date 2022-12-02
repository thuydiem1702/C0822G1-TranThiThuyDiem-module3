drop database demo;
create database if not exists demo;
use demo;

create table users (
 id  int(3) auto_increment,
 name varchar(120),
 email varchar(220),
 country varchar(120),
 primary key(id)
);
insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');