# --- R Code for Selection Part 1 ---
# Load the full World Bank data (WB_WDI_MS_MIL_XPND_CD.csv)
full_data <- read.csv("WB_WDI_MS_MIL_XPND_CD.csv")

# 1. Identify the most recent year (e.g., 2023)
latest_year <- max(full_data$TIME_PERIOD)

# 2. Filter data for the latest year and remove missing values
df_latest <- subset(full_data, TIME_PERIOD == latest_year & OBS_VALUE > 0)

# 3. Sort by expenditure (descending)
df_latest_sorted <- df_latest[order(-df_latest$OBS_VALUE), ]

# 4. Calculate the top 30% threshold and count
num_entities <- nrow(df_latest_sorted)
top_30_count <- floor(num_entities * 0.30)
top_30_entities <- head(df_latest_sorted, top_30_count)

# List potential countries (excluding obvious aggregates like 'World', 'High income')
potential_countries <- unique(top_30_entities$REF_AREA_LABEL)
print(paste("Most Recent Year:", latest_year))
print(paste("Total Valid Entities:", num_entities))
print(paste("Entities in Top 30%:", top_30_count))
print("First 10 Entities in Top 30%:")
print(head(potential_countries, 10))
# --- End of R Code Part 1 ---