-- BÀI 5
create database Session08;
use Session08;
-- Tạo bảng order
CREATE TABLE don_hang (
    id_don_hang INT PRIMARY KEY,
    id_khach_hang INT,
    danh_muc VARCHAR(100),
    tong_tien INT,
    ngay_dat DATE,
    trang_thai VARCHAR(50)
);

-- Chèn dữ liệu mẫu (đã sửa lỗi chính tả 'Diên tử' thành 'Dien tu' và 'Thới trang' thành 'Thoi trang' để dễ thống kê, đồng thời sửa 'Hoàn thành' thành 'Hoàn thanh' thống nhất theo mô tả)
INSERT INTO don_hang (id_don_hang, id_khach_hang, danh_muc, tong_tien, ngay_dat, trang_thai)
VALUES (1, 101, 'Dien tu', 15000000, '2023-01-15', 'Hoàn thanh'),
(2, 102, 'Thoi trang', 2500000, '2023-01-20', 'Hoàn thanh'),
(3, 101, 'Dien tu', 8000000, '2023-02-10', 'Hoàn thanh'),
(4, 103, 'Gia dung', 5000000, '2023-02-12', 'Da huy'),
(5, 102, 'Thoi trang', 3000000, '2023-03-05', 'Hoàn thanh'),
(6, 101, 'Gia dung', 4500000, '2023-03-08', 'Hoàn thanh'),
(7, 104, 'Dien tu', 22000000, '2023-04-18', 'Hoàn thanh'),
(8, 103, 'Thoi trang', 1800000, '2023-04-22', 'Hoàn thanh'),
(9, 102, 'Dien tu', 12000000, '2022-12-10', 'Hoàn thanh');

SELECT
    id_khach_hang,
    SUM(tong_tien) AS tong_chi_tieu
FROM don_hang
GROUP BY id_khach_hang
ORDER BY tong_chi_tieu ASC;

SELECT danh_muc, COUNT(id_don_hang) AS so_luong_don
FROM don_hang
GROUP BY danh_muc;

SELECT id_khach_hang
FROM don_hang
GROUP BY id_khach_hang
HAVING COUNT(id_don_hang) > 1;

SELECT danh_muc, SUM(tong_tien) AS tong_doanh_thu
FROM don_hang
WHERE trang_thai = 'Hoàn thanh'
GROUP BY danh_muc
HAVING SUM(tong_tien) > 10000000;