# Multivariate Methods for Data Analysis: Predictive Modeling & Dimensionality Reduction

This project focuses on the application of advanced multivariate statistical techniques to a large-scale dataset. Using **SPSS**, the study transitions from building a predictive **Multiple Linear Regression (MLR)** model to simplifying complex data structures through **Exploratory Factor Analysis (EFA)**.

---

## The Challenge
Working with high-dimensional data often leads to multi-collinearity and "the curse of dimensionality." This project addresses these challenges by:
1. **Prediction:** Identifying the most significant predictors of a metric dependent variable using a stepwise approach.
2. **Reduction:** Grouping numerous independent variables into a few meaningful, latent "factors" to enhance model interpretability and robustness.

---

## The Dataset
The analysis is based on a comprehensive secondary dataset containing over **1,000 cases** with one metric dependent variable and eight metric independent variables.
* **Metadata & Preprocessing:** Conducted rigorous data auditing, including outlier detection and normality checks using **Skewness/Kurtosis** measures.
* **Metric Integrity:** Ensured all independent variables met the metric requirements for both MLR and Factor Analysis.

---

## Project Structure
The repository is divided into two distinct statistical investigations:

### Part 1: Stepwise Multiple Linear Regression
Developed a predictive model to understand the variance in the dependent variable.
* **Methodology:** Employed **Stepwise Selection** to automatically include only the most statistically significant predictors.
* **Assumption Testing:** Conducted 5-point diagnostic checks:
    * **Linearity:** Normal Probability (P-P) plots.
    * **Homoscedasticity:** Residual scatterplots.
    * **Independence:** Durbin-Watson test.
    * **Normality:** Histogram of standardized residuals.
    * **Multicollinearity:** Tolerance and Variance Inflation Factor (VIF).
* **Model Interpretation:** Evaluated $R^2$ and Adjusted $R^2$ to measure the percentage of explained variance.

### Part 2: Exploratory Factor Analysis (EFA)
Applied dimensionality reduction to simplify the metric independent variable set.
* **Suitability Testing:** Validated the dataset for factorability using the **Kaiser-Meyer-Olkin (KMO)** Measure of Sampling Adequacy and **Bartlett’s Test of Sphericity**.
* **Extraction & Rotation:** Used **Principal Component Analysis (PCA)** with **Varimax Rotation** to achieve a clear factor structure.
* **Latent Grouping:** Interpreted the **Scree Plot** and **Eigenvalues** to determine the optimal number of factors to retain.

* **Reliability:** Analyzed **Communalities** and addressed **Cross-loadings** to ensure each variable mapped uniquely and strongly to its assigned factor.

---

## Key Skills & Tools
* **Statistical Software:** Advanced proficiency in **SPSS**.
* **Multivariate Techniques:** Stepwise MLR, PCA, and Factor Rotation.
* **Diagnostic Analysis:** Residual analysis and multicollinearity diagnostics.
* **Model Refinement:** Addressing cross-loading and improving dataset factorability.

---

## Core Concepts
* **Dimensionality Reduction:** Condensing a large set of variables into smaller, uncorrelated latent factors.
* **Stepwise Selection:** A data-driven method for variable selection that prioritizes model parsimony.
* **Factor Loading:** The correlation between an original variable and a latent factor, used to name and interpret the new components.

---

## Key Results & Outputs
* **MLR Champion:** Finalized a model that excluded redundant variables while maintaining a high Adjusted $R^2$, confirming the importance of specific financial or demographic indicators.
* **Factor Mapping:** Successfully reduced 8+ variables into distinct factors (e.g., "Operational Efficiency" vs. "Financial Health"), simplifying future predictive efforts.
* **Technical Report:** A detailed 2,500-word report featuring SPSS output tables, annotated graphs, and a critical discussion on model robustness and sample size effects.
