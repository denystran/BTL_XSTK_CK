library(questionr)
library(car)
library(corrplot)
# Tiền xử lý dữ liệu
# Đọc dữ liệu từ file data.csv
data <- read.csv("~/BTL_XSTK/data.csv", header = TRUE, sep = ",")
head(data, 10) # Xuất 10 dòng đầu của dữ liệu

# 1. Làm sạch dữ liệu
selected_columns <- c("layer_height", "wall_thickness", "infill_density", "infill_pattern",
                      "nozzle_temperature", "bed_temperature", "print_speed", "material",
                      "fan_speed", "roughness")
new_data <- data[, selected_columns]

# 2. Kiểm tra dữ liệu khuyết
freq.na(new_data) 

# Thống kê mô tả
# 1. Tạo function và lập bảng tính thống kê mô tả cho các biến liên tục
conts_var <- data[, c("layer_height", "wall_thickness", "infill_density", 
                      "nozzle_temperature", "bed_temperature", "print_speed", 
                      "fan_speed", "roughness")]

mean_val <- apply(conts_var, 2, mean)
sd_val <- apply(conts_var, 2, sd)
var_val <- apply(conts_var, 2, var)
median_val <- apply(conts_var, 2, median)
min_val <- apply(conts_var, 2, min)
max_val <- apply(conts_var, 2, max)
quantile1 <- apply(conts_var, 2, function(x) quantile(x, probs = 0.25))
quantile3 <- apply(conts_var, 2, function(x) quantile(x, probs = 0.75))

summary_stats <- data.frame(mean = mean_val, sd = sd_val, var = var_val, 
                            median = median_val, min = min_val, max = max_val, 
                            quantile1 = quantile1, quantile3 = quantile3)
knitr::kable(t(summary_stats))

# 2. Vẽ đồ thị histogram cho biến roughness
hist(new_data$roughness, xlab = "Roughness", ylab = "Number of Samples", main = "Histogram roughness",
     col = "lightyellow", labels = TRUE, ylim = c(0, 12))

# 3. Vẽ boxplot cho các biến phân loại
# 3.1. Boxplot roughness theo infill_pattern
boxplot(roughness ~ infill_pattern, data = new_data, col = c("red", "lightblue"),
        main = "Boxplot roughness theo infill_pattern")

# 3.2. Boxplot roughness theo material
boxplot(roughness ~ material, data = new_data, col = c("red", "lightblue"),
        main = "Boxplot roughness theo material")

# 3.3. Biểu đồ phân tán layer_height vs roughness
plot(new_data$layer_height, new_data$roughness, col = "blue", pch = 15,
     xlab = "layer_height", ylab = "roughness", main = "Scatter: layer_height vs roughness")

# Thống kê suy diễn
# 1. Bài toán 1 mẫu: Kiểm tra độ nhám trung bình
qqnorm(data$roughness)
qqline(data$roughness, col = "red")
shapiro.test(new_data$roughness)
t.test(new_data$roughness, mu = 170)
qt(p = 0.05/2, df = nrow(new_data)-1, lower.tail = FALSE)

# 2. Kiểm định 2 mẫu: So sánh vật liệu abs và pla
abs_data <- subset(data, material == "abs")
pla_data <- subset(data, material == "pla")

# Kiểm tra phân phối chuẩn cho abs
qqnorm(abs_data$roughness); qqline(abs_data$roughness, col = "red")
shapiro.test(abs_data$roughness)

# Kiểm tra phân phối chuẩn cho pla
qqnorm(pla_data$roughness); qqline(pla_data$roughness, col = "red")
shapiro.test(pla_data$roughness)

# Kiểm định phương sai
var.test(abs_data$roughness, pla_data$roughness, alternative = "greater")
t.test(roughness ~ material, data = data, alternative = "greater", var.equal = TRUE)

# 3. Phân tích phương sai (ANOVA)
data$layer_height <- as.factor(data$layer_height)
anova_model <- aov(roughness ~ layer_height, data)
summary(anova_model)

# Kiểm tra phân phối chuẩn và phương sai cho ANOVA
data_0.02 <- subset(data, layer_height == "0.02")
data_0.06 <- subset(data, layer_height == "0.06")
data_0.1 <- subset(data, layer_height == "0.1")
data_0.15 <- subset(data, layer_height == "0.15")
data_0.2 <- subset(data, layer_height == "0.2")

shapiro.test(data_0.02$roughness)
shapiro.test(data_0.06$roughness)
shapiro.test(data_0.1$roughness)
shapiro.test(data_0.15$roughness)
shapiro.test(data_0.2$roughness)

leveneTest(roughness ~ layer_height, data)
TukeyHSD(anova_model)
plot(TukeyHSD(anova_model))

# 4. Hồi quy tuyến tính đa biến
model_1 <- lm(roughness ~ layer_height + wall_thickness + infill_density + infill_pattern + 
                nozzle_temperature + bed_temperature + print_speed + material + fan_speed, new_data)
summary(model_1)

# Kiểm tra đa cộng tuyến
data_filter <- new_data[, c("layer_height", "wall_thickness", "infill_density", "nozzle_temperature", 
                            "bed_temperature", "print_speed", "fan_speed", "roughness")]
cor_data <- cor(data_filter)
corrplot(cor_data)

# Xây dựng lại mô hình sau khi loại biến
model_2 <- lm(roughness ~ layer_height + nozzle_temperature + bed_temperature + print_speed + material, data = new_data)
summary(model_2)

# Dự báo giá trị
data_test <- data.frame(layer_height = 0.03, nozzle_temperature = 250, bed_temperature = 80, 
                        print_speed = 80, material = "abs")
data_test$predicted_value <- predict(model_2, newdata = data_test, interval = "confidence", level = 0.95)
print(data_test)

# Đánh giá mô hình
par(mfrow = c(2, 2))
plot(model_2)