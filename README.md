# Bài Tập Lớn: Xác Suất Thống Kê (Học kỳ 253)
**Trường Đại học Bách Khoa - ĐHQG TP.HCM | Khoa Kỹ thuật Cơ khí**

## 📌 Thông tin Đề tài
* **Đề tài:** Phân tích các yếu tố ảnh hưởng đến độ nhám bề mặt in 3D.
* **Giảng viên hướng dẫn:** ThS. Nguyễn Kiều Dung
* **Nhóm thực hiện:** CK02
* **Nhóm trưởng:** Trần Minh Đức (MSSV: 2310804)

---

## 🎯 Giới thiệu đề tài
Bộ dữ liệu thực nghiệm được sử dụng trong đề tài bắt nguồn từ nghiên cứu của Khoa Kỹ thuật Cơ khí, Đại học Selcuk (Thổ Nhĩ Kỳ). Mục tiêu nguyên bản của nghiên cứu là đánh giá mức độ ảnh hưởng của các thông số điều chỉnh trên máy in 3D (phương pháp FDM) đến chất lượng bề mặt, độ chính xác kích thước và độ bền cơ học của chi tiết in. 
Cấu trúc nguyên thủy của bộ dữ liệu bao gồm 9 thông số cài đặt đầu vào (biến độc lập) và 3 thông số đầu ra được đo lường (biến phụ thuộc). Tuy nhiên, để đảm bảo tính tập trung và chuyên sâu, trong khuôn khổ của bài báo cáo này, phạm vi phân tích được giới hạn cục bộ ở việc đánh giá một thông số đầu ra duy nhất: độ nhám bề mặt (roughness) đại diện cho chất lượng in. Hai thông số đầu ra còn lại (độ giãn dài và sức căng bề mặt) được xem như hướng mở rộng của đề tài.

---

## 📂 Cấu trúc Repository (Thư mục)
Để tiện cho việc theo dõi và chấm điểm, toàn bộ mã nguồn được chia tách rõ ràng thành hai môi trường xử lý độc lập:

```text
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
├── data/
│   └── data.csv                 # Tập dữ liệu thực nghiệm gốc (Dataset)
├── r_code/
│   └── BTL.R                    # Toàn bộ mã nguồn R (Tiền xử lý, Vẽ đồ thị, Kiểm định, Hồi quy)
├── README.md                    # Hướng dẫn đọc code (File này)
└── report.pdf/                  # File report của báo cáo
---
```

## 🤝 Tái sử dụng & Tham khảo (For Future Students)
Kho lưu trữ này được mở công khai (Public) nhằm mục đích lưu trữ học thuật và chia sẻ kiến thức. 

Các bạn sinh viên khóa sau (Khoa Cơ khí) hoặc những ai đang tìm hiểu về **Phân tích dữ liệu in 3D (R)** và **Trình bày báo cáo kỹ thuật (LaTeX)** hoàn toàn có thể sử dụng repository này như **một nguồn tài liệu tham khảo**. 

*Nếu bạn thấy dự án này hữu ích hoặc có sử dụng lại một phần mã nguồn/cấu trúc báo cáo, một đánh giá (⭐ Star) cho repository sẽ là nguồn động lực rất lớn cho nhóm tác giả!*
