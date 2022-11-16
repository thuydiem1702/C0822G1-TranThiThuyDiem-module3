drop 
  database quan_li_ban_hang;
use quan_li_ban_hang;
insert into customer 
values 
  (1, 'Minh Quan', 10), 
  (2, 'Ngoc Oanh', 20), 
  (3, 'Hong Ha', 50);
insert into `order` (o_id, c_id, o_date, o_total_price) 
values 
  (1, 1, '2006-03-21', null), 
  (2, 2, '2006-03-23', null), 
  (3, 1, '2006-03-16', null);
insert into product 
values 
  (1, 'May Giat', 3), 
  (2, 'Tu Lanh', 5), 
  (3, 'Dieu Hoa', 7), 
  (4, 'Quat', 1), 
  (5, 'Bep Dien', 2);
insert into order_detail 
values 
  (1, 1, 3), 
  (1, 3, 7), 
  (1, 4, 2), 
  (2, 1, 1), 
  (3, 1, 8), 
  (2, 5, 4), 
  (2, 3, 3);
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order       
select 
  o_id, 
  o_date, 
  o_total_price 
from 
  `order`;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select 
  c.c_id, 
  c_name, 
  product.p_name 
from 
  customer c 
  join `order` on `order`.c_id = c.c_id 
  join order_detail on order_detail.o_id = `order`.o_id 
  join product on product.p_id = order_detail.p_id;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select 
  c.c_name 
from 
  customer c 
where 
  c.c_id not in(
    select 
      c.c_id 
    from 
      customer c 
      join `order` on `order`.c_id = c.c_id 
      join order_detail on order_detail.o_id = `order`.o_id 
      join product on product.p_id = order_detail.p_id
  );
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select 
  o.o_id, 
  o_date, 
  sum(od_qty * p.p_price) 
from 
  `order` o 
  join order_detail od on o.o_id = od.o_id 
  join product p on od.p_id = p.p_id 
group by 
  o.o_id;
