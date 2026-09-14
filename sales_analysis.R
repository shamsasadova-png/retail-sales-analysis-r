data <- read.csv("C:/Users/eseds/Downloads/train.csv", fileEncoding = "ISO-8859-1")
head(data)
aggregate(Sales ~ Category, data = data, sum)
barplot(aggregate(Sales ~ Category, data = data, sum)$Sales,
        names.arg = aggregate(Sales ~ Category, data = data, sum)$Category,
        main = "Total Sales by Category",
        ylab = "Sales ($)",
        col = "steelblue")
aggregate(Sales ~ Region, data = data, sum)
sub_sales <- aggregate(Sales ~ Sub.Category, data = data, sum)
sub_sales[order(sub_sales$Sales), ][1:5, ]
data$Order.Date <- as.Date(data$Order.Date, format = "%d/%m/%Y")
data$Month <- format(data$Order.Date, "%Y-%m")
monthly_sales <- aggregate(Sales ~ Month, data = data, sum)
plot(as.factor(monthly_sales$Month), monthly_sales$Sales, type = "b",
     main = "Monthly Sales Trend", xlab = "Month", ylab = "Sales ($)")
getwd()

