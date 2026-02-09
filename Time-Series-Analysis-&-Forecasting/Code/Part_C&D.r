# -----------------------------
# PART C & D: Forecasting Methods & Errors
# All values expressed in BILLIONS of USD
# -----------------------------

library(forecast)
library(dplyr)

# ----------------------------------------
# 1. Prepare time series + train/test split
# ----------------------------------------

# Convert to billions for readability
japan_ts <- ts(japan_military_spending$mil_exp / 1e9,
               start = min(japan_military_spending$year),
               frequency = 1)

n <- length(japan_ts)
train_size <- floor(0.7 * n)

train_end_year  <- time(japan_ts)[train_size]
test_start_year <- time(japan_ts)[train_size + 1]

train_japan <- window(japan_ts, end   = train_end_year)
test_japan  <- window(japan_ts, start = test_start_year)

h <- length(test_japan)

# ----------------------------------------
# 2. Method 1 — Simple Exponential Smoothing (SES)
# ----------------------------------------

ses_model <- ses(train_japan,alpha = 0.99, initial = "simple", h = h)

plot(ses_model,
     main = "SES: Actual, Fitted, and Forecast (Japan)",
     ylab = "Military Expenditure (Billions USD)",
     xlab = "Year",
     col = "black",
     lwd = 2)

lines(ses_model$fitted, col = "red", lwd = 2)

legend("topleft",
       legend = c("Actual", "SES Fitted", "SES Forecast"),
       col = c("black", "red", "#2596be"),
       lty = 1,
       lwd = 2)

# ----------------------------------------
# 3. Method 2 — Holt's Method
# ----------------------------------------

holt_model <- holt(train_japan,alpha = 0.99, initial = "simple", h = h)

plot(holt_model,
     main = "Holt: Actual, Fitted, and Forecast (Japan)",
     ylab = "Military Expenditure (Billions USD)",
     xlab = "Year",
     col = "black",
     lwd = 2)

lines(holt_model$fitted, col = "red", lwd = 2)

legend("topleft",
       legend = c("Actual", "Holt Fitted", "Holt Forecast"),
       col = c("black", "red", "#2596be"),
       lty = 1,
       lwd = 2)

# ----------------------------------------
# 4. Method 3 — Linear Trend Regression
# ----------------------------------------

linear_model <- tslm(train_japan ~ trend)

test_trend <- data.frame(
  trend = seq(length(train_japan) + 1,
              length(train_japan) + h)
)

linear_forecast <- forecast(linear_model,
                            newdata = test_trend,
                            h = h)

plot(linear_forecast,
     main = "Linear Trend Model: Actual, Fitted, and Forecast (Japan)",
     ylab = "Military Expenditure (Billions USD)",
     xlab = "Year")

lines(fitted(linear_model), col = "red", lwd = 2)

legend("topleft",
       legend = c("Actual", "Linear Fitted", "Linear Forecast"),
       col = c("black", "red", "#2596be"),
       lty = 1,
       lwd = 2,
       cex = 0.8)

# ----------------------------------------
# Quadratic Trend Regression Model
# ----------------------------------------

# Fit quadratic trend model
quad_model <- tslm(train_japan ~ trend + I(trend^2))

# Create future trend values for forecasting
test_trend <- data.frame(
  trend = seq(length(train_japan) + 1,
              length(train_japan) + h)
)

# Generate forecasts
quad_forecast <- forecast(quad_model,
                          newdata = test_trend,
                          h = h)

# Plot results
plot(quad_forecast,
     main = "Quadratic Trend Model: Actual, Fitted, and Forecast (Japan)",
     ylab = "Military Expenditure (Billions USD)",
     xlab = "Year")

# Add fitted values
lines(fitted(quad_model), col = "red", lwd = 2)

# Add legend
legend("topleft",
       legend = c("Actual", "Quadratic Fitted", "Quadratic Forecast"),
       col = c("black", "red", "#2596be"),
       lty = 1,
       lwd = 2,
       cex = 0.8)

quad_acc <- accuracy(quad_forecast$mean, test_japan)

quad_acc

# ----------------------------------------
# 5. Display Parameters
# ----------------------------------------
ses_model$model$par
holt_model$model$par
summary(linear_model)

# ----------------------------------------
# 6. Forecast Errors (Billions USD)
# ----------------------------------------

ses_acc    <- accuracy(ses_model, test_japan)
holt_acc   <- accuracy(holt_model, test_japan)
linear_acc <- accuracy(linear_forecast$mean, test_japan)

ses_acc
holt_acc
linear_acc