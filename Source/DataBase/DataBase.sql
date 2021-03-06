﻿USE master;
GO
ALTER DATABASE QUAN_LY_QUAN_CAPHE SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO
drop database QUAN_LY_QUAN_CAPHE
go
create database QUAN_LY_QUAN_CAPHE
go
use QUAN_LY_QUAN_CAPHE
go

create table NhanVien
(
	MANV varchar(30) primary key,
	HOTEN nvarchar(100) NOT NULL,
	LUONG float,
	NGSINH date,    
	PHAI nvarchar(5) Check (PHAI IN('Nam','Nữ')),                                                                           
	CMND varchar(30),
	DIACHI nvarchar(100),
	DIENTHOAI varchar(30),
	CHUCVU nvarchar(30),
	HINHANH image,
	TAIKHOAN varchar(30),
	MATKHAU varchar(50),
	ISDEL int DEFAULT 0,
	CREADTEDAT datetime,
	UPDATEDAT datetime
)

create table MonAn
(
	MAMON varchar(30) primary key,
	TENMON nvarchar(100),
	GIA float not null,
	MOTA nvarchar(200) not null,
	MALOAI varchar(30) not null,
	HINHANH image,
	TTSP nvarchar(30),
	ISDEL int DEFAULT 0,
	CREADTEDAT datetime,
	UPDATEDAT datetime
)
create table LoaiMonAn
(
	MALOAI varchar(30) primary key,
	TENLOAI nvarchar(100),
	ISDEL int DEFAULT 0,
	CREADTEDAT datetime,
	UPDATEDAT datetime
)
create table DonHang
(
	MADH int primary key,
	MANV varchar(30),
	TONGTIEN float not null,
	TENKH nvarchar(30),
	ISDEL int DEFAULT 0,
	CREADTEDAT datetime,
	UPDATEDAT datetime
)
create table ChiTietDonhang
(
	MADH int not null,
	ID int not null,
	MAMON VARCHAR(30) not null,
	SOLUONG  FLOAT not null,
	DONGIA FLOAT not null,
	THANHTIEN  FLOAT not null,
	GIAMGIA FLOAT not null,
	ISDEL int DEFAULT 0,
	CREADTEDAT datetime,
	UPDATEDAT datetime,
	PARENTID int,
	PARENTMADH int
)
create table LichLamViec
(
	MANV  varchar(30) not null,
	THU nvarchar(30) not null,
	MACALV varchar(30) not null,
	PHUCAP float,
	ISDEL int DEFAULT 0,
	CREADTEDAT datetime,
	UPDATEDAT datetime
)
create table CaLamViec
(
	MACALV varchar(30) primary key,
	TENCA nvarchar(30),
	GIOBATDAU time,
	GIOKETTHUC time,
	ISDEL int DEFAULT 0,
	CREADTEDAT datetime,
	UPDATEDAT datetime
)
--tạo khóa ngoại cho bảng đơn hàng
alter table DonHang add
	constraint FK_DH_NV foreign key (MANV)
	references NhanVien (MANV)
GO	
-- tạo khóa chính, ngoại cho bảng lịch làm việc
alter table LichLamViec add 
	PRIMARY KEY(MANV,THU,MACALV)
 
 alter table LichLamViec add
	constraint FK_LLV_CLV foreign key (MACALV)
	references CaLamViec (MACALV)
GO	
 
 alter table LichLamViec add
	constraint FK_LLV_NV foreign key (MANV)
	references NhanVien (MANV)
GO	
-- tạo khóa chính, ngoại cho bảng chi tiết đơn hàng
alter table ChiTietDonHang add 
	PRIMARY KEY(MADH,ID)
GO
alter table ChiTietDonHang add
	constraint FK_CTDH_DH foreign key (MADH)
	references DonHang (MADH)
GO
alter table ChiTietDonHang add
	constraint FK_CTDH_OPTION_CTDH foreign key (PARENTMADH, PARENTID)
	references ChiTietDonHang (MADH, ID)
GO	
alter table ChiTietDonHang add
	constraint FK_CTDH_MA foreign key (MAMON)
	references MonAn (MAMON)
GO	
-- tạo khóa ngoại cho bảng món ăn
alter table MonAn add
	constraint FK_MA_LMA foreign key (MALOAI)
	references LoaiMonAn (MALOAI)
GO	



insert into NhanVien (MANV,HOTEN,LUONG,NGSINH,PHAI,DIACHI,CMND,DIENTHOAI,CHUCVU,TAIKHOAN ,MATKHAU,ISDEL,CREADTEDAT,UPDATEDAT)
values ('NV02',N'Nguyễn Hoàng Quyên',2000,CAST(N'1959-06-20' AS Date),'Nam',N'167 Lương Nhữ Học Phường 11 Quận 5 HCM','1','0978966563','Admin','1','6fd742a61bd034804c00c49b18045020',0,CAST(N'1959-06-20' AS Date),CAST(N'1959-06-20' AS Date)),
('NV01',N'Trương Văn Tú',2000,CAST(N'1959-06-20' AS Date),'Nam',N'167 Lương Nhữ Học Phường 11 Quận 5 HCM','123456','0978966563','Admin','admin','db69fc039dcbd2962cb4d28f5891aae1',0,CAST(N'1959-06-20' AS Date),CAST(N'1959-06-20' AS Date))

insert into NhanVien (MANV,HOTEN,LUONG,NGSINH,PHAI,DIACHI,CMND,DIENTHOAI,CHUCVU,TAIKHOAN ,MATKHAU,ISDEL,CREADTEDAT,UPDATEDAT)
values ('NV03',N'Nguyễn Chánh Anh Tuấn',2000,CAST(N'1959-06-20' AS Date),'Nam',N'167 Lương Nhữ Học Phường 11 Quận 5 HCM','123456','0978966563','Nhân viên','nhanvien','db69fc039dcbd2962cb4d28f5891aae1',0,CAST(N'1959-06-20' AS Date),CAST(N'1959-06-20' AS Date))



--newest
--SELECT*FROM LoaiMonAn
--DELETE TOP(25) FROM MonAn
--DELETE TOP(4) FROM LoaiMonAn
--SELECT*FROM MonAn

insert into LoaiMonAn(MALOAI, TENLOAI, ISDEL, CREADTEDAT, UPDATEDAT)
values ('1', N'TRÀ SỮA', NULL, CAST(N'2017-06-20' AS Date), CAST(N'2017-07-20' AS Date)),
('2', N'TRÀ NGUYÊN CHẤT', NULL,CAST(N'2017-06-20' AS Date), CAST(N'2017-07-20' AS Date)),
('3', N'THỨC UỐNG ĐÁ XAY', NULL, CAST(N'2017-06-20' AS Date), CAST(N'2017-07-20' AS Date)),
('4', N'CÁC LOẠI HẠT', NULL, CAST(N'2017-06-20' AS Date), CAST(N'2017-07-20' AS Date))

insert into MonAn (MAMON,TENMON, GIA, MOTA, MALOAI, TTSP, ISDEL, CREADTEDAT, UPDATEDAT,HINHANH) 
values
( '1',N'Trà Sữa Trà Xanh',39000, N'Trà sữa được làm từ nguyên liệu trà đen cao cấp kết hợp vị béo ngậy của Caramel, sữa và thạch caramel mềm dẻo','1',NULL, NULL, CAST(N'2017-06-20' AS Date),CAST(N'2017-07-20' AS Date), (SELECT BulkColumn 
FROM Openrowset( Bulk 'D:\images\1.jpg', Single_Blob) as img)),
( '2',N'Trà Sữa Trà Đen',60000, N'Trà sữa được làm từ nguyên liệu trà đen cao cấp kết hợp vị béo ngậy của Caramel, sữa và thạch caramel mềm dẻo','1',NULL, NULL, CAST(N'2017-06-20' AS Date),CAST(N'2017-07-20' AS Date), (SELECT BulkColumn 
FROM Openrowset( Bulk 'D:\images\2.jpg', Single_Blob) as img)),
( '3',N'Trà Sữa Cà phê',59000, N'Trà sữa được làm từ nguyên liệu trà đen cao cấp kết hợp vị béo ngậy của Caramel, sữa và thạch caramel mềm dẻo','1',NULL, NULL, CAST(N'2017-06-20' AS Date),CAST(N'2017-07-20' AS Date), (SELECT BulkColumn 
FROM Openrowset( Bulk 'D:\images\3.jpg', Single_Blob) as img)),
( '19',N'Trà Sữa Sương Sáo',49000, N'Trà sữa được làm từ nguyên liệu trà đen cao cấp kết hợp vị béo ngậy của Caramel, sữa và thạch caramel mềm dẻo','1',NULL, NULL, CAST(N'2017-06-20' AS Date),CAST(N'2017-07-20' AS Date), (SELECT BulkColumn 
FROM Openrowset( Bulk 'D:\images\19.jpg', Single_Blob) as img)),
( '20',N'Trà Sữa Earl grey',43000, N'Trà sữa được làm từ nguyên liệu trà đen cao cấp kết hợp vị béo ngậy của Caramel, sữa và thạch caramel mềm dẻo','1',NULL, NULL, CAST(N'2017-06-20' AS Date),CAST(N'2017-07-20' AS Date), (SELECT BulkColumn 
FROM Openrowset( Bulk 'D:\images\20.jpg', Single_Blob) as img)),


