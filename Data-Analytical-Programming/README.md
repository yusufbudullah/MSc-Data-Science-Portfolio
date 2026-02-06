# Data Analytical Programming: Loan Approval Prediction for LFI

This project focuses on automating the loan eligibility screening process for **Lasiandra Finance Inc. (LFI)**. By transforming a manual, time-consuming verification system into a data-driven predictive pipeline, the solution aims to minimize human error, reduce processing times, and improve the reliability of loan approvals for Small and Medium Enterprises (SMEs).

---

## The Challenge
LFI’s manual approval process was plagued by delays, inconsistency, and a high risk of bias. Loan officers had to cross-validate various personal and financial details individually, leading to significant operational bottlenecks. The objective was to build a predictive model that could accurately determine loan approvals and rejections based on historical customer portfolios.

---

## The Dataset
The project utilized two primary datasets: `TRAINING_DS` (614 records) and `TESTING_DS` (367 records).
* **Attributes**: Includes 13 variables such as `Candidate_Income`, `Guarantee_Income`, `Loan_Amount`, `Loan_Duration`, `Loan_History`, `Education`, and `Marital_Status`.
* **Preprocessing**: 
    * **Imputation**: Categorical missing values (e.g., `Marital_Status`, `Family_Members`) were replaced using **Mode** strategies. Numerical missing values (e.g., `Loan_Amount`, `Loan_Duration`) were handled using **Mean** imputation.
    * **Data Integrity**: Robust backup and restore utilities were implemented using SAS macros to ensure data safety throughout the cleaning process.

---

## Key Skills & Tools
* **Statistical Programming**: Extensive development using **SAS Studio** and **SAS 4GL**.
* **Analytical Procedures**: Mastery of `PROC LOGISTIC` for modeling, `PROC MEANS` for summary statistics, and `PROC FREQ` for distribution analysis.
* **Macro Development**: Created reusable **SAS Macros** for automated imputation, backup utilities, and complex report generation to reduce code redundancy.
* **Reporting & Visualization**: Leveraged the **SAS Output Delivery System (ODS)** to generate professional PDF reports and interactive graphical models (Pie charts, Stacked bar charts, and Box plots).

---

## Core Concepts
* **Predictive Modeling**: Implementation of **Logistic Regression** (Fisher's scoring) to forecast the binary outcome of `Loan_Approval_Status`.
* **Model Validation**: Evaluation of model fit using **AIC**, **SC**, and **-2 Log L** statistics, along with **Wald Chi-Square tests** for variable importance.
* **Bivariate Analysis**: Investigating relationships between demographics (Gender/Qualification) and financial capacity (Income/Loan Amount) to identify key predictors.
* **Automation**: Transitioning from manual verification to an automated **Loan Origination System (LOS)** logic.

---

## Key Results & Outputs
* **Predictive Champion**: The logistic regression model achieved stable convergence, with **Loan_History** and **Loan_Location** identified as the most significant predictors ($p < 0.05$).
* **Operational Success**: Out of 367 new applications in the testing set, the model successfully scored and categorized them, with **252 approvals** and **48 rejections** in the initial subset.
* **Strategic Insights**: 
    * Confirmed that larger loan amounts were more likely to be associated with approved status.
    * Identified that higher education (`Qualification`) is strongly associated with a higher probability of loan approval.
* **Professional Reporting**: Generated a comprehensive **PDF Bank Loan Approval Status Report** and complex location-specific reports (City/Town/Village) with narrative-style applicant remarks.
