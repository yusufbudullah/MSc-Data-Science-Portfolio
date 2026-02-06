# Data Management: Structuring & Analyzing UK National Rail Data

This project is an in-depth Data Management study focused on the systematic preparation, cleaning, and statistical analysis of UK National Rail journey data. Spanning the full data pipeline, the work bridges the gap between raw transaction logs and meaningful analytical inputs, utilizing SAS Studio to enhance the reliability of service performance insights.

---

## The Challenge
The UK National Rail dataset for January to April 2024 presented significant data quality hurdles, including typographical inconsistencies, missing values, and skewed price distributions. The objective was to apply rigorous preprocessing, feature engineering, and hypothesis testing to transform this "dirty" data into a structured format suitable for high-performance data warehousing and predictive modeling.

---

## The Dataset
The project analyzes a comprehensive sample of 3,000 UK National Rail records (from [Maven Analytics Data Playground - UK Train Rides](https://mavenanalytics.io/data-playground/uk-train-rides)) covering transactions and journey details.
* **Content**: Features 13+ attributes including ticket details (Class, Type, Price), payment methods, and precise temporal logs such as Scheduled vs. Actual Arrival.
* **Preprocessing**: Extensive manual and rule-based cleaning resolved categorical fragmentation in fields like `Journey_Status` (e.g., correcting "On Tmie") and `Reason_for_Delay`.
* **Imputation**: Contextual rules handled missing values, such as labeling null railcard entries as "None" and filling on-time journeys with "No Delay".

---

## Key Skills & Tools
* **Statistical Computing**: Advanced data manipulation and descriptive analysis using SAS Studio.
* **Data Engineering**: Implementation of SAS 4GL for data step programming, log transformations, and feature creation.
* **Analytical Frameworks**: Application of Metadata Classification (Nominal, Ordinal, Interval, Ratio) and Data Warehouse Evaluation (Integration, Scalability, Time-Variance).
* **Hypothesis Testing**: Statistical validation using Chi-Square tests and One-Way ANOVA to evaluate relationships between variables.

---

## Core Concepts
* **Feature Engineering**:
    * **Variable Transformation**: Normalization of ticket prices via Log Transformation to mitigate extreme right-skewness.
    * **Feature Creation**: Development of new analytical variables such as `Delay_Duration_Minutes`, `Route` (combination of stations), and `Hour_of_Departure`.
* **Data Warehouse Evaluation**: Analysis of five critical criteria for large-scale rail data storage, including Multidimensional Analysis (OLAP) and Query Performance.
* **Quality Assessment**: Identification and visual confirmation of price outliers through Boxplot analysis.

---

## Key Results & Outputs
* **Preprocessing Success**: Standardized all journey statuses, revealing that 87.43% of journeys arrived on time, while disruptions were accurately categorized as Delayed (7.17%) or Cancelled (5.40%).
* **Operational Hotspots**: Identified "London St Pancras to Birmingham New Street" as the highest-risk route, accounting for 17.9% of all cancellations.
* **Validated Findings**:
    * **Peak Hour Correlation**: Statistical evidence confirmed that Severe Delays are significantly associated with specific hours of departure, notably around 8 AM and 5 PM.
    * **Price-Service Link**: ANOVA results concluded that ticket prices significantly differ across delay severity categories.
* **Documentation**: A complete report featuring an Abstract, Metadata Dictionary, and fully documented SAS Source Code for all transformations.
