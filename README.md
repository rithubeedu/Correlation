# 🔗 Correlation Analysis: E-Commerce Site Behavior & Academic Salaries

This project explores relationships between e-commerce visitor behavior (site visits and page views) and performs visual + statistical correlation analysis on an academic salary dataset. The goal is to investigate behavioral engagement and real-world patterns through log transforms, scatterplots, and correlation coefficients.

---

## 📂 Dataset Overview

### 1. **E-commerce Dataset**
**File:** `ecommerce-data-3.csv`  
- `behavNumVisits`: Number of site visits
- `behavPageviews`: Page view categories (e.g., "4 to 6", "10+")
- Converted to numeric estimates: `pageViewInt`

### 2. **Salaries Dataset** (from `car` package)
**Dataset:** `Salaries`  
- Contains rank, discipline, years since PhD, years of service, sex, and salary

---

## 🔍 Analysis Steps

### Part 1: 🛒 E-Commerce Behavior

#### Q1. 📊 Histogram and Frequency Table
- Plotted raw frequency of site visits using base R `hist()` and `table()`.

#### Q2–Q3. 📈 Log Frequency Plots
- Visualized log-transformed frequency of site visits.
- Custom Y-axis with log scale labels using `axis()` and `logbreaks`.

#### Q4. 🔢 Estimating Page Views
- Mapped page view buckets like "4 to 6" into integers (e.g., 4).
- Created new variable: `pageViewInt`

#### Q5. 📉 Histogram of Estimated Page Views

#### Q6–Q7. 🔍 Scatterplots of Page Views vs Visits
- Standard scatterplot and jittered version
- Applied log scaling to better visualize right-skewed distributions

#### Q8–Q9. 🔗 Pearson Correlation
- Computed correlation between `pageViewInt` and `behavNumVisits`
- Included log-transformed variant and `cor.test()` for significance

---

### Part 2: 🎓 Salary Dataset Correlation

#### Q10. 📦 Load `Salaries` Dataset
- From `car` package, includes academic position data

#### Q11. 🧩 Scatterplot Matrix
- Visualized relationships using `pairs()` and `scatterplotMatrix()` from `car`

#### Q12. 🔄 Correlation Matrix Visualizations
- Used `corrplot.mixed()` and `corrplot()` to show correlations among:
  - `yrs.since.phd`, `yrs.service`, and `salary`

---

## 📦 Packages Used

```r
library(car)
library(corrplot)
library(psych)
