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
  ) as 'Tổng tiền' --      count(khach_hang.ma_khach_hang) as 'Số lượng hợp đồng'
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