( '4',N'Trà Olong',59000, N'Trà sữa được làm từ nguyên liệu trà đen cao cấp kết hợp vị béo ngậy của Caramel, sữa và thạch caramel mềm dẻo','2',NULL, NULL, CAST(N'2017-06-20' AS Date),CAST(N'2017-07-20' AS Date), (SELECT BulkColumn 
FROM Openrowset( Bulk 'D:\images\4.jpg', Single_Blob) as img)),
( '5',N'Trà Bí Đao',42000, N'Trà sữa được làm từ nguyên liệu trà đen cao cấp kết hợp vị béo ngậy của Caramel, sữa và thạch caramel mềm dẻo','2',NULL, NULL, CAST(N'2017-06-20' AS Date),CAST(N'2017-07-20' AS Date), (SELECT BulkColumn 
FROM Openrowset( Bulk 'D:\images\5.jpg', Single_Blob) as img)),
( '21',N'Trà Đen',36000, N'Trà sữa được làm từ nguyên liệu trà đen cao cấp kết hợp vị béo ngậy của Caramel, sữa và thạch caramel mềm dẻo','2',NULL, NULL, CAST(N'2017-06-20' AS Date),CAST(N'2017-07-20' AS Date), (SELECT BulkColumn 
FROM Openrowset( Bulk 'D:\images\21.jpg', Single_Blob) as img)),
( '22',N'Trà Xanh',33000, N'Trà sữa được làm từ nguyên liệu trà đen cao cấp kết hợp vị béo ngậy của Caramel, sữa và thạch caramel mềm dẻo','2',NULL, NULL, CAST(N'2017-06-20' AS Date),CAST(N'2017-07-20' AS Date), (SELECT BulkColumn 
FROM Openrowset( Bulk 'D:\images\22.jpg', Single_Blob) as img)),

( '6',N'Trà sữa Olong đá xay',54000, N'Trà sữa được làm từ nguyên liệu trà đen cao cấp kết hợp vị béo ngậy của Caramel, sữa và thạch caramel mềm dẻo','3',NULL, NULL, CAST(N'2017-06-20' AS Date),CAST(N'2017-07-20' AS Date), (SELECT BulkColumn 
FROM Openrowset( Bulk 'D:\images\6.jpg', Single_Blob) as img)),
( '7',N'Xoài đá xay',54000, N'Trà sữa được làm từ nguyên liệu trà đen cao cấp kết hợp vị béo ngậy của Caramel, sữa và thạch caramel mềm dẻo','3',NULL, NULL, CAST(N'2017-06-20' AS Date),CAST(N'2017-07-20' AS Date), (SELECT BulkColumn 
FROM Openrowset( Bulk 'D:\images\7.jpg', Single_Blob) as img)),
( '8',N'Yakult đào đá xay',59000, N'Trà sữa được làm từ nguyên liệu trà đen cao cấp kết hợp vị béo ngậy của Caramel, sữa và thạch caramel mềm dẻo','3',NULL, NULL, CAST(N'2017-06-20' AS Date),CAST(N'2017-07-20' AS Date), (SELECT BulkColumn 
FROM Openrowset( Bulk 'D:\images\8.jpg', Single_Blob) as img)),
( '9',N'Matcha đá xay',59000, N'Trà sữa được làm từ nguyên liệu trà đen cao cấp kết hợp vị béo ngậy của Caramel, sữa và thạch caramel mềm dẻo','3',NULL, NULL, CAST(N'2017-06-20' AS Date),CAST(N'2017-07-20' AS Date), (SELECT BulkColumn 
FROM Openrowset( Bulk 'D:\images\9.jpg', Single_Blob) as img)),
( '10',N'Khoai môn đá xay',49000, N'Trà sữa được làm từ nguyên liệu trà đen cao cấp kết hợp vị béo ngậy của Caramel, sữa và thạch caramel mềm dẻo','3',NULL, NULL, CAST(N'2017-06-20' AS Date),CAST(N'2017-07-20' AS Date), (SELECT BulkColumn 
FROM Openrowset( Bulk 'D:\images\10.jpg', Single_Blob) as img)),

( '11',N'Kem sữa',16000, N'Hạt ngọc trai có mùi vị đặc biệt, vị ngọt và khi ăn có cảm giác dai giòn sật sật tạo nên cảm giác âm thanh thú vị thích thú.','4',NULL, NULL, CAST(N'2017-06-20' AS Date),CAST(N'2017-07-20' AS Date), (SELECT BulkColumn 
FROM Openrowset( Bulk 'D:\images\11.jpg', Single_Blob) as img)),
( '12',N'Pudding',10000, N'Hạt ngọc trai có mùi vị đặc biệt, vị ngọt và khi ăn có cảm giác dai giòn sật sật tạo nên cảm giác âm thanh thú vị thích thú.','4',NULL, NULL, CAST(N'2017-06-20' AS Date),CAST(N'2017-07-20' AS Date), (SELECT BulkColumn 
FROM Openrowset( Bulk 'D:\images\12.jpg', Single_Blob) as img)),
( '13',N'Thạch dừa',10000, N'Hạt ngọc trai có mùi vị đặc biệt, vị ngọt và khi ăn có cảm giác dai giòn sật sật tạo nên cảm giác âm thanh thú vị thích thú.','4',NULL, NULL, CAST(N'2017-06-20' AS Date),CAST(N'2017-07-20' AS Date), (SELECT BulkColumn 
FROM Openrowset( Bulk 'D:\images\13.jpg', Single_Blob) as img)),
( '14',N'Thạch trái cây',10000, N'Vị thơm ngon và dẻo ăn hoài không ngán','4',NULL, NULL, CAST(N'2017-06-20' AS Date),CAST(N'2017-07-20' AS Date), (SELECT BulkColumn 
FROM Openrowset( Bulk 'D:\images\14.jpg', Single_Blob) as img)),
( '15',N'Thạch cà phê',10000, N'Vị thơm ngon và dẻo ăn hoài không ngán','4',NULL, NULL, CAST(N'2017-06-20' AS Date),CAST(N'2017-07-20' AS Date), (SELECT BulkColumn 
FROM Openrowset( Bulk 'D:\images\15.jpg', Single_Blob) as img)),
( '23',N'Sương Sáo',10000, N'Hạt ngọc trai có mùi vị đặc biệt, vị ngọt và khi ăn có cảm giác dai giòn sật sật tạo nên cảm giác âm thanh thú vị thích thú.','4',NULL, NULL, CAST(N'2017-06-20' AS Date),CAST(N'2017-07-20' AS Date), (SELECT BulkColumn 
FROM Openrowset( Bulk 'D:\images\23.jpg', Single_Blob) as img)),
( '24',N'Đậu đỏ',10000, N'Vị thơm ngon và dẻo ăn hoài không ngán','4',NULL, NULL, CAST(N'2017-06-20' AS Date),CAST(N'2017-07-20' AS Date), (SELECT BulkColumn 
FROM Openrowset( Bulk 'D:\images\24.jpg', Single_Blob) as img)),
( '25',N'Trân trâu trắng',10000, N'Vị thơm ngon và dẻo ăn hoài không ngán','4',NULL, NULL, CAST(N'2017-06-20' AS Date),CAST(N'2017-07-20' AS Date), (SELECT BulkColumn 
FROM Openrowset( Bulk 'D:\images\25.jpg', Single_Blob) as img)),
( '16',N'Trân trâu đen',10000, N'Hạt ngọc trai có mùi vị đặc biệt, vị ngọt và khi ăn có cảm giác dai giòn sật sật tạo nên cảm giác âm thanh thú vị thích thú.','4',NULL, NULL, CAST(N'2017-06-20' AS Date),CAST(N'2017-07-20' AS Date), (SELECT BulkColumn 
FROM Openrowset( Bulk 'D:\images\16.jpg', Single_Blob) as img)),
( '17',N'Hạt é',10000, N'Vị thơm ngon và dẻo ăn hoài không ngán','4',NULL, NULL, CAST(N'2017-06-20' AS Date),CAST(N'2017-07-20' AS Date), (SELECT BulkColumn 
FROM Openrowset( Bulk 'D:\images\17.jpg', Single_Blob) as img)),
( '18',N'Nha đam',10000, N'Vị thơm ngon và dẻo ăn hoài không ngán','4',NULL, NULL, CAST(N'2017-06-20' AS Date),CAST(N'2017-07-20' AS Date), (SELECT BulkColumn 
FROM Openrowset( Bulk 'D:\images\18.jpg', Single_Blob) as img))

--MAMON TS025
