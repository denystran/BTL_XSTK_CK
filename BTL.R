# 1.1 Đọc dữ liệu từ file CSV
data <- read.csv("~/BTL_XSTK/data.csv", header = TRUE, sep = ",")
head(data, 10) # Hiển thị 10 dòng đầu tiên của dữ liệu


# 2.1 Chọn lọc dữ liệu
selected_columns <- c("layer_height", "wall_thickness", "infill_density", "infill_pattern",
                      "nozzle_temperature", "bed_temperature", "print_speed", "material",
                      "fan_speed", "roughness")

new_data <- data[, selected_columns]


# 2.2 Kiểm tra dữ liệu bị mất
library(questionr)
freq.na(new_data) # Kiểm tra tổng số và phần trăm dữ liệu bị thiếu


# 3. Thống kê mô tả

# Chọn lọc các biến liên tục
conts_var <- data[, c("layer_height", "wall_thickness", "infill_density", 
                      "nozzle_temperature", "bed_temperature", "print_speed", 
                      "fan_speed", "roughness")]

# Tính toán các thống kê mô tả
mean_val <- apply(conts_var, 2, mean)       # Giá trị trung bình
sd_val <- apply(conts_var, 2, sd)           # Độ lệch chuẩn
var_val <- apply(conts_var, 2, var)         # Phương sai
median_val <- apply(conts_var, 2, median)   # Trung vị
min_val <- apply(conts_var, 2, min)         # Giá trị nhỏ nhất
max_val <- apply(conts_var, 2, max)         # Giá trị lớn nhất

# Tính các bách phân vị (quantile)
quantile1 <- apply(conts_var, 2, function(x) quantile(x, probs = 0.25))  # Q1 (25%)
quantile3 <- apply(conts_var, 2, function(x) quantile(x, probs = 0.75))  # Q3 (75%)

# Hiển thị kết quả dưới dạng bảng
summary_stats <- data.frame(mean = mean_val, sd = sd_val, var = var_val, 
                            median = median_val, min = min_val, max = max_val, 
                            quantile1 = quantile1, quantile3 = quantile3)

# Chuyển vị bảng
t(summary_stats)

# Vẽ biểu đồ histogram cho độ nhám (roughness)
hist(new_data$roughness,
     xlab = "Độ nhám", 
     ylab = "Số mẫu in", 
     main = "Đồ thị thể hiện độ nhám của bản in", 
     col = "lightyellow", 
     labels = TRUE, 
     ylim = c(0, 12))

# Vẽ boxplot cho độ nhám theo infill_pattern
boxplot(roughness ~ infill_pattern, data = new_data,
        main = "Đồ thị boxplot của roughness theo infill_pattern",
        col = c("red", "lightblue"))

# Vẽ boxplot cho độ nhám theo loại vật liệu (material)
boxplot(roughness ~ material, data = new_data,
        main = "Đồ thị boxplot của roughness theo material",
        col = c("red", "lightblue"))

# Vẽ biểu đồ phân tán giữa layer_height và roughness
plot(new_data$layer_height, new_data$roughness,
     xlab = "layer_height", ylab = "roughness",
     main = "layer_height and roughness",
     col = "blue", pch = 15)
abline(lm(new_data$roughness ~ new_data$layer_height), col = "red", lwd = 2)
# Bài toán mẫu
qqnorm(data$roughness,
       col = "blue",
       pch = 16,
       main = "BIỂU ĐỒ Q-Q CỦA ĐỘ NHÁM",
       xlab = "Giá trị lý thuyết",
       ylab = "Giá trị thực tế",
       cex = 1)

qqline(data$roughness, col = "red", lwd = 2)




