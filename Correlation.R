
# Load e-commerce dataset
ecomm.df <- read.csv("~/Downloads/ecommerce-data-3.csv")
str(ecomm.df)

# Q1. Histogram and Frequency Table Plot of Site Visits
hist(ecomm.df$behavNumVisits, main = "Histogram of Site Visits", col = "lightblue")
plot(table(ecomm.df$behavNumVisits), main = "Frequency Table – Site Visits")

# Q2. Log Frequency Plot
plot(log(table(ecomm.df$behavNumVisits)),
     main = "Frequency of Site Visits",
     xlab = "Number of Site Visits",
     ylab = "Log(Frequency)")

# Q3. Log Frequency Plot with Custom Y-Axis
plot(log(table(ecomm.df$behavNumVisits)),
     main = "Frequency of Site Visits",
     xlab = "Number of Site Visits",
     ylab = "Frequency (Count)",
     yaxt = "n")
logbreaks <- c(1, 2, 5, 10, 20, 50, 100, 200, 500, 1000)
axis(side = 2, at = log(logbreaks), labels = logbreaks, las = 1)

# Q4. Estimate Page Views
pageViewInt <- rep(NA, length(ecomm.df$behavPageviews))
pageViewInt[ecomm.df$behavPageviews == "0"] <- 0
pageViewInt[ecomm.df$behavPageviews == "1"] <- 1
pageViewInt[ecomm.df$behavPageviews == "2 to 3"] <- 2
pageViewInt[ecomm.df$behavPageviews == "4 to 6"] <- 4
pageViewInt[ecomm.df$behavPageviews == "7 to 9"] <- 7
pageViewInt[ecomm.df$behavPageviews == "10+"] <- 10
ecomm.df$pageViewInt <- pageViewInt
rm(pageViewInt)

# Q5. Histogram of Estimated Page Views
hist(ecomm.df$pageViewInt, main = "Histogram of Estimated Page Views", col = "salmon")

# Q6. Scatterplot of Page Views vs. Visits (log scale)
plot(ecomm.df$behavNumVisits, ecomm.df$pageViewInt, log = "x", 
     main = "Page Views vs Visits", xlab = "Visits (log)", ylab = "Page Views")

# Q7. Scatterplot with Jitter
plot(jitter(ecomm.df$behavNumVisits), jitter(ecomm.df$pageViewInt), log = "x",
     main = "Jittered: Page Views vs Visits")

# Q8–9. Pearson Correlation
cor(ecomm.df$pageViewInt, ecomm.df$behavNumVisits)
cor(ecomm.df$pageViewInt, log(ecomm.df$behavNumVisits))
cor.test(ecomm.df$pageViewInt, log(ecomm.df$behavNumVisits))

# --- Salaries Data (car package) ---

# Q10. Load Salaries dataset
library(car)
data(Salaries)
?Salaries

# Q11. Scatterplot Matrix
pairs(~ ., data = Salaries)  # Option 1
scatterplotMatrix(~ rank + discipline + yrs.since.phd + yrs.service + sex + salary, data = Salaries)  # Option 2

# Q12. Correlation Plot
library(corrplot)
library(psych)

corrplot.mixed(cor(Salaries[, c(3, 4, 6)], use = "complete.obs"))
corrplot.mixed(cor(Salaries[, c(3, 4, 6)], use = "complete.obs"), upper = "ellipse")
corrplot(cor(Salaries[, c(3, 4, 6)], use = "complete.obs"), method = "ellipse")
