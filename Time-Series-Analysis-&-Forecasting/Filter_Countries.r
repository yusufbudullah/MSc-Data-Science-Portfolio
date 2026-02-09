library(dplyr)

# Filter & extract countries in top 30% military spending (As of latest year) 
# With at least 60 years of valid data
final_list <- WB_WDI_MS_MIL_XPND_CD %>%
  
  # Keep only relevant variables
  rename(
    country = REF_AREA_LABEL,
    year = TIME_PERIOD,
    mil_exp = OBS_VALUE
  ) %>%
  
  # Ensure year is numeric
  mutate(year = as.numeric(year)) %>%
  
  # Keep only countries with ≥ 60 non-missing observations
  group_by(country) %>%
  filter(sum(!is.na(mil_exp)) >= 60) %>%
  ungroup() %>%
  
  # Filter to latest year available
  filter(year == max(year, na.rm = TRUE)) %>%
  
  # Keep countries in the top 30% of spending
  filter(mil_exp >= quantile(mil_exp, 0.70, na.rm = TRUE)) %>%
  
  # Extract names only
  pull(country)

# View list of eligible countries
final_list
