Giải thích chi tiết.
1.1 Đọc dữ liệu từ file CSV

data <- read.csv("~/BTL_XSTK/data.csv", header = TRUE, sep = ",")
head(data, 10)

•	read.csv(...): Đọc dữ liệu từ file CSV.

•	header = TRUE: Dòng đầu tiên là tiêu đề cột.

•	sep = ",": Các giá trị được phân tách bằng dấu phẩy.

•	head(data, 10): Hiển thị 10 dòng đầu tiên để kiểm tra dữ liệu đã đọc.
________________________________________
2.1 Chọn lọc dữ liệu

selected_columns <- c(...)  
new_data <- data[, selected_columns]

•	Chọn các cột liên quan để phân tích, bao gồm các thông số kỹ thuật và độ nhám (roughness).

•	new_data: DataFrame mới chỉ chứa các cột đã chọn.
________________________________________
2.2 Kiểm tra dữ liệu bị mất

library(questionr)
freq.na(new_data)

•	Nạp thư viện questionr.

•	freq.na(...): Kiểm tra số lượng và tỉ lệ giá trị bị thiếu (NA) trong mỗi cột của new_data.
________________________________________
3. Thống kê mô tả
Chọn lọc các biến liên tục

conts_var <- data[, c(...)]

•	Lọc ra các biến số liên tục (dạng số thực) để thực hiện thống kê mô tả.

Tính toán các thống kê

mean_val     # Giá trị trung bình
sd_val       # Độ lệch chuẩn
var_val      # Phương sai
median_val   # Trung vị
min_val      # Giá trị nhỏ nhất
max_val      # Giá trị lớn nhất

•	Sử dụng apply(..., 2, hàm): áp dụng hàm tính toán theo từng cột.
Bách phân vị (quantiles)

quantile1  # Q1 (25%)
quantile3  # Q3 (75%)

•	Tính Q1 và Q3 cho mỗi cột.
Kết hợp kết quả vào một bảng

summary_stats <- data.frame(...)
t(summary_stats)

•	Tạo bảng thống kê mô tả và t() để chuyển vị bảng (hàng thành cột, cột thành hàng).
________________________________________
4. Biểu đồ Histogram: Độ nhám

hist(new_data$roughness, ...)

•	Biểu đồ tần số để quan sát phân bố của độ nhám.

•	labels = TRUE: Hiển thị số lượng trên mỗi cột.

•	ylim = c(0, 12): Giới hạn trục tung từ 0 đến 12.
________________________________________
Boxplot: Độ nhám theo infill_pattern

boxplot(roughness ~ infill_pattern, data = new_data, ...)

•	Biểu đồ hộp để so sánh độ nhám giữa các loại mẫu đổ đầy (infill_pattern).

Boxplot: Độ nhám theo loại vật liệu

boxplot(roughness ~ material, data = new_data, ...)

•	So sánh độ nhám giữa các loại vật liệu in 3D.
________________________________________
Biểu đồ phân tán: layer_height vs roughness

plot(...), abline(...)

•	Vẽ biểu đồ scatter để quan sát mối quan hệ giữa chiều cao lớp in và độ nhám.

•	abline(...): Thêm đường hồi quy tuyến tính.
________________________________________
Biểu đồ Q-Q (kiểm tra phân phối chuẩn)

qqnorm(data$roughness, ...)
qqline(data$roughness, ...)

•	qqnorm(): Biểu đồ Q-Q để kiểm tra xem roughness có phân phối chuẩn không.

•	qqline(): Thêm đường tham chiếu để dễ quan sát độ lệch khỏi phân phối chuẩn.
