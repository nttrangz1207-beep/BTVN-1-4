-- Tạo bảng nhat_ky_nguoi_dung
CREATE TABLE nhat_ky_nguoi_dung (
    id_nhat_ky INT PRIMARY KEY,
    id_nguoi_dung INT,
    id_bai_viet INT,
    chuyen_muc VARCHAR(100),
    thoi_gian_doc_giay INT,
    ngay_ghi_nhat_ky DATE
);

INSERT INTO nhat_ky_nguoi_dung (id_nhat_ky, id_nguoi_dung, id_bai_viet, chuyen_muc, thoi_gian_doc_giay, ngay_ghi_nhat_ky)
VALUES (1, 1, 101, 'Lập trình', 300, '2023-10-01'),
(2, 2, 102, 'Thiết kế', 180, '2023-10-01'),
(3, 1, 103, 'Lập trình', 450, '2023-10-02'),
(4, 3, 104, 'Bảo mật', 600, '2023-10-03'),
(5, 2, 101, 'Lập trình', 240, '2023-10-03'),
(6, 1, 104, 'Bảo mật', 500, '2023-10-04'),
(7, 4, 102, 'Thiết kế', 120, '2023-10-04'),
(8, 3, 101, 'Lập trình', 320, '2023-10-05'),
(9, 2, 105, 'Thiết kế', 200, '2023-10-05');

SELECT id_nguoi_dung, SUM(thoi_gian_doc_giay) AS tong_thoi_gian_doc
FROM nhat_ky_nguoi_dung
GROUP BY id_nguoi_dung
ORDER BY tong_thoi_gian_doc DESC;

SELECT chuyen_muc, COUNT(id_nhat_ky) AS so_luot_doc
FROM nhat_ky_nguoi_dung
GROUP BY chuyen_muc;

SELECT id_bai_viet
FROM nhat_ky_nguoi_dung
GROUP BY id_bai_viet
HAVING COUNT(DISTINCT id_nguoi_dung) > 1;

-- Dùng COUNT(DISTINCT id_nguoi_dung) 
SELECT id_nguoi_dung,
AVG(thoi_gian_doc_giay) AS thoi_gian_trung_binh
FROM nhat_ky_nguoi_dung
GROUP BY id_nguoi_dung
HAVING
AVG(thoi_gian_doc_giay) > 350;