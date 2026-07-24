# Bài Tập Lớn: Xác Suất Thống Kê (Học kỳ 253)
**Trường Đại học Bách Khoa - ĐHQG TP.HCM | Khoa Kỹ thuật Cơ khí**

## 📌 Thông tin Đề tài
* **Đề tài:** Phân tích các yếu tố ảnh hưởng đến độ nhám bề mặt in 3D.
* **Giảng viên hướng dẫn:** ThS. Nguyễn Kiều Dung
* **Nhóm thực hiện:** CK02
* **Nhóm trưởng:** Trần Minh Đức (MSSV: 2310804)

---

## 🎯 Mục tiêu Dự án
Dự án này ứng dụng các phương pháp Xác suất thống kê (Thống kê mô tả, T-test, ANOVA, Hồi quy tuyến tính bội) để phân tích bộ dữ liệu thực nghiệm gồm 50 mẫu in 3D. Mục tiêu nhằm định lượng mức độ ảnh hưởng của các thông số cắt lớp (layer height, infill density, material,...) đến chất lượng bề mặt (roughness) của sản phẩm in3d, từ đó đề xuất thông số tối ưu.

---

## 📂 Cấu trúc Repository (Thư mục)
Để tiện cho việc theo dõi và chấm điểm, toàn bộ mã nguồn được chia tách rõ ràng thành hai môi trường xử lý độc lập:

```text
├── data/
│   └── data.csv                 # Tập dữ liệu thực nghiệm gốc (Dataset)
├── r_code/
│   └── BTL.R        # Toàn bộ mã nguồn R (Tiền xử lý, Vẽ đồ thị, Kiểm định, Hồi quy)
├── BTL_XSTK_latex/
│   ├── main.tex                 # File LaTeX tổng (Preamble & Master layout)
│   ├── chapter1.tex             # Giới thiệu đề tài.
│   ├── chapter2.tex             # Cơ sở lý thuyết
│   ├── chapter3.tex             # Tiền xử lý dữ liệu
│   ├── chapter4.tex             # Thống kê mô tả
│   ├── chapter5.tex             # Thống kê suy diễn
│   ├── chapter6.tex             # Thảo luận và mở rộng
│   ├── cover.tex                # Trang bìa báo cáo
│   ├── logo-bkhcm.png           # Logo trường DHBK
│   └── images/                  # Chứa các biểu đồ (.pdf, .png) xuất ra từ R
├── report.pdf/                  # File report của báo cáo
└── README.md                    # Hướng dẫn đọc code (File này)
---
```

## 🤝 Tái sử dụng & Tham khảo (For Future Students)
Kho lưu trữ này được mở công khai (Public) nhằm mục đích lưu trữ học thuật và chia sẻ kiến thức. 

Các bạn sinh viên khóa sau (Khoa Cơ khí) hoặc những ai đang tìm hiểu về **Phân tích dữ liệu in 3D (R)** và **Trình bày báo cáo kỹ thuật (LaTeX)** hoàn toàn có thể sử dụng repository này như **một nguồn tài liệu tham khảo**. 

*Nếu bạn thấy dự án này hữu ích hoặc có sử dụng lại một phần mã nguồn/cấu trúc báo cáo, một đánh giá (⭐ Star) cho repository sẽ là nguồn động lực rất lớn cho nhóm tác giả!*
