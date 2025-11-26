CREATE TABLE ghi_danh (
    id_ghi_danh INT PRIMARY KEY,
    id_hoc_vien INT,
    id_khoa_hoc INT,
    ten_khoa_hoc VARCHAR(255),
    ten_giang_vien VARCHAR(255),
    gia_tien INT,
    ngay_ghi_danh DATE,
    trang_thai_hoan_thanh VARCHAR(50)
);

INSERT INTO ghi_danh (id_ghi_danh, id_hoc_vien, id_khoa_hoc, ten_khoa_hoc, ten_giang_vien, gia_tien, ngay_ghi_danh, trang_thai_hoan_thanh) 
VALUES (1, 101, 1, 'SQL cho nguoi moi bat dau', 'Nguyen Van A', 500000, '2023-01-20', 'Da hoan thanh'),
(2, 102, 1, 'SQL cho nguoi moi bat dau', 'Nguyen Van A', 500000, '2023-02-15', 'Chua hoan thanh'),
(3, 103, 2, 'Python co ban', 'Tran Thi B', 700000, '2023-02-25', 'Da hoan thanh'),
(4, 101, 2, 'Python co ban', 'Tran Thi B', 700000, '2023-03-05', 'Da hoan thanh'),
(5, 104, 3, 'Thiet ke Web chuyen nghiep', 'Le Van C', 1200000, '2023-03-10', 'Chua hoan thanh'),
(6, 102, 3, 'Thiet ke Web chuyen nghiep', 'Le Van C', 1200000, '2023-04-12', 'Chua hoan thanh'),
(7, 105, 1, 'SQL cho nguoi moi bat dau', 'Nguyen Van A', 600000, '2023-05-15', 'Da hoan thanh'),
(8, 103, 3, 'Thiet ke Web chuyen nghiep', 'Le Van C', 1200000, '2023-05-20', 'Da hoan thanh'),
(9, 101, 4, 'Machine Learning ung dung', 'Nguyen Van A', 1500000, '2023-06-01', 'Chua hoan thanh'),
(10, 106, 2, 'Python co ban', 'Tran Thi B', 700000, '2022-11-30', 'Da hoan thanh'),
(11, 102, 2, 'Python co ban', 'Tran Thi B', 700000, '2023-07-01', 'Chua hoan thanh');

SELECT ten_giang_vien, SUM(gia_tien) AS tong_doanh_thu_q1
FROM ghi_danh
WHERE ngay_ghi_danh >= '2023-01-01' AND ngay_ghi_danh <= '2023-03-31'
GROUP BY ten_giang_vien
HAVING SUM(gia_tien) > 1000000;

SELECT ten_khoa_hoc, COUNT(*) AS so_luong_ghi_danh, SUM(CASE WHEN trang_thai_hoan_thanh = 'Da hoan thanh' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS ty_le_hoan_thanh
FROM ghi_danh
GROUP BY ten_khoa_hoc
HAVING COUNT(*) >= 2 AND SUM(CASE WHEN trang_thai_hoan_thanh = 'Da hoan thanh' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) < 50;

SELECT id_hoc_vien, COUNT(DISTINCT id_khoa_hoc) AS so_khoa_hoc_da_dang_ky, SUM(gia_tien) AS tong_chi_tieu
FROM ghi_danh
GROUP BY id_hoc_vien
HAVING COUNT(DISTINCT id_khoa_hoc) >= 2 AND SUM(gia_tien) > 1000000;

SELECT MONTH(ngay_ghi_danh) AS thang_ghi_danh, SUM(gia_tien) AS tong_doanh_thu
FROM ghi_danh
WHERE YEAR(ngay_ghi_danh) = 2023
GROUP BY thang_ghi_danh
HAVING SUM(gia_tien) > 1000000
ORDER BY thang_ghi_danh ASC; 