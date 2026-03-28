# 🏥 Medical Insurance Cost Predictor

[![View Quarto Report](https://img.shields.io/badge/View-Executive_Summary-blue?style=for-the-badge)](PUT_YOUR_GITHUB_PAGES_LINK_HERE)
[![View Tableau Dashboard](https://img.shields.io/badge/View-Interactive_Dashboard-orange?style=for-the-badge)](PUT_YOUR_TABLEAU_LINK_HERE)

## 📌 Problem Statement & Motivation
Medical insurance providers must accurately forecast patient costs to maintain financial stability and offer fair, risk-adjusted premiums. However, relying on generalized pricing models fails to capture how compounding health factors exponentially increase medical bills. 

The goal of this project is to transition from historical data analysis to future prediction by building a machine learning engine capable of forecasting individual patient costs based on targeted demographic and health metrics. 

## 📊 Data Sources & Collection
This project utilizes a medical insurance dataset encompassing individual policyholder profiles. The data features diverse metrics designed to shed light on the determinants of health costs, including:
* **Demographics:** Age, Sex, Region
* **Health Metrics:** Body Mass Index (BMI), Smoking Status
* **Family Structure:** Number of Dependents (Children)

*Note: The dataset was processed and cleaned to handle structural formatting and ensure model readiness.*

## 💡 Key Findings & Visualizations
Through Exploratory Data Analysis (EDA) and predictive modeling, several high-impact business insights were uncovered:

1. **The Smoking Penalty:** Smoking is the absolute largest financial driver, adding a base cost of approximately $23,000 to a patient's expected yearly charges.
2. **The BMI Multiplier:** While a high BMI marginally increases costs for non-smokers, it acts as a severe, exponential cost multiplier when combined with smoking.
3. **Model Superiority:** A Random Forest algorithm outperformed a Multiple Linear Regression baseline (minimizing RMSE) because it successfully captured the complex, non-linear interactions between BMI and smoking status.

*(Insert a screenshot of your Tableau Dashboard or your Quarto BMI/Smoker plot here using `![alt text](outputs/dashboard_screenshot.png)`)*

## 🛠️ Technologies Used
* **Language:** R
* **Data Manipulation & Visualization:** `tidyverse`, `ggplot2`
* **Machine Learning:** `randomForest`, `stats` (Linear Regression)
* **Reporting & Publishing:** Quarto (HTML generation), Tableau Public (Interactive Dashboards)
* **Version Control:** Git & GitHub

## 🚀 How to Run the Code
To reproduce this analysis locally:
1. Clone this repository to your local machine:
   `git clone https://github.com/davidnamgung/medical-insurance-prediction.git`
2. Ensure you have R and RStudio (or VS Code with R extensions) installed.
3. Install the required packages by running: 
   `install.packages(c("tidyverse", "randomForest", "quarto"))`
4. Run the scripts in the `/scripts/` folder sequentially:
   * `01_data_prep.R`
   * `02_eda.R`
   * `03_modeling.R`
5. The final interactive report can be viewed by rendering `/report/index.qmd` via Quarto.

## 🔮 Future Improvements & Limitations
* **Feature Expansion:** The current model is highly accurate but relies on a limited set of variables. Incorporating specific pre-existing conditions (e.g., diabetes, hypertension) would drastically improve the model's granular accuracy.
* **Web Application Deployment:** Future iterations could wrap the saved `final_rf_model.rds` file into a live Shiny web application, allowing insurance agents to input patient data and generate quotes directly from a browser interface.
* **Geographic Granularity:** The 'Region' variable is currently too broad (e.g., "Southwest"). Zip-code level data would allow the model to account for local cost-of-living and regional healthcare pricing disparities.

---
**Author:** David Namgung