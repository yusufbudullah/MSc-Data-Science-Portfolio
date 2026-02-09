# -----------------------------
# PART F: ARIMA Modelling
# -----------------------------
library(forecast)
library(tseries)
library(lmtest)

# -----------------------------------------------------------
# Define time series (annual, scaled to billions USD)
# -----------------------------------------------------------

japan_ts <- ts(japan_military_spending$mil_exp/1e9,
               start = min(japan_military_spending$year),
               frequency = 1)

# -----------------------------------------------------------
# (f)(i)  ACF/PACF + propose ARIMA models
# -----------------------------------------------------------
auto.arima(japan_ts, trace = TRUE)

# -----------------------------------------------------------
# (f)(ii) Fit ARIMA models
# -----------------------------------------------------------
# Values  in billions as japan_ts was scaled 

# ARIMA(1,1,1)
mod_arima111 <- Arima(japan_ts, order = c(1,1,1))

# ARIMA(0,1,1) with drift
mod_arima011 <- Arima(japan_ts, order = c(0,1,1),include.drift = TRUE)

summary(mod_arima111)
summary(mod_arima011)

# -----------------------------------------------------------
# (f)(iv) Model adequacy checks (residual diagnostics)
# -----------------------------------------------------------

checkresiduals(mod_arima111)
checkresiduals(mod_arima011)


# -----------------------------------------------------------
# (f)(v) Coefficient significance tests (α = 0.05)
# -----------------------------------------------------------

coeftest(mod_arima111)
coeftest(mod_arima011)

# -----------------------------------------------------------
# (f)(vi) Forecast error measures
# -----------------------------------------------------------

accuracy(mod_arima111)
accuracy(mod_arima011)

# -----------------------------------------------------------
# (g)(i) Forecast 6 years
# -----------------------------------------------------------

# Forecast the next 6 years
forecast_6yr <- forecast(mod_arima011, h = 6)

# Print forecast values
forecast_6yr

# -----------------------------------------------------------
# Plot forecast and fitted values
# -----------------------------------------------------------

plot(forecast_6yr,
     main = "6-Year Forecast of Japan Military Expenditure\nARIMA(0,1,1) with Drift",
     ylab = "Military Expenditure (Billions USD)",
     xlab = "Year",
     col = "black",
     lwd = 2)

# Add fitted values
lines(fitted(mod_arima011), col = "red", lwd = 2)

# Add legend
legend("topleft",
       legend = c("Actual", "ARIMA(0,1,1) Fitted", "ARIMA(0,1,1) Forecast"),
       col = c("black", "red", "#2596be"),
       lty = 1,
       lwd = 2)