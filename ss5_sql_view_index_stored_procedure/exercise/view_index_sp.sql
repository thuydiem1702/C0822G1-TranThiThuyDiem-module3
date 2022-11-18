drop database view_index_sp;
create database if not exists view_index_sp;
use view_index_sp;

create table product(
id int primary key auto_increment,
product_code int,
product_name varchar(50),
product_price double,
product_amount int,
product_description text,
product_status varchar(50)
);

insert into product(product_code,product_name,product_price,product_amount,product_description,product_status)
values (11,'Bơ',10.0,1,'Bơ Mỹ','Bao ngon'),
       (12,'Hồng',15.0,1,'Hồng NB','Oishiyo'),
       (13,'Dưa hấu',30.0,1,'Dưa VN','Ngon bổ rẻ');

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create index i_code on product(product_code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index i_name_price on product(product_name,product_price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from product where product_code = 11;
explain select * from product where product_name ='Bơ' and product_price = 15.0;

-- So sánh câu truy vấn trước và sau khi tạo index

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view w_product as 
select product_code,product_name,product_price,product_status from product;
select * from w_product;

-- Tiến hành sửa đổi view  
update w_product set product_name = 'Bơ Bơ' where product_code = 13;

-- Tiến hành xoá view
drop view w_product;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure sp_product()
begin
select * from product;
end //
delimiter ;
call sp_product();

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure sp_add_product()
begin
insert into product(product_code,product_name,product_price,product_amount,product_description,product_status)
values (14,'Nận',10.9,1,'Nậnnnnnn','><');
select * from product;
end //
delimiter ;
call sp_add_product ;

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure sp_update_product()
begin
update product set product_name = 'nậnnnnnn' where id = 3;
select * from product;
end //
delimiter ;
call sp_update_product ;

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure sp_delete_product()
begin
delete product from product where id = 3;
select * from product;
end //
delimiter ;
call sp_delete_product ;
       