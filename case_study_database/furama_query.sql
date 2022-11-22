use furama_create_table;
-- 2.  Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select 
  * 
from 
  nhan_vien 
where 
  (
    substring_index(nhan_vien.ho_ten, ' ',-1) like 'h%' 
    or substring_index(nhan_vien.ho_ten, ' ',-1) like 't%' 
    or substring_index(nhan_vien.ho_ten, ' ',-1) like 'k%' 
    and length(
      substring_index(nhan_vien.ho_ten, ' ',-1)
    ) <= 15
  );
-- 3.  Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select 
  * 
from 
  khach_hang 
where 
  (
    year(
      curdate()
    ) - year(ngay_sinh) between 18 
    and 50
  ) 
  and (
    dia_chi like '%Đà Nẵng' 
    or dia_chi like '%Quảng Trị'
  );
-- 4.  Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select 
  khach_hang.ma_khach_hang, 
  khach_hang.ho_ten, 
  count(hop_dong.ma_khach_hang) as 'Số lần sử dụng' 
from 
  khach_hang 
  join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
  join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach 
where 
  ten_loai_khach = 'Diamond' 
group by 
  (hop_dong.ma_khach_hang) 
order by 
  count(hop_dong.ma_khach_hang);
-- 5.  Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select 
  khach_hang.ma_khach_hang, 
  khach_hang.ho_ten, 
  loai_khach.ten_loai_khach, 
  hop_dong.ma_hop_dong, 
  dich_vu.ten_dich_vu, 
  hop_dong.ngay_lam_hop_dong, 
  hop_dong.ngay_ket_thuc, 
  (
    ifnull(dich_vu.chi_phi_thue, 0)+(
      ifnull(hop_dong_chi_tiet.so_luong, 0)* ifnull(dich_vu_di_kem.gia, 0)
    )
  ) as 'Tổng tiền' 
from 
  khach_hang 
  join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach 
  left join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
  left join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu 
  left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong 
  left join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem 
group by 
  khach_hang.ma_khach_hang, 
  hop_dong.ma_hop_dong 
order by 
  khach_hang.ma_khach_hang;
-- 6.  Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select 
  dich_vu.ma_dich_vu, 
  dich_vu.ten_dich_vu, 
  dich_vu.dien_tich, 
  dich_vu.chi_phi_thue, 
  loai_dich_vu.ten_loai_dich_vu 
from 
  dich_vu 
  join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu 
where 
  dich_vu.ma_dich_vu not in (
    select 
      hop_dong.ma_dich_vu 
    from 
      hop_dong 
    where 
      hop_dong.ngay_lam_hop_dong between '2021-01-01' 
      and '2021-03-31'
  );
-- 7.  Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select 
  dich_vu.ma_dich_vu, 
  dich_vu.ten_dich_vu, 
  dich_vu.dien_tich, 
  dich_vu.so_nguoi_toi_da, 
  dich_vu.chi_phi_thue, 
  loai_dich_vu.ten_loai_dich_vu 
from 
  dich_vu 
  join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu 
where 
  dich_vu.ma_dich_vu in (
    select 
      hop_dong.ma_dich_vu 
    from 
      hop_dong 
    where 
      hop_dong.ngay_lam_hop_dong between '2020-01-00' 
      and '2020-12-31'
  ) 
  and dich_vu.ma_dich_vu NOT IN (
    select 
      hop_dong.ma_dich_vu 
    from 
      hop_dong 
    where 
      hop_dong.ngay_lam_hop_dong between '2021-01-01' 
      and '2021-12-31'
  );
-- 8.  Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
select 
  ho_ten 
from 
  khach_hang 
group by 
  ho_ten;
select 
  distinct ho_ten 
from 
  khach_hang;
select 
  ho_ten 
from 
  khach_hang a 
union 
select 
  ho_ten 
from 
  khach_hang b;
-- 9.  Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select 
  month(ngay_lam_hop_dong) as thang, 
  count(ma_hop_dong) 
from 
  hop_dong 
where 
  year(ngay_lam_hop_dong) = 2021 
group by 
  thang 
order by 
  thang;
-- 10.  Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select 
  hop_dong.ma_hop_dong, 
  hop_dong.ngay_lam_hop_dong, 
  hop_dong.ngay_ket_thuc, 
  hop_dong.tien_dat_coc, 
  sum(
    ifnull(hop_dong_chi_tiet.so_luong, 0)
  ) as `so_luong_dvdk` 
from 
  hop_dong 
  left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong 
group by 
  hop_dong.ma_hop_dong;
-- 11.  Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select 
  dich_vu_di_kem.ma_dich_vu_di_kem, 
  dich_vu_di_kem.ten_dich_vu_di_kem 
from 
  dich_vu_di_kem 
  join hop_dong_chi_tiet on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem 
  join hop_dong on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong 
  join khach_hang on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
  join loai_khach on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach 
where 
  loai_khach.ten_loai_khach = 'Diamond' 
  and (
    khach_hang.dia_chi like  '%Vinh' 
    or khach_hang.dia_chi like  '%Quảng Ngãi'
  );
-- 12.  Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select 
  hop_dong.ma_hop_dong, 
  nhan_vien.ho_ten as `ho_ten_nhan_vien`, 
  khach_hang.ho_ten as `ho_ten_khach_hang`, 
  khach_hang.so_dien_thoai, 
  dich_vu.ten_dich_vu, 
  sum(
    ifnull(hop_dong_chi_tiet.so_luong, 0)
  ) as `so_luong_dich_vu_di_kem`, 
  hop_dong.tien_dat_coc 
from 
  hop_dong 
  left join nhan_vien on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien 
  left join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang 
  left join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu 
  left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong 
where 
  hop_dong.ma_dich_vu in (
    select 
      hop_dong.ma_dich_vu 
    from 
      hop_dong 
    where 
      hop_dong.ngay_lam_hop_dong between '2020-10-01' 
      and '2020-12-31'
  ) 
  and hop_dong.ma_dich_vu not in (
    select 
      hop_dong.ma_dich_vu 
    from 
      hop_dong 
    where 
      hop_dong.ngay_lam_hop_dong between '2021-01-01' 
      and '2021-06-30'
  ) 
group by 
  hop_dong.ma_hop_dong;
-- 13.  Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
create view demo as 
select 
  dich_vu_di_kem.*, 
  sum(hop_dong_chi_tiet.so_luong) as `so_luong` 
from 
  dich_vu_di_kem 
  join hop_dong_chi_tiet on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem 
group by 
  hop_dong_chi_tiet.ma_dich_vu_di_kem;
select 
  demo.ma_dich_vu_di_kem, 
  demo.ten_dich_vu_di_kem, 
  demo.so_luong 
from 
  demo 
where 
  demo.so_luong = (
    select 
      MAX(demo.so_luong) 
    from 
      demo
  );
-- 14.  Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
select 
  hop_dong.ma_hop_dong, 
  loai_dich_vu.ten_loai_dich_vu, 
  dich_vu_di_kem.ten_dich_vu_di_kem, 
  count(
    ifnull(
      hop_dong_chi_tiet.ma_dich_vu_di_kem, 
      0
    )
  ) as `so_lan_su_dung` 
from 
  hop_dong 
  join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu 
  join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu 
  join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong 
  join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem 
group by 
  hop_dong_chi_tiet.ma_dich_vu_di_kem 
having 
  so_lan_su_dung = 1 
order by 
  hop_dong.ma_hop_dong;
-- 15.  Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select 
  nhan_vien.ma_nhan_vien, 
  nhan_vien.ho_ten, 
  trinh_do.ten_trinh_do, 
  bo_phan.ten_bo_phan, 
  nhan_vien.so_dien_thoai, 
  nhan_vien.dia_chi 
from 
  nhan_vien 
  join trinh_do on nhan_vien.ma_trinh_do = trinh_do.ma_trinh_do 
  join bo_phan on nhan_vien.ma_bo_phan = bo_phan.ma_bo_phan 
  join hop_dong on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien 
where 
  (
    hop_dong.ngay_lam_hop_dong between '2020-01-01' 
    and '2021-12-31'
  ) 
group by 
  nhan_vien.ma_nhan_vien 
having 
  count(hop_dong.ma_nhan_vien) <= 3;
-- 16.  Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
create view nhan_vien_that_bai as 
select 
  nhan_vien.ma_nhan_vien 
from 
  nhan_vien 
