df <- WB_WDI_MS_MIL_XPND_CD

# Keep only the relevant variables and rename them
df_clean <- df |>
  dplyr::select(
    country = REF_AREA_LABEL,
    year = TIME_PERIOD,
    mil_exp = OBS_VALUE
  ) |>
  dplyr::mutate(year = as.numeric(year))

# Extract Japan's data
japan_military_spending <- df_clean |>
  dplyr::filter(country == "Japan") |>
  dplyr::arrange(year)

# Check structure
str(japan_military_spending)


