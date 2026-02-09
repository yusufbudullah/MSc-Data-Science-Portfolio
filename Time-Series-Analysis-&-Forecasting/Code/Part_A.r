# -----------------------------
# PART A: Time Series Analysis
# -----------------------------

library(dplyr)
library(tseries)
library(forecast)
library(Kendall)    # Mann-Kendall test
library(seastests)  # seasonality tests

# Convert to time series (annual frequency)
japan_ts <- ts(japan_military_spending$mil_exp,
               start = min(japan_military_spending$year),
               frequency = 1)

# -----------------------------
# 1. Time Series Plot
# -----------------------------
# Rescale to billions
japan_ts_bil <- japan_ts / 1e9

plot(japan_ts_bil,
     main = "Japan Military Expenditure (1960–2023)",
     xlab = "Year",
     ylab = "Military Expenditure (Billions USD)",
     col = "blue",
     lwd = 2)

# -----------------------------
# 2. Check for Trend (Mann–Kendall Test)
# -----------------------------
mk_test <- MannKendall(japan_ts)
mk_test

# -----------------------------
# 3. Check for Seasonality
# -----------------------------
isSeasonal(japan_ts)