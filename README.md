# 🏡 Boston Housing Regression

### 📌 Project Overview  
This project analyzes the **Boston Housing Dataset** using **Linear Regression** and **Principal Component Regression (PCR)**. It explores how **socioeconomic factors, crime rates, pollution, and housing characteristics** influence **median home prices (medv)**.  

The study includes **data preprocessing, correlation analysis, model evaluation with cross-validation, and visualizations** to interpret the key relationships in the dataset.  

---

## 📂 Project Files  
- 📄 **[Report (Czech)](report_boston(CZ).pdf)** – Full project report in Czech.  
- 📄 **[Report (English)](report_boston(EN).pdf)** – Full project report in English.  
- 📜 **[R Script](sourcecode_boston.R)** – Code for data preprocessing, visualization, and regression models.  
---

## 🔍 Key Findings  

**Urban vs. Suburban Differences**  
  - Areas **closer to employment centers** tend to have **higher industrial activity and air pollution**.  
  - **Older buildings** are more common in urban areas, while **newer constructions** are found farther from the city center.  

- **Socioeconomic Status & Housing Prices**  
  - **Lower-income neighborhoods (higher lstat values) tend to have lower house prices (medv)**.  
  - **Larger homes (more rooms) are associated with higher median home prices**, making room count a strong predictor of housing value.  

- **Infrastructure & Property Taxes**  
  - **Better highway access (rad) is linked to higher property tax rates**, possibly due to increased demand and infrastructure costs.  
  - **Industrial areas tend to have higher property taxes**, reflecting zoning policies and economic factors.  

These insights highlight how **urban planning, economic conditions, and infrastructure shape real estate trends** in Boston.  

---

## 🛠️ Methods Used  

- **Data Processing:** Standardization, correlation analysis, and feature selection.  
- **Visualization:** Pair plots, 3D scatter plots, and correlation heatmaps.  
- **Regression Models:**  
  - **Linear Regression** (Standard model & 10-fold Cross-Validation)  
  - **Principal Component Regression (PCR)**  
- **Evaluation Metrics:** RMSE, R², and cross-validation scores.  

---

## 🚀 How to Run the Code  

### 📥 1. Install Required Packages  
Before running the script, install necessary R packages:  

```r
install.packages(c("MASS", "scales", "corrplot", "caret", "pls", "scatterplot3d"))
