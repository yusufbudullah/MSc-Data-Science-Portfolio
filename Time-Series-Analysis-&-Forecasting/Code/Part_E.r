# -----------------------------
# PART E: Autocorrelation Analysis
# -----------------------------

library(forecast)
library(tseries)

# -----------------------------------------------------
# Time series object (annual data)
# -----------------------------------------------------

japan_ts <- ts(japan_military_spending$mil_exp/1e9,
               start = min(japan_military_spending$year),
               frequency = 1)

# -----------------------------------------------------
# Autocorrelation analysis (original series)
# -----------------------------------------------------

acf(japan_ts,
    main = "ACF of Japan Military Expenditure")

pacf(japan_ts,
     main = "PACF of Japan Military Expenditure")

# -----------------------------------------------------
# Stationarity tests (original series)
# -----------------------------------------------------

# Augmented Dickey–Fuller Test
adf_test <- adf.test(japan_ts)
adf_test

# KPSS Test
kpss_test <- kpss.test(japan_ts)
kpss_test

# Suggested differencing order
ndiffs(japan_ts)

# -----------------------------------------------------
# First differencing
# -----------------------------------------------------

japan_diff <- diff(japan_ts)

plot(japan_diff,
     main = "Differenced Japan Military Expenditure",
     ylab = "Differenced Values (Billions USD)",
     xlab = "Year",
     col = "blue")

# -----------------------------------------------------
# Stationarity tests (on differenced series)
# -----------------------------------------------------

adf_diff <- adf.test(japan_diff)
adf_diff

kpss_diff <- kpss.test(japan_diff)
kpss_diff

# -----------------------------------------------------
# Autocorrelation analysis (on differenced series)
# -----------------------------------------------------

acf(japan_diff,
    main = "ACF of Differenced Series")

pacf(japan_diff,
     main = "PACF of Differenced Series")

