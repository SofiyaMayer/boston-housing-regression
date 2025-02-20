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

✔ **Housing prices (medv) increase with the number of rooms (rm)** and decrease with **higher crime rates (crim)**.  
✔ **Air pollution (nox) and industrial concentration (indus) are negatively correlated with home prices**.  
✔ **Higher property tax (tax) is linked to better highway access (rad)** and industrial zones.  
✔ **Linear regression performed well, but PCR was more robust against multicollinearity**.  

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
