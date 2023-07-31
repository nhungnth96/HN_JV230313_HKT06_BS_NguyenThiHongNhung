create database studentManagement;
use studentManagement;
create table dmkhoa(
maKhoa varchar(20) primary key,
tenKhoa varchar(255)
);
create table nganh(
maNganh int primary key,
tenNganh varchar(255),
maKhoa varchar(20),
foreign key (maKhoa) references dmkhoa(maKHoa)
);
create table dmlop(
maLop varchar(20) primary key,
tenLop varchar(255),
maNganh int,
khoaHoc int,
heDT varchar(255),
namNhapHoc int,
foreign key (maNganh) references nganh(maNganh)
);
create table sinhvien(
maSV int primary key,
hoTen varchar(255),
maLop varchar(20),
gioiTinh tinyint(1),
ngaySinh date,
diaChi varchar(255),
foreign key (maLop) references dmlop(maLop)
);

create table dmhocphan(
maHP int primary key,
tenHP varchar(255),
sodvht int,
maNganh int,
hocKy int,
foreign key (maNganh) references nganh(maNganh)
);
create table diemhp(
maSV int,
maHP int,
diemHP float,
foreign key (maSV) references sinhvien(maSV),
foreign key (maHP) references dmhocphan(maHP)
);
INSERT INTO dmkhoa VALUES ('CNTT', 'Công nghệ thông tin');
INSERT INTO dmkhoa VALUES ('KT', 'Kế Toán');
INSERT INTO dmkhoa VALUES ('SP', 'Sư phạm');

INSERT INTO nganh VALUES ('140902', 'Sư phạm toán tin', 'SP');
INSERT INTO nganh VALUES ('480202', 'Tin học ứng dụng', 'CNTT');

INSERT INTO dmlop VALUES ('CT11', 'Cao đẳng tin học', '480202', '11', 'TC', '2013');
INSERT INTO dmlop VALUES ('CT12', 'Cao đẳng tin học', '480202', '12', 'CĐ', '2013');
INSERT INTO dmlop VALUES ('CT13', 'Cao đẳng tin học', '480202', '13', 'TC', '2014');

INSERT INTO dmhocphan VALUES ('1', 'Toán cao cấp A1', '4', '480202', '1');
INSERT INTO dmhocphan VALUES ('2', 'Tiếng anh 1', '3', '480202', '1');
INSERT INTO dmhocphan VALUES ('3', 'Vật lý đại cương', '4', '480202', '1');
INSERT INTO dmhocphan VALUES ('4', 'Tiếng anh 2', '7', '480202', '1');
INSERT INTO dmhocphan VALUES ('5', 'Tiếng anh 1', '3', '140902', '2');
INSERT INTO dmhocphan VALUES ('6','Xác suất thống kê', '3', '480202', '2');

INSERT INTO sinhvien VALUES ('1', 'Phan Thanh', 'CT12', '0', '19900912', 'Tuy Phước');
INSERT INTO sinhvien VALUES ('2', 'Nguyễn Thị Cẩm', 'CT12', '1', '19940112', 'Quy Nhơn');
INSERT INTO sinhvien VALUES ('3', 'Võ Thị Hà', 'CT12', '1', '19950702', 'An Nhơn');
INSERT INTO sinhvien VALUES ('4', 'Trần Hoài Nam', 'CT12', '0', '19940405', 'Tây Sơn');
INSERT INTO sinhvien VALUES ('5', 'Trần Văn Hoàng', 'CT13', '0', '19950804', 'Vĩnh Thạnh');
INSERT INTO sinhvien VALUES ('6', 'Đặng Thị Thảo', 'CT13', '1', '19950612', 'Quy Nhơn');
INSERT INTO sinhvien VALUES ('7', 'Lê Thị Sen', 'CT13', '1', '19940812', 'Phù Mỹ');
INSERT INTO sinhvien VALUES ('8', 'Nguyễn Văn Huy', 'CT11', '0', '19950604', 'Tuy Phước');
INSERT INTO sinhvien VALUES ('9', 'Trần Thị Hoa', 'CT11', '1', '19940809', 'Hoài Nhơn');

INSERT INTO diemhp VALUES ('2','2','5.9');
INSERT INTO diemhp VALUES ('2','3','4.5');
INSERT INTO diemhp VALUES ('3','1','4.3');
INSERT INTO diemhp VALUES ('3','2','6.7');
INSERT INTO diemhp VALUES ('3','3','7.3');
INSERT INTO diemhp VALUES ('4','1','4');
INSERT INTO diemhp VALUES ('4','2','5.2');
INSERT INTO diemhp VALUES ('4','3','3.5');
INSERT INTO diemhp VALUES ('5','1','9.8');
INSERT INTO diemhp VALUES ('5','2','7.9');
INSERT INTO diemhp VALUES ('5','3','7.5');
INSERT INTO diemhp VALUES ('6','1','6.1');
INSERT INTO diemhp VALUES ('6','2','5.6');
INSERT INTO diemhp VALUES ('6','3','4');
INSERT INTO diemhp VALUES ('7','1','6.2');


