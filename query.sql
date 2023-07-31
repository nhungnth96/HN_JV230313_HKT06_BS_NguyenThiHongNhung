use studentManagement;

-- 1.	 Hiển thị danh sách gồm MaSV, HoTên, MaLop, DiemHP, MaHP của những sinh viên có điểm HP >= 5     (5đ)
select sv.maSV, sv.hoTen, sv.maLop, dhp.diemHP, dhp.maHP
from sinhvien sv
join diemhp dhp on dhp.masv = sv.masv
where dhp.diemHP >= 5;

-- 2.	Hiển thị danh sách MaSV, HoTen, MaLop, MaHP, DiemHP, MaHP được sắp xếp theo ưu tiên MaLop, HoTen tăng dần. (5đ)
select sv.maSV, sv.hoTen, sv.maLop, dhp.diemHP, dhp.maHP
from sinhvien sv
join diemhp dhp on dhp.masv = sv.masv
where dhp.diemHP >= 5
order by sv.maSV, sv.Malop, sv.hoTen ;

-- 3.	Hiển thị danh sách gồm MaSV, HoTen, MaLop, DiemHP, HocKy của những sinh viên có DiemHP từ 5  7 ở học kỳ I. (5đ)
select sv.maSV, sv.hoTen, sv.maLop, dhp.diemHP, dmhp.HocKy
from sinhvien sv
join diemhp dhp on dhp.masv = sv.masv
join dmhocphan dmhp on dmhp.mahp = dhp.mahp
where dhp.diemHp between 5 and 7 and dmhp.HocKy = 1;

-- 4.	Hiển thị danh sách sinh viên gồm MaSV, HoTen, MaLop, TenLop, MaKhoa của Khoa có mã CNTT (5đ)
select sv.maSV, sv.hoTen, sv.maLop, l.tenLop, k.maKhoa
from sinhvien sv
join dmlop l on l.malop = sv.malop
join nganh n on n.manganh = l.manganh
join dmkhoa k on k.makhoa = n.makhoa
where k.makhoa = 'CNTT';

-- 5.	Cho biết MaLop, TenLop, tổng số sinh viên của mỗi lớp (SiSo): (5đ)
select sv.malop, l.tenlop, count(sv.malop) as siSo
from sinhvien sv
join dmlop l on l.malop = sv.malop
group by sv.malop;

-- 6.	Cho biết điểm trung bình chung của mỗi sinh viên ở mỗi học kỳ, biết công thức tính DiemTBC như sau:
-- DiemTBC = ∑▒〖(DiemHP*Sodvhp)/∑(Sodvhp)〗
select dmhp.hocKy, dhp.maSV, sum(dhp.Diemhp*dmhp.sodvht)/sum(dmhp.sodvht) as DiemTBC
from dmhocphan dmhp
join diemhp dhp on dhp.mahp = dmhp.mahp
group by dhp.maSV, dmhp.hocKy
order by dhp.maSV;

-- 7.	Cho biết MaLop, TenLop, số lượng nam nữ theo từng lớp.
select sv.maLop, l.tenLop, case 
        when sv.gioiTinh = 0 then 'Nữ'
        when sv.gioiTinh = 1 then 'Nam'
        else 'Khác'
    end as gioiTinh, count(*) as soLuong
from sinhvien sv
join dmlop l on l.malop = sv.malop
group by sv.gioiTinh, sv.maLop;

-- 8.	Cho biết điểm trung bình chung của mỗi sinh viên ở học kỳ 1
select dhp.maSV, sum(dhp.Diemhp*dmhp.sodvht)/sum(dmhp.sodvht) as DiemTBC
from dmhocphan dmhp
join diemhp dhp on dhp.mahp = dmhp.mahp
group by dhp.maSV, dmhp.hocKy
having dmhp.hocKy = 1;
-- 9.	Cho biết MaSV, HoTen, Số các học phần thiếu điểm (DiemHP<5) của mỗi sinh viên
select sv.maSV, sv.hoTen, count(dhp.maHP) as sLuong
from sinhvien sv
join diemhp dhp on dhp.masv = sv.masv
where dhp.diemHP <=5
group by sv.maSV;
-- 10.	Đếm số sinh viên có điểm HP <5 của mỗi học phần
select dhp.mahp, count(dhp.masv) as SL_SV_Thieu
from diemhp dhp
where dhp.diemHP <=5
group by dhp.mahp;
-- 11.	Tính tổng số đơn vị học trình có điểm HP<5 của mỗi sinh viên
select dhp.masv, sv.hoTen, sum(dmhp.sodvht)
from diemhp dhp
join sinhvien sv on dhp.masv = sv.masv
join dmhocphan dmhp on dmhp.mahp = dhp.mahp
where dhp.diemHP < 5
group by dhp.masv
order by dhp.masv;
-- 12.	Cho biết MaLop, TenLop có tổng số sinh viên >2.
select sv.malop, l.tenlop, count(sv.malop) as siSo
from sinhvien sv
join dmlop l on l.malop = sv.malop
group by sv.malop
having siSo>2;
-- 13.	Cho biết HoTen sinh viên có ít nhất 2 học phần có điểm <5. (10đ)
select dhp.masv,sv.hoten, count(dhp.mahp) as soLuong
from sinhvien sv
join diemhp dhp on dhp.masv = sv.masv
where dhp.diemhp < 5
group by dhp.masv
having soLuong >= 2;
 
-- 14.	Cho biết HoTen sinh viên học ít nhất 3 học phần mã 1,2,3 (10đ)
select sv.hoten, count(dhp.mahp) as soLuong
from sinhvien sv
join diemhp dhp on dhp.masv = sv.masv
where dhp.mahp = 1 or dhp.mahp = 2 or dhp.mahp = 3
group by dhp.masv
having soLuong >= 3;