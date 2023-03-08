﻿create database Ananas
use Ananas
drop database Ananas

create table loai_giay(ID int IDENTITY(1,1) primary key, name varchar(20) not null)

create table kieu_dang(ID int IDENTITY(1,1) primary key, name varchar(20) not null)

create table san_pham(MASP varchar(20), 
					name varchar(100) not null, 
					smallest_size int not null, 
					biggest_size int not null, 
					gia_tien money not null,
					gia_sale money,
					kieu_dang int not null,
					loai_giay int not null, 
					gioi_tinh nvarchar(10) not null,
					mau_sac varchar(20),
					ngay_ra_mat date,
					Primary key(MASP),
					Foreign key (kieu_dang) references kieu_dang(ID),
					Foreign key (loai_giay) references loai_giay(ID)
					)

create table so_luong(MASP varchar(20),
					  size_giay int,
					  so_luong int,
					  Foreign key (MASP) references san_pham(MASP),
					  CONSTRAINT PK_so_luong PRIMARY KEY (MASP,size_giay)				  
)

create table phuong_thuc_thanh_toan(id int identity (1,1) primary key, name nvarchar(100))
create table orders(
	"ID" "int" IDENTITY (1, 1) NOT NULL ,
	"ID_NGUOI_DUNG" varchar(20) references Customer(id),
	"Ten_Nguoi_Nhan" varchar(40),
	"Ngay_Dat_Hang" date NOT NULL ,
	"Ngay_Giao_Hang" date,
	"Ngay_Nhan_Hang" date,
	"Phuong_Thuc_Thanh_Toan" "int" NOT NULL references phuong_thuc_thanh_toan(id),
	"Don_Vi_Van_Chuyen" nvarchar (40) NOT NULL ,
	"Dia_Chi" nvarchar (60) NOT NULL ,
	"So_Dien_Thoai" nvarchar (60) NOT NULL,
	"Don_Gia" money not null,
	"Trang_Thai" int,
	primary key(ID)
	)
alter table orders
alter column Ten_Nguoi_Nhan nvarchar(40)
create table [Order Details](
	"ID" int NOT NULL references orders(ID),
	"MASP" varchar(20) NOT NULL references san_pham(MASP),
	"Size" int not null,
	"So_Luong" int NOT NULL DEFAULT (0),
	"Don_Gia" int not null,
	"Giam_Gia" money NOT NULL CONSTRAINT "DF_Order_Details_Discount" DEFAULT (0),
	CONSTRAINT "PK_Order_Details" PRIMARY KEY  CLUSTERED 
	(
		"ID",
		"MASP",
		"Size"
	)
)

create table [vaitro](
	ID int IDENTITY (1, 1) primary key,
	vai_tro varchar(20),
)
drop table [phuong_thuc_thanh_toan]
create table [Customer](
	ID varchar(20) primary key,
	Password varchar(20) not null,
	Ngay_Sinh date not null,
	so_dien_thoai varchar(20) not null,
	Ho_Ten nvarchar(20) not null,
	Gioi_Tinh nvarchar(20) not null,
	email varchar(20) not null,
	vai_tro int references vaitro(id)
)

alter table customer add Dia_chi nvarchar(100);


insert into kieu_dang(name) values('Low top'), ('High top'), ('Mid top'), ('Mule')

insert into loai_giay(name) values ('Batas'), ('Urbas'), ('Vintas'), ('Pattas'), ('Track 6')
insert into san_pham(MASP, name, smallest_size, biggest_size, gia_tien, gia_sale, kieu_dang, loai_giay, gioi_tinh, mau_sac, ngay_ra_mat)
values	('A6T012','TRACK 6 I.S.E.E', 35, 44, 1490000, 0, 1, 5, 'UNISEX', 'WHITE/ICY BLUE','2023-01-25'),
		('A6T010','TRACK 6 CLASS E', 35, 46, 1190000, 0, 1, 5, 'NAM','BOTANIST GREEN', '2022-02-25'),
		('A6T016','TRACK 6 JAZICO', 35, 43, 1190000, 0, 1, 5, 'NU','ROYAL WHITE', '2023-02-25'),
		('A6T007','TRACK 6 SUEDE MOONPHASE', 38, 46, 990000, 0, 1, 5, 'NAM','WINTERIZE', '2022-06-25'),
		('A6T008','TRACK 6 UTILITY GUM SOLE', 38, 46, 1090000 , 0, 1, 5, 'UNISEX','NAVY PEONY/GUM', '2022-07-25'),
		('A6T002','TRACK 6 TRIPLE WHITE', 35, 46, 990000 , 0, 1, 5, 'UNISEX','NAVY PEONY/GUM', '2022-04-25'),
		('A6T003','TRACK 6 TRIPLE BLACK', 35, 46, 990000 , 0, 1, 5, 'UNISEX','BLACK', '2022-12-25'),
		('A6T001','TRACK 6 OG', 38, 46, 990000 , 0, 1, 5, 'NAM','70S WHITE', '2022-12-25'),
		('A6T006','TRACK 6 SUEDE MOONPHASE', 35, 42, 990000 , 0, 1, 5, 'NU','FOSSIL', '2021-12-25')
