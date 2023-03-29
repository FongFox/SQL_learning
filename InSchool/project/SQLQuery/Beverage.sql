--DROP DATABASE Library;	
CREATE DATABASE Beverage ON PRIMARY
(
	NAME = 'Beverage',
	FILENAME = 'D:\Desktop\WorkSpace\IT\SQL Data Base\InSchool\CantBackUp\Beverage.mdf',
	SIZE = 3072KB,
	MAXSIZE = UNLIMITED,
	FILEGROWTH = 1024KB 
)
LOG ON
(
	NAME = 'Beverage_log',
	FILENAME = 'D:\Desktop\WorkSpace\IT\SQL Data Base\InSchool\CantBackUp\Beverage_log.ldf',
	SIZE = 1024KB,
	MAXSIZE = 2048KB,
	FILEGROWTH = 10%
);
--GO
GO
--=================================
USE Beverage;
GO
--=================================
--Tao Bang
--Loai Nuoc
CREATE TABLE LoaiNuoc 
(
	MaLoai varchar(30) Not Null,
	DonVi varchar(8) Null,
	Gia money Null,
	SoLuongHienHanh smallint Null,
	TonHienHanh smallint Null,
	MucDuTru smallint Null
);
GO
--Hoa Don
CREATE TABLE HoaDon
(
	SoHoaDon varchar(5) Not Null,
	Ngay datetime Null,
	MaSoKH varchar(5) Not Null,
	TongTien money Null
);
GO
--Khach Hang
CREATE TABLE KhachHang
(
	MaSo varchar(5) Not Null,
	HoTen varchar(25) Null,
	SoDienThoai varchar(20) Not Null,
	DiaChi varchar(50) Null
);
GO
--Chi Tiet Hoa Don
CREATE TABLE ChiTietHoaDon
(
	SoHoaDon varchar(5) Not Null,
	MaLoai varchar(30) Not Null,
	SoLuong smallint Null,
	ThanhTien smallmoney Null
);
GO
--Nha Cung Cap
CREATE TABLE NhaCungCap
(
	Ma varchar(10) Not Null,
	Ten varchar(15) Null,
	SoDienThoai varchar(20) Not Null,
	DiaChi varchar(50) Null
);
GO
--Phieu Dat Hang
CREATE TABLE PhieuDatHang
(
	SoPhieu varchar(6) Not Null,
	MaNCC varchar(10) Not Null,
	NgayLap datetime Null
);
GO
--Phieu Nhap Hang
CREATE TABLE PhieuNhapHang
(
	SoPhieu varchar(6) Not Null,
	SoPhieuDH varchar(6) Not Null,
	NgayLap datetime Null,
	SoTienPhaiTra money Null
);
GO
--Trong do
CREATE TABLE TrongDo
(
	MaLoai varchar(30) Not Null,
	SoPhieuDH varchar(6) Not Null,
	SoLuongNhap smallint Null
);
GO
--=======================================
--Khoa Chinh
--Loai Nuoc
ALTER TABLE LoaiNuoc
ADD CONSTRAINT pk_LN PRIMARY KEY(MaLoai);
GO
--Hoa Don
ALTER TABLE HoaDon
ADD CONSTRAINT pk_HD PRIMARY KEY(SoHoaDon);
GO
--Khach Hang
ALTER TABLE KhachHang
ADD CONSTRAINT pk_KH PRIMARY KEY(MaSo);
GO
--Chi Tiet Hoa Don
ALTER TABLE ChiTietHoaDon
ADD CONSTRAINT pk_CTHD PRIMARY KEY(SoHoaDon, MaLoai);
GO
--Nha Cung Cap
ALTER TABLE NhaCungCap
ADD CONSTRAINT pk_NCC PRIMARY KEY(Ma);
GO
--Phieu Dat Hang
ALTER TABLE PhieuDatHang
ADD CONSTRAINT pk_PDH PRIMARY KEY(SoPhieu);
GO
--Phieu Nhap Hang
ALTER TABLE PhieuNhapHang
ADD CONSTRAINT pk_PNH PRIMARY KEY(SoPhieu);
GO
--Trong Do
ALTER TABLE TrongDo
ADD CONSTRAINT pk_TD PRIMARY KEY(MaLoai, SoPhieuDH);
GO
--========================================
--Khoa Ngoai
--Hoa Don
ALTER TABLE HoaDon
ADD CONSTRAINT fk_HD_MaSoKH FOREIGN KEY(MaSoKH)
REFERENCES KhachHang(MaSo);
GO
--Chi Tiet Hoa Don
ALTER TABLE ChiTietHoaDon
ADD CONSTRAINT fk_HD_SoHoaDon FOREIGN KEY(SoHoaDon)
REFERENCES HoaDon(SoHoaDon);
GO
ALTER TABLE ChiTietHoaDon
ADD CONSTRAINT fk_LN_MaLoai FOREIGN KEY(MaLoai)
REFERENCES LoaiNuoc(MaLoai);
GO
--Phieu Dat Hang
ALTER TABLE PhieuDatHang
ADD CONSTRAINT fk_NCC_MaNCC FOREIGN KEY(MaNCC)
REFERENCES NhaCungCap(Ma);
GO
--Phieu Nhap Hang
ALTER TABLE PhieuNhapHang
ADD CONSTRAINT fk_PDH_SoPhieuDH FOREIGN KEY(SoPhieuDH)
REFERENCES PhieuDatHang(SoPhieu);
GO
--Trong Do
ALTER TABLE TrongDo
ADD CONSTRAINT fk_TD_LN_MaLoai FOREIGN KEY(MaLoai)
REFERENCES LoaiNuoc(MaLoai);
GO
ALTER TABLE TrongDo
ADD CONSTRAINT fk_TD_PDH_SoPhieu FOREIGN KEY(SoPhieuDH)
REFERENCES PhieuDatHang(SoPhieu);
GO
--=================================================
--Insert data
--LoaiNuoc
INSERT INTO LoaiNuoc
VALUES ('Coca 330ml', 'Lon', 0.44, 20, 80, 70);
GO
INSERT INTO LoaiNuoc
VALUES ('Pepsi 330ml', 'Lon', 0.43, 25, 75, 80);
GO
INSERT INTO LoaiNuoc
VALUES ('7up 390ml', 'Chai', 0.36, 30, 70, 75);
GO
INSERT INTO LoaiNuoc
VALUES ('Aquafina 500ml', 'Chai', 0.20, 15, 85, 40);
GO
INSERT INTO LoaiNuoc
VALUES ('Pocari sweat 500ml', 'Chai', 0.52, 10, 90, 30);
GO
--KhachHang
INSERT INTO KhachHang
VALUES ('KH001', 'Nguyen Van A', '011 222 333 444', '218, Phan Dinh Phung');
GO
INSERT INTO KhachHang
VALUES ('KH002', 'Tran Van B', '022 333 444 555', '119, Tran Cao Van');
GO
INSERT INTO KhachHang
VALUES ('KH003', 'Nguyen Thi C', '033 444 555 666', '128/2A, Hai Ba Trung');
GO
INSERT INTO KhachHang
VALUES ('KH004', 'Ho Cam D', '044 555 666 777', '45, Nguyen Thi Loi');
GO
INSERT INTO KhachHang
VALUES ('KH005', 'Dinh Van L', '055 666 777 888', '428, Vo Thi Sau');
GO
--HoaDon
INSERT INTO HoaDon
VALUES ('HD001', '2022/11/24', 'KH001', 4.4);
GO
INSERT INTO HoaDon
VALUES ('HD002', '2022/11/23', 'KH002',	4.3);
GO
INSERT INTO HoaDon
VALUES ('HD003', '2022/11/22', 'KH003', 1.8);
GO
INSERT INTO HoaDon
VALUES ('HD004', '2022/10/4', 'KH004', 3.0);
GO
INSERT INTO HoaDon
VALUES ('HD005', '2022/10/15', 'KH005', 7.8);
GO
--ChiTietHoaDon
INSERT INTO ChiTietHoaDon
VALUES ('HD001', 'Coca 330ml', 10, 4.4);
GO
INSERT INTO ChiTietHoaDon
VALUES ('HD002', 'Pepsi 330ml', 10, 4.3);
GO
INSERT INTO ChiTietHoaDon
VALUES ('HD003', '7up 390ml', 5, 1.8);
GO
INSERT INTO ChiTietHoaDon
VALUES ('HD004', 'Aquafina 500ml', 15, 3.0);
GO
INSERT INTO ChiTietHoaDon
VALUES ('HD005', 'Pocari sweat 500ml', 15, 7.8);
GO
--NhaCungCap
INSERT INTO NhaCungCap
VALUES ('CoVn01', 'Coca-cola Co', '012 345 678 910', '123, Song Hanh');
GO
INSERT INTO NhaCungCap
VALUES ('PeVn02', 'Pepsi Co', '088 999 111 222', '234, Nguyen Van Linh');
GO
INSERT INTO NhaCungCap
VALUES ('OtsVn03', 'Otsuka Co', '099 888 777 654', '678, Pham Van Dong');
GO
--PhieuDatHang
INSERT INTO PhieuDatHang
VALUES ('PDH001', 'CoVn01', '2020/5/12');
GO
INSERT INTO PhieuDatHang
VALUES ('PDH002', 'PeVn02', '2020/6/1');
GO
INSERT INTO PhieuDatHang
VALUES ('PDH003', 'OtsVn03', '2020/7/27');
GO
--PhieuNhapHang
INSERT INTO PhieuNhapHang
VALUES ('PNH001', 'PDH001', '2020/5/20', 39.99);
GO
INSERT INTO PhieuNhapHang
VALUES ('PNH002', 'PDH002',	'2020/6/10', 36.99);
GO
INSERT INTO PhieuNhapHang
VALUES ('PNH003', 'PDH003',	'2020/8/5', 45.99);
GO
--TrongDo
INSERT INTO TrongDo
VALUES ('Coca 330ml', 'PDH001', 100);
GO
INSERT INTO TrongDo
VALUES ('Pepsi 330ml', 'PDH002', 100);
GO
INSERT INTO TrongDo
VALUES ('Pocari sweat 500ml', 'PDH003', 150);
GO
--============================
--SELECT * FROM LoaiNuoc;
--GO
--SELECT * FROM ChiTietHoaDon;
--GO
--SELECT * FROM KhachHang;
--GO
--SELECT * FROM HoaDon;
--GO
SELECT * FROM NhaCungCap;
GO
SELECT * FROM PhieuDatHang;
GO
--SELECT * FROM PhieuNhapHang;
--GO
--SELECT * FROM TrongDo;
--GO
--===============================
--Question's query
--Question 2 (Xuất bảng bao gồm: Số phiếu đặt hàng, mã nhà cung cấp, mã loại, ngày lập hóa đơn, số lượng nhập và số tiền phải trả từ bảng PhieuDatHang, TrongDo, PhieuNhapHang) (answer)
--SELECT DISTINCT PDH.SoPhieu, PDH.MaNCC, TD.MaLoai, PDH.NgayLap, TD.SoLuongNhap,PNH.SoTienPhaiTra 
--FROM PhieuDatHang as PDH, TrongDo as TD, PhieuNhapHang as PNH
--WHERE PNH.SoPhieuDH = PDH.SoPhieu AND TD.SoPhieuDH = PDH.SoPhieu;
--GO
--Question 3 (Hãy xuất một hóa đơn bao gồm: Số hóa đơn, ngày, mã số khách hàng, họ tên, mã loại, đơn vị, số lượng và tổng tiền phải trả từ bảng: Hóa đơn, loại nước, khách hàng, chi tiết hóa đơn) (answer)
--SELECT DISTINCT HD.SoHoaDon, HD.Ngay, HD.MaSoKH, KH.HoTen, LN.MaLoai, LN.DonVi, CTHD.SoLuong, HD.TongTien  
--FROM HoaDon as HD, LoaiNuoc as LN, KhachHang as KH, ChiTietHoaDon as CTHD
--WHERE (HD.MaSoKH = KH.MaSo AND HD.SoHoaDon = CTHD.SoHoaDon) AND CTHD.MaLoai = LN.MaLoai;
--GO