where 
  nhan_vien.ma_nhan_vien not in (
    select 
      hop_dong.ma_nhan_vien 
    from 
      hop_dong 
    where 
      hop_dong.ngay_lam_hop_dong between '2019-01-01' 
      and '2021-12-31' 
    group by 
      hop_dong.ma_nhan_vien
  );
set 
  sql_safe_updates = 0;
delete nhan_vien 
from 
  nhan_vien 
  join nhan_vien_that_bai on nhan_vien.ma_nhan_vien = nhan_vien_that_bai.ma_nhan_vien;
-- 17.  Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
-- Tạo View những khách hàng đã đặt phòng với tổng tiền trong năm 2021
create view tong_tien_khach_hang_nam_2021 as 
select 
  khach_hang.ma_khach_hang, 
  khach_hang.ho_ten, 
  year(hop_dong.ngay_lam_hop_dong) as `nam_tinh_toan`, 
  sum(
    (
      ifnull(dich_vu.chi_phi_thue, 0) + ifnull(hop_dong_chi_tiet.so_luong, 0) * ifnull(dich_vu_di_kem.gia, 0)
    )
  ) as `tong_tien` 
from 
  khach_hang 
  join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
  left join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu 
  left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong 
  left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem 
where 
  year(hop_dong.ngay_lam_hop_dong) = 2021 
group by 
  khach_hang.ma_khach_hang;
-- Tiến hành update
update 
  khach_hang 
  join tong_tien_khach_hang_nam_2021 on khach_hang.ma_khach_hang = tong_tien_khach_hang_nam_2021.ma_khach_hang 
set 
  khach_hang.ma_loai_khach = '1' 
where 
  khach_hang.ma_loai_khach = '2' 
  and tong_tien_khach_hang_nam_2021.tong_tien > 10000000;
-- 18.  Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
-- Tạo thêm cột trạng thái cho bảng khách hàng
alter table 
  furama_create_table.khach_hang 
add 
  column `trang_thai` bit default 1 
after 
  `dia_chi`;
-- Tiến hành thay đổi trạng thái
update 
  khach_hang 
  left join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
set 
  khach_hang.trang_thai = b '0' 
where 
  extract(
    year 
    from 
      hop_dong.ngay_lam_hop_dong
  ) < 2021 
  and extract(
    year 
    from 
      hop_dong.ngay_ket_thuc
  ) < 2021;
-- 19.  Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
-- Tạo view các dịch vụ đi kèm được sử dụng năm 2020
create view so_luong_dvdk_2020 as 
select 
  dich_vu_di_kem.ma_dich_vu_di_kem, 
  dich_vu_di_kem.ten_dich_vu_di_kem, 
  dich_vu_di_kem.gia, 
  extract(
    year 
    from 
      hop_dong.ngay_lam_hop_dong
  ) as `nam_su_dung`, 
  sum(hop_dong_chi_tiet.so_luong) as 'tong_so_lan_duoc_su_dung' 
from 
  dich_vu_di_kem 
  join hop_dong_chi_tiet on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem 
  join hop_dong on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong 
  join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu 
group by 
  hop_dong_chi_tiet.ma_dich_vu_di_kem;
-- Tiến hành update
update 
  dich_vu_di_kem 
  join so_luong_dvdk_2020 on dich_vu_di_kem.ma_dich_vu_di_kem = so_luong_dvdk_2020.ma_dich_vu_di_kem 
set 
  dich_vu_di_kem.gia = (dich_vu_di_kem.gia * 2) 
where 
  so_luong_dvdk_2020.tong_so_lan_duoc_su_dung > 10 
  and so_luong_dvdk_2020.nam_su_dung = 2020;
-- 20.  Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select 
  nhan_vien.ma_nhan_vien as `id`, 
  nhan_vien.ho_ten, 
  nhan_vien.email, 
  nhan_vien.so_dien_thoai, 
  nhan_vien.ngay_sinh, 
  nhan_vien.dia_chi 
from 
  nhan_vien 
union all 
select 
  khach_hang.ma_khach_hang, 
  khach_hang.ho_ten, 
  khach_hang.email, 
  khach_hang.so_dien_thoai, 
  khach_hang.ngay_sinh, 
  khach_hang.dia_chi 
from 
  khach_hang;