insert into san_pham(MASP, name, smallest_size, biggest_size, gia_tien, gia_sale, kieu_dang, loai_giay, gioi_tinh, mau_sac, ngay_ra_mat)
values   ('AV00151','BASAS WORKADAY', 35, 46, 650000, 5, 2, 1, 'UNISEX', 'REAL TEAL','2022-03-02'),
		('AV00152','BASAS WORKADAY', 35, 46, 650000, 0, 2, 1, 'UNISEX', 'BLACK','2022-04-02'),
		('AV00146','BASAS EVERGREEN', 35, 46, 650000, 0, 2, 1, 'UNISEX', 'EVERGREEN','2022-04-02'),
		('AV00136','BASAS RAW', 35, 43, 650000, 0, 2, 1, 'NU', 'RUSTIC','2022-04-02'),
		('AV00099','BASAS BUMPER GUM EXT NE', 37, 46, 650000, 0, 2, 1, 'NAM', 'BLACK/GUM','2022-04-02'),
		('AV00144','BASAS EVERGREEN', 35, 43, 580000 , 10, 4, 1, 'NU', 'EVERGREEN','2022-05-02'),
		('AV00004','BASAS BUMPER GUM NE', 35, 43, 520000  , 5, 4, 1, 'NU', 'BLACK/GUM','2022-06-02'),
		('AV00006','BASAS BUMPER GUM NE', 35, 43, 520000  , 5, 4, 1, 'NU', 'OFFWHITE/GUM','2022-07-02'),
		('AV00150','BASAS WORKADAY', 35, 43, 580000   , 0, 1, 1, 'NU', 'REAL TEAL','2022-07-02')
insert into san_pham(MASP, name, smallest_size, biggest_size, gia_tien, gia_sale, kieu_dang, loai_giay, gioi_tinh, mau_sac, ngay_ra_mat)
values  ('AV00155','VINTAS SODA POP', 35, 43, 720000, 0, 2, 3, 'NU', 'RED VIOLET','2022-08-25'),
		('AV00174','VINTAS JAZICO', 36, 44, 720000, 0, 2, 3, 'NAM', 'ROYAL WHITE','2022-02-25'),
		('AV00173','VINTAS JAZICO', 36, 44, 720000, 0, 1, 3, 'NAM', 'ROYAL WHITE','2022-02-25'),
		('AV00154','VINTAS SODA POP', 35, 44, 680000, 0, 1, 3, 'UNISEX', 'AMPARO BLUE','2022-04-25'),
		('AV00153','VINTAS SODA POP', 35, 44, 680000, 5, 1, 3, 'UNISEX', 'EMERALD','2022-04-25'),
		('AV00101','VINTAS MISTER NE', 35, 44, 650000, 10, 3, 3, 'UNISEX', 'CHOCOLATE BROWN','2022-04-25'),
		('AV00122','VINTAS AUNTER', 35, 44, 690000, 10, 1, 3, 'UNISEX', 'SOYBEAN','2022-04-25')


insert into san_pham(MASP, name, smallest_size, biggest_size, gia_tien, gia_sale, kieu_dang, loai_giay, gioi_tinh, mau_sac, ngay_ra_mat)
values  ('AV00133','PATTAS LIVING JOURNEY', 35, 44, 550000, 0, 2, 4, 'NU','VAPOROUS GRAY', '2021-02-25'),
		('AV00132','PATTAS LIVING JOURNEY', 35, 42, 720000, 0, 1, 4, 'NU','VAPOROUS GRAY', '2022-06-25'),
		('AV00172','PATTAS POLKA DOTS', 35, 42, 750000, 0, 2, 4, 'NU','JELLY BEAN', '2021-02-25'),
		('AV00158','PATTAS POLKA DOTS', 35, 42, 750000, 0, 2, 4, 'NU','OFFWHITE', '2021-02-25'),
		('AV00171','PATTAS POLKA DOTS', 35, 42, 720000 , 0, 1, 4, 'NU','TRUE BLUE', '2022-02-25'),
		('AV00157','PATTAS POLKA DOTS', 35, 42, 720000 , 0, 1, 4, 'NU','BLACK', '2022-02-25'),
insert into san_pham(MASP, name, smallest_size, biggest_size, gia_tien, gia_sale, kieu_dang, loai_giay, gioi_tinh, mau_sac, ngay_ra_mat)
values	('AV00201','URBAS SC', 35, 42, 580000, 0, 4, 2, 'Nu','FOLIAGE', '2022-02-25'),
		('AV00195','URBAS SC', 35, 46, 650000, 5, 2, 2, 'UNISEX', 'ALOE WASH','2021-02-25'),
		('AV00202','URBAS SC', 35, 46, 620000 , 0, 4, 2, 'UNISEX', 'DUSTY BLUE','2021-02-25'),
		('AV00196','URBAS SC', 35, 46, 580000  , 0, 4, 2, 'UNISEX', 'DUSTY BLUE','2021-02-25'),
		('AV00199','URBAS SC', 35, 43, 580000  , 0, 4, 2, 'NU', 'FAIR ORCHID','2021-02-25'),
		('AV00192','URBAS SC', 35, 43, 650000   , 0, 2, 2, 'NU', 'CORNSILK','2021-02-25'),
		('AV00130','URBAS RETROSPECTIVE', 35, 46, 720000, 0, 3, 2, 'UNISEX', 'CORNSILK','2021-02-25'),
		('AV00131','URBAS RETROSPECTIVE', 35, 46, 720000, 0, 3, 2, 'UNISEX', 'YELLOW SUBMARINE','2021-02-25')

select * from san_pham

insert into so_luong(MASP, size_giay, so_luong)
values	('A6T012', 35, 10),
		('A6T012', 36, 10),
		('A6T012', 37, 10),
		('A6T012', 38, 10),
		('A6T012', 39, 10),
		('A6T012', 40, 10),
		('A6T012', 41, 10),
		('A6T012', 42, 10),
		('A6T012', 43, 10),
		('A6T012', 44, 10),
		('A6T010', 35, 10),
		('A6T010', 36, 10),
		('A6T010', 37, 10),
		('A6T010', 38, 10),
		('A6T010', 39, 10),
		('A6T010', 40, 10),
		('A6T010', 41, 10),
		('A6T010', 42, 10),
		('A6T010', 43, 10),
		('A6T010', 44, 10),
        ('A6T010', 45, 10),
        ('A6T010', 46, 10),
		('A6T016', 35, 10),
		('A6T016', 36, 10),
		('A6T016', 37, 10),
		('A6T016', 38, 10),
		('A6T016', 39, 10),
		('A6T016', 40, 10),
		('A6T016', 41, 10),
		('A6T016', 42, 10),
		('A6T016', 43, 10),
		('A6T007', 38, 10),
		('A6T007', 39, 10),
		('A6T007', 40, 10),
		('A6T007', 41, 10),
		('A6T007', 42, 10),
		('A6T007', 43, 10),
		('A6T007', 44, 10),
        ('A6T007', 45, 10),
        ('A6T007', 46, 10),
		('A6T008', 38, 10),
		('A6T008', 39, 10),
		('A6T008', 40, 10),
		('A6T008', 41, 10),
		('A6T008', 42, 10),
		('A6T008', 43, 10),
		('A6T008', 44, 10),
        ('A6T008', 45, 10),
        ('A6T008', 46, 10),
		('A6T002', 35, 10),
		('A6T002', 36, 10),
		('A6T002', 37, 10),
		('A6T002', 38, 10),
		('A6T002', 39, 10),
		('A6T002', 40, 10),
		('A6T002', 41, 10),
		('A6T002', 42, 10),
		('A6T002', 43, 10),
		('A6T002', 44, 10),
        ('A6T002', 45, 10),
        ('A6T002', 46, 10),
		('A6T003', 35, 10),
		('A6T003', 36, 10),
		('A6T003', 37, 10),
		('A6T003', 38, 10),
		('A6T003', 39, 10),
		('A6T003', 40, 10),
		('A6T003', 41, 10),
		('A6T003', 42, 10),
		('A6T003', 43, 10),
		('A6T003', 44, 10),
        ('A6T003', 45, 10),
        ('A6T003', 46, 10),
		('A6T001', 38, 10),
		('A6T001', 39, 10),
		('A6T001', 40, 10),
		('A6T001', 41, 10),
		('A6T001', 42, 10),
		('A6T001', 43, 10),
		('A6T001', 44, 10),
        ('A6T001', 45, 10),
        ('A6T001', 46, 10),
		('A6T006', 35, 10),
		('A6T006', 36, 10),
		('A6T006', 37, 10),
		('A6T006', 38, 10),
		('A6T006', 39, 10),
		('A6T006', 40, 10),
		('A6T006', 41, 10),
		('A6T006', 42, 10),

insert into so_luong(MASP, size_giay, so_luong)
values	('AV00151', 35, 10),
		('AV00151', 36, 10),
		('AV00151', 37, 10),
		('AV00151', 38, 10),
		('AV00151', 39, 10),
		('AV00151', 40, 10),
		('AV00151', 41, 10),
		('AV00151', 42, 10),
		('AV00151', 43, 10),
		('AV00151', 44, 10),
        ('AV00151', 45, 10),
        ('AV00151', 46, 10),
		('AV00152', 35, 10),
		('AV00152', 36, 10),
		('AV00152', 37, 10),
		('AV00152', 38, 10),
		('AV00152', 39, 10),
		('AV00152', 40, 10),
		('AV00152', 41, 10),
		('AV00152', 42, 10),
		('AV00152', 43, 10),
		('AV00152', 44, 10),
        ('AV00152', 45, 10),
        ('AV00152', 46, 10),
		('AV00146', 35, 10),
		('AV00146', 36, 10),
		('AV00146', 37, 10),
		('AV00146', 38, 10),
		('AV00146', 39, 10),
		('AV00146', 40, 10),
		('AV00146', 41, 10),
		('AV00146', 42, 10),
		('AV00146', 43, 10),
		('AV00146', 44, 10),
        ('AV00146', 45, 10),
        ('AV00146', 46, 10),
		('AV00136', 35, 10),
		('AV00136', 36, 10),
		('AV00136', 37, 10),
		('AV00136', 38, 10),
		('AV00136', 39, 10),
		('AV00136', 40, 10),
		('AV00136', 41, 10),
		('AV00136', 42, 10),
		('AV00136', 43, 10),
	    ('AV00099', 37, 10),
		('AV00099', 38, 10),
		('AV00099', 39, 10),
		('AV00099', 40, 10),
		('AV00099', 41, 10),
		('AV00099', 42, 10),
		('AV00099', 43, 10),
		('AV00099', 44, 10),
        ('AV00099', 45, 10),
        ('AV00099', 46, 10),
		('AV00144', 35, 10),
		('AV00144', 36, 10),
		('AV00144', 37, 10),
		('AV00144', 38, 10),
		('AV00144', 39, 10),
		('AV00144', 40, 10),
		('AV00144', 41, 10),
		('AV00144', 42, 10),
		('AV00144', 43, 10),
		 ('AV00004', 35, 10),
		('AV00004', 36, 10),
		('AV00004', 37, 10),
		('AV00004', 38, 10),
		('AV00004', 39, 10),
		('AV00004', 40, 10),
		('AV00004', 41, 10),
		('AV00004', 42, 10),
		('AV00004', 43, 10),
		  ('AV00006', 35, 10),
		('AV00006', 36, 10),
		('AV00006', 37, 10),
		('AV00006', 38, 10),
		('AV00006', 39, 10),
		('AV00006', 40, 10),
		('AV00006', 41, 10),
		('AV00006', 42, 10),
		('AV00006', 43, 10),
		('AV00150', 35, 10),
		('AV00150', 36, 10),
		('AV00150', 37, 10),
		('AV00150', 38, 10),
		('AV00150', 39, 10),
		('AV00150', 40, 10),
		('AV00150', 41, 10),
		('AV00150', 42, 10),
		('AV00150', 43, 10),
insert into so_luong(MASP, size_giay, so_luong)
values		 ('AV00155', 35, 10),
		('AV00155', 36, 10),
		('AV00155', 37, 10),
		('AV00155', 38, 10),
		('AV00155', 39, 10),
		('AV00155', 40, 10),
		('AV00155', 41, 10),
		('AV00155', 42, 10),
		('AV00155', 43, 10),
		('AV00174', 36, 10),
		('AV00174', 37, 10),
		('AV00174', 38, 10),
		('AV00174', 39, 10),
		('AV00174', 40, 10),
		('AV00174', 41, 10),
		('AV00174', 42, 10),
		('AV00174', 43, 10),
		('AV00174', 44, 10),
		('AV00173', 36, 10),
		('AV00173', 37, 10),
		('AV00173', 38, 10),
		('AV00173', 39, 10),
		('AV00173', 40, 10),
		('AV00173', 41, 10),
		('AV00173', 42, 10),
		('AV00173', 43, 10),
		('AV00173', 44, 10),
		  ('AV00154', 35, 10),
		('AV00154', 36, 10),
		('AV00154', 37, 10),
		('AV00154', 38, 10),
		('AV00154', 39, 10),
		('AV00154', 40, 10),
		('AV00154', 41, 10),
		('AV00154', 42, 10),
		('AV00154', 43, 10),
		('AV00154', 44, 10),
		('AV00153', 35, 10),
		('AV00153', 36, 10),
		('AV00153', 37, 10),
		('AV00153', 38, 10),
		('AV00153', 39, 10),
		('AV00153', 40, 10),
		('AV00153', 41, 10),
		('AV00153', 42, 10),
		('AV00153', 43, 10),
		('AV00153', 44, 10),
		 ('AV00101', 35, 10),
		('AV00101', 36, 10),
		('AV00101', 37, 10),
		('AV00101', 38, 10),
		('AV00101', 39, 10),
		('AV00101', 40, 10),
		('AV00101', 41, 10),
		('AV00101', 42, 10),
		('AV00101', 43, 10),
		('AV00101', 44, 10),
		 ('AV00122', 35, 10),
		('AV00122', 36, 10),
		('AV00122', 37, 10),
		('AV00122', 38, 10),
		('AV00122', 39, 10),
		('AV00122', 40, 10),
		('AV00122', 41, 10),
		('AV00122', 42, 10),
		('AV00122', 43, 10),
		('AV00122', 44, 10),
insert into so_luong(MASP, size_giay, so_luong)
values		  ('AV00133', 35, 10),
		('AV00133', 36, 10),
		('AV00133', 37, 10),
		('AV00133', 38, 10),
		('AV00133', 39, 10),
		('AV00133', 40, 10),
		('AV00133', 41, 10),
		('AV00133', 42, 10),
		('AV00133', 43, 10),
		('AV00133', 44, 10),
		 ('AV00132', 35, 10),
		('AV00132', 36, 10),
		('AV00132', 37, 10),
		('AV00132', 38, 10),
		('AV00132', 39, 10),
		('AV00132', 40, 10),
		('AV00132', 41, 10),
		('AV00132', 42, 10),
		  ('AV00172', 35, 10),
		('AV00172', 36, 10),
		('AV00172', 37, 10),
		('AV00172', 38, 10),
		('AV00172', 39, 10),
		('AV00172', 40, 10),
		('AV00172', 41, 10),
		('AV00172', 42, 10),
		  ('AV00158', 35, 10),
		('AV00158', 36, 10),
		('AV00158', 37, 10),
		('AV00158', 38, 10),
		('AV00158', 39, 10),
		('AV00158', 40, 10),
		('AV00158', 41, 10),
		('AV00158', 42, 10),
		  ('AV00171', 35, 10),
		('AV00171', 36, 10),
		('AV00171', 37, 10),
		('AV00171', 38, 10),
		('AV00171', 39, 10),
		('AV00171', 40, 10),
		('AV00171', 41, 10),
		('AV00171', 42, 10),
		 ('AV00157', 35, 10),
		('AV00157', 36, 10),
		('AV00157', 37, 10),
		('AV00157', 38, 10),
		('AV00157', 39, 10),
		('AV00157', 40, 10),
		('AV00157', 41, 10),
		('AV00157', 42, 10),
		 ('AV00201', 35, 10),
		('AV00201', 36, 10),
		('AV00201', 37, 10),
		('AV00201', 38, 10),
		('AV00201', 39, 10),
		('AV00201', 40, 10),
		('AV00201', 41, 10),
		('AV00201', 42, 10),
		 ('AV00195', 35, 10),
		('AV00195', 36, 10),
		('AV00195', 37, 10),
		('AV00195', 38, 10),
		('AV00195', 39, 10),
		('AV00195', 40, 10),
		('AV00195', 41, 10),
		('AV00195', 42, 10),
		('AV00195', 43, 10),
		('AV00195', 44, 10),
        ('AV00195', 45, 10),
        ('AV00195', 46, 10),
		 ('AV00202', 35, 10),
		('AV00202', 36, 10),
		('AV00202', 37, 10),
		('AV00202', 38, 10),
		('AV00202', 39, 10),
		('AV00202', 40, 10),
		('AV00202', 41, 10),
		('AV00202', 42, 10),
		('AV00202', 43, 10),
		('AV00202', 44, 10),
        ('AV00202', 45, 10),
        ('AV00202', 46, 10),
		  ('AV00196', 35, 10),
		('AV00196', 36, 10),
		('AV00196', 37, 10),
		('AV00196', 38, 10),
		('AV00196', 39, 10),
		('AV00196', 40, 10),
		('AV00196', 41, 10),
		('AV00196', 42, 10),
		('AV00196', 43, 10),
		('AV00196', 44, 10),
        ('AV00196', 45, 10),
        ('AV00196', 46, 10),
		 ('AV00199', 35, 10),
		('AV00199', 36, 10),
		('AV00199', 37, 10),
		('AV00199', 38, 10),
		('AV00199', 39, 10),
		('AV00199', 40, 10),
		('AV00199', 41, 10),
		('AV00199', 42, 10),
		('AV00199', 43, 10),
		 ('AV00192', 35, 10),
		('AV00192', 36, 10),
		('AV00192', 37, 10),
		('AV00192', 38, 10),
		('AV00192', 39, 10),
		('AV00192', 40, 10),
		('AV00192', 41, 10),
		('AV00192', 42, 10),
		('AV00192', 43, 10),
		 ('AV00130', 35, 10),
		('AV00130', 36, 10),
		('AV00130', 37, 10),
		('AV00130', 38, 10),
		('AV00130', 39, 10),
		('AV00130', 40, 10),
		('AV00130', 41, 10),
		('AV00130', 42, 10),
		('AV00130', 43, 10),
		('AV00130', 44, 10),
        ('AV00130', 45, 10),
        ('AV00130', 46, 10),
		 ('AV00131', 35, 10),
		('AV00131', 36, 10),
		('AV00131', 37, 10),
		('AV00131', 38, 10),
		('AV00131', 39, 10),
		('AV00131', 40, 10),
		('AV00131', 41, 10),
		('AV00131', 42, 10),
		('AV00131', 43, 10),
		('AV00131', 44, 10),
        ('AV00131', 45, 10),
        ('AV00131', 46, 10)

insert into phuong_thuc_thanh_toan(name) values(N'Thanh toán trực tiếp khi giao hàng'), (N'Thanh toán bằng thẻ quốc tế và nội địa (ATM)'), (N'Thanh toán bằng ví MoMo')
select * from customer
insert into vaitro(vai_tro) values('admin'),('customer')
insert into customer(ID, Password, Ngay_sinh, so_dien_thoai, Ho_ten, Gioi_tinh, Email, vai_tro) values('sa','123','2002-01-01','0939488485',N'Đào Quang Khải', N'NAM', 'khaidqhe163770@fpt.edu.vn', 1)

insert into customer(ID, Password, Ngay_sinh, so_dien_thoai, Ho_ten, Gioi_tinh, Email, vai_tro) values('sa1','123','2002-01-01','0939488485',N'Đào Quang Khải', N'NU', 'khaidqhe163770@fpt.edu.vn', 1)
insert into customer(ID, Password, Ngay_sinh, so_dien_thoai, Ho_ten, Gioi_tinh, Email, vai_tro) values('sa2','123','2002-01-01','0939488485',N'Đào Quang Khải', N'KHAC', 'khaidqhe163770@fpt.edu.vn', 2)

select * from orders

alter table orders drop column Don_Vi_Van_Chuyen

Select * from Orders(ID_NGUOI_DUNG, Ten_Nguoi_Nhan, Ngay_Dat_Hang, Phuong_Thuc_Thanh_Toan, Dia_Chi, So_Dien_Thoai, Don_Gia, Trang_Thai)

select * from customer
delete customer
update customer set Dia_chi = N'Đồng Văn-Duy Tiên-Hà Nam'
where id = 'sa2'
select * from [order details]
select * from [orders]
Select Top(1) id from orders order by id desc

select * from so_luong where masp = 'A6T006'and size_giay=37

Update so_luong set so_luong = 9 where masp = 'AV00195' and size = 39