--===========================================================
--Question 2 (Xuất ra mặt hàng có số lượng nhập nhỏ hơn 100 và Số tiền phải trả phải nhỏ hơn 40.) (answer)
SELECT DISTINCT PDH.SoPhieu, PDH.MaNCC, TD.MaLoai, PDH.NgayLap, TD.SoLuongNhap,PNH.SoTienPhaiTra
FROM PhieuDatHang as PDH, TrongDo as TD, PhieuNhapHang as PNH
WHERE (PNH.SoPhieuDH = PDH.SoPhieu AND TD.SoPhieuDH = PDH.SoPhieu) AND TD.SoLuongNhap < 150 AND PNH.SoTienPhaiTra < 40;
GO
--Question 3 () (answer)
SELECT DISTINCT HD.SoHoaDon, HD.Ngay, HD.MaSoKH, KH.HoTen, LN.MaLoai, LN.DonVi, CTHD.SoLuong, HD.TongTien  
FROM HoaDon as HD, LoaiNuoc as LN, KhachHang as KH, ChiTietHoaDon as CTHD
WHERE (HD.MaSoKH = KH.MaSo AND HD.SoHoaDon = CTHD.SoHoaDon AND CTHD.MaLoai = LN.MaLoai) AND CTHD.SoLuong >= 10 AND HD.TongTien >= 4;
GO
--Question 4 (Hãy sắp xếp tổng tiền phải trả từ lớn tới nhỏ từ hóa đơn) (answer)
SELECT MAX(HoaDon.TongTien) as 'Xep loai chi phi trong hoa don'
FROM HoaDon
GROUP BY HoaDon.TongTien
ORDER BY MAX (HoaDon.TongTien) DESC;
GO
--Question 5 () (answer)
SELECT DISTINCT LN.MaLoai, LN.DonVi, MIN(LN.MucDuTru) as 'Muc Du Tru', TD.SoLuongNhap
FROM LoaiNuoc as LN, TrongDo as TD
WHERE LN.MaLoai = TD.MaLoai
GROUP BY LN.MaLoai, LN.DonVi, LN.MucDuTru, TD.SoLuongNhap
ORDER BY MIN(LN.MucDuTru) ASC;
GO

