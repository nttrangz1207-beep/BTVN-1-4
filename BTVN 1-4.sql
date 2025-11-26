-- BTVN Session7 
-- BÀI 1:
create database KHO_HANG;
use KHO_HANG;
-- Tạo Bảng san_pham
CREATE TABLE san_pham (
    id INT PRIMARY KEY,
    ten_san_pham VARCHAR(255),
    danh_muc VARCHAR(100),
    gia_ban INT,
    so_luong_ton INT
);
-- Chèn Dữ Liệu Mẫu
INSERT INTO san_pham (id, ten_san_pham, danh_muc, gia_ban, so_luong_ton) 
VALUES(1, 'Laptop Dell XPS 13', 'Laptop', 28000000, 15),
(2, 'iPhone 14 Pro Max', 'Điện thoại', 32000000, 30),
(3, 'Bàn phím cơ Logitech', 'Phụ kiện', 2500000, 50),
(4, 'Laptop MacBook Air M2', 'Laptop', 29500000, 20),
(5, 'Samsung Galaxy S23 Ultra', 'Điện thoại', 26000000, 25),
(6, 'Chuột không dây Fuhlen', 'Phụ kiện', 450000, 100),
(7, 'Tai nghe Sony WH-1000XM5', 'Phụ kiện', 8500000, 40),
(8, 'Laptop HP Envy 15', 'Laptop', 24000000, 18);
select * from san_pham
-- Tìm sản phẩm có giá bán nằm trong khoảng từ 20,000,000 đến 30,000,000
SELECT *
FROM san_pham
WHERE gia_ban BETWEEN 20000000 AND 30000000;
-- Tìm tất cả các sản phẩm có tên chứa từ "Laptop"
SELECT *
FROM san_pham
WHERE ten_san_pham LIKE '%Laptop%';
-- Đếm tổng số sản phẩm thuộc danh mục 'Phụ kiện'. Đặt tên cột kết quả là so_luong_phu_kien
SELECT COUNT(id) AS so_luong_phu_kien
FROM san_pham
WHERE danh_muc = 'Phụ kiện';
-- Liệt kê 3 sản phẩm có giá bán cao nhất
SELECT *
FROM san_pham
ORDER BY gia_ban DESC
LIMIT 3;

-- BÀI 2:
create table Sach (
    Book_id int primary key,
    Book_title varchar(255),
    Book_author varchar(255),
    Book_genre varchar(100),
    Book_yearpublication int,
    Book_status varchar(50)
);
insert into Sach (Book_id,Book_title,Book_author,Book_genre,Book_yearpublication,Book_status)
values (1, 'Dế Mèn phiêu lưu ký', 'Tô Hoài', 'Văn học', 1941, 'Có sẵn'),
(2, 'Cho tôi xin một vé đi tuổi thơ', 'Nguyễn Nhật Ánh', 'Văn học', 2008, 'Đã mượn'),
(3, 'Số đỏ', 'Vũ Trọng Phụng', 'Tiểu thuyết', 1936, 'Có sẵn'),
(4, 'Nhà giả kim', 'Paulo Coelho', 'Tiểu thuyết', 1988, 'Có sẵn'),
(5, 'Mắt biếc', 'Nguyễn Nhật Ánh', 'Văn học', 1990, 'Đã mượn'),
(6, 'Trên đường băng', 'Tony Buổi Sáng', 'Kỹ năng sống', 2015, 'Có sẵn'),
(7, 'Đắc nhân tâm', 'Dale Carnegie', 'Kỹ năng sống', 1936, 'Có sẵn');
select*
from Sach
where Book_author = 'Nguyễn Nhật Ánh';
select*
from Sach
where Book_genre in('Văn học', 'Tiểu thuyết');
select count(*) as Book_damuon
from Sach
where Book_status = 'Đã mượn';
select*
from Sach
order by Book_yearpublication asc
limit 2;

-- BÀI 3
create table Phim(
    movie_id int primary key,
    movie_title varchar(255),
    movie_director varchar(255),
    movie_yearpublication int,
    movie_genre varchar(100),
    movie_rating decimal(3,1)
);
insert into Phim(movie_id,movie_title ,movie_director ,movie_yearpublication,movie_genre ,movie_rating )
values (1, 'Inception', 'Christopher Nolan', 2010, 'Khoa học viễn tưởng', 8.8),
(2, 'The Dark Knight', 'Christopher Nolan', 2008, 'Hành động', 9.0),
(3, 'Parasite', 'Bong Joon Ho', 2019, 'Tâm lý', 8.5),
(4, 'Mắt Biếc', 'Victor Vũ', 2019, 'Lãng mạn', 7.8),
(5, 'Interstellar', 'Christopher Nolan', 2014, 'Khoa học viễn tưởng', 8.6),
(6, 'Avengers: Endgame', 'Anthony Russo', 2019, 'Hành động', 8.4),
(7, 'Joker', 'Todd Phillips', 2019, 'Tâm lý', 8.4);
select*
from Phim
where movie_director = 'Christopher Nolan';
select*
from Phim
where movie_yearpublication between 2010 and 2019;
select avg(movie_rating) as diem_trung_binh
from Phim;
select* from Phim
order by movie_rating desc
limit 3;

-- BÀI 4
create table Mon_an(
   food_id int primary key,
   food_name varchar(255),
   food_list varchar(100),
   food_price int,
   food_status varchar(50)
);
insert into Mon_an( food_id,food_name ,food_list,food_price,food_status)
values (1, 'Phở Bò Tái', 'Món chính', 50000, 'Đang phục vụ'),
(2, 'Cơm Gà Xối Mỡ', 'Món chính', 45000, 'Đang phục vụ'),
(3, 'Gỏi Cuốn Tôm Thịt', 'Khai vị', 30000, 'Đang phục vụ'),
(4, 'Bún Bò Huế', 'Món chính', 55000, 'Tạm ngưng'),
(5, 'Nước Cam Ép', 'Đồ uống', 25000, 'Đang phục vụ'),
(6, 'Chè Hạt Sen', 'Tráng miệng', 20000, 'Đang phục vụ'),
(7, 'Cà Phê Sữa Đá', 'Đồ uống', 22000, 'Đang phục vụ'),
(8, 'Bò Lúc Lắc', 'Món chính', 70000, 'Đang phục vụ');
select*
from Mon_an 
where food_list in ('Món chính', 'Khai vị');
select*
from Mon_an
where food_price = (select min(food_price) from Mon_an where food_status = 'Đang phục vụ')
and food_status ='Đang phục vụ';
select*
from Mon_an 
where food_name like '%Bò%';
select*
from Mon_an 
order by food_price asc
limit 3;


-- BÀI TẬP TRÊN LỚP
CREATE TABLE DanhMuc (
    MaDM INT PRIMARY KEY,
    TenDM NVARCHAR(100),
    MoTa NVARCHAR(255)
);

CREATE TABLE SanPham (
    MaSP INT PRIMARY KEY,
    TenSP NVARCHAR(100),
    Gia INT,
    MaDM INT,
    TrangThai NVARCHAR(50),
    FOREIGN KEY (MaDM) REFERENCES DanhMuc(MaDM)
);

INSERT INTO DanhMuc (MaDM, TenDM, MoTa) 
VALUES (1, 'Điện thoại', 'Các sản phẩm điện thoại di động'),
(2, 'Laptop', 'Máy tính xách tay'),
(3, 'Phụ kiện', 'Phụ kiện công nghệ');

INSERT INTO SanPham (MaSP, TenSP, Gia, MaDM, TrangThai) 
VALUES (101, 'iPhone 14', 22000000, 1, 'Còn hàng'),
(102, 'Samsung Galaxy S23', 18000000, 1, 'Còn hàng'),
(103, 'MacBook Air M2', 280000,1,'Còn hàng');

    