# Time Series Forecasting: Japan Military Expenditure Analysis

This project involves a comprehensive time series investigation into Japan’s military expenditure, utilizing historical data to model trends and generate multi-year forecasts. The study employs a rigorous statistical workflow in **R**, comparing smoothing techniques with **ARIMA** modeling to identify the most accurate predictive framework.

---

## The Challenge
Geopolitical shifts and national policy changes make military spending a complex variable to forecast. This project addresses the challenge of capturing both long-term structural trends and short-term fluctuations while providing a reliable six-year outlook.

---

## The Dataset
The analysis is based on a historical time series of Japan’s military expenditure.

* **Trend Analysis:** Identified a strong upward trend in the series
* **Data Partitioning:** Utilized a **Train/Test split** strategy to validate model performance on unseen data before final deployment
* **Stationarity Testing:** Applied the **Augmented Dickey-Fuller (ADF)** and **KPSS** tests and analyzed **Autocorrelation (ACF)** and **Partial Autocorrelation (PACF)** plots to determine the need for differencing

---

## Project Structure
The repository follows a structured forecasting lifecycle:

### Part 1: Smoothing & Traditional Methods
* **Holt’s Linear Trend Model:** Implemented to capture the consistent upward trajectory observed in the expenditure data
* **Exponential Smoothing:** Used as a benchmark forecasting approach
* **Error Evaluation:** Compared models using **MAE** and **RMSE** to select the strongest traditional baseline

### Part 2: ARIMA Model Development
* **Identification:** Used ACF and PACF plots to propose candidate models, including **ARIMA(0,1,1)** and **ARIMA(1,1,1)**

* **Estimation & Significance:** Generated model summaries to evaluate parameter coefficients
* **Diagnostic Checking:** Performed **Ljung-Box tests** and residual analysis to ensure model adequacy (residuals behaving as white noise)
* **Final Forecast:** Deployed the **ARIMA(0,1,1) with drift** model to generate a six-year forecast with 80% and 95% prediction intervals

---

## Key Skills & Tools
* **Statistical Programming:** Time series modelling in **R**
* **Time Series Modeling:** Applying ARIMA frameworks to real-world data
* **Diagnostic Testing:** Stationarity testing (ADF, KPSS), autocorrelation, and residual diagnostics
* **Performance Validation:** Forecast error metrics (MAE, RMSE) for model selection

---

## Core Concepts
* **Trend Behaviour:** Long-term structural movement in a time series
* **Stationarity:** Requirement for ARIMA modeling
* **Differencing:** Transformation used to stabilise the series before modelling

---

## Key Results & Outputs
* **Best Fit Model:** Identified **ARIMA(0,1,1) with drift** as the superior model, providing the lowest error rates and passing adequacy checks
* **Strategic Outlook:** Produced a 6-year forecast showing continued gradual increase in expenditure
* **Visual Documentation:** R-generated plots including fitted values, residual diagnostics, and forecast intervals

