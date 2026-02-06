# Applied Machine Learning: Predicting UK Rail Service Disruptions

This project applies **Supervised Machine Learning** to predict train service disruptions (delays and cancellations) within the UK National Rail network. Moving beyond descriptive analysis, this study focuses on building a predictive pipeline that handles severe class imbalance and evaluates multiple algorithmic approaches to improve service reliability.

---

## The Challenge
Predicting railway disruptions is inherently difficult due to the "imbalanced" nature of the data—most trains run on time, making disruptions rare but high-impact events. The objective was to develop a model that could accurately identify the 13% of disrupted journeys using only pre-event features, ensuring the model is practically useful for real-time forecasting.

---

## The Dataset
The study utilizes a structured dataset representing UK National Rail ticket sales and journeys.
* **Source:** [Maven Analytics Data Playground - UK Train Rides](https://mavenanalytics.io/data-playground/uk-train-rides)
* **Content**: Features including ticket types, booking lead times, route identifiers, and departure/arrival stations.
* **Feature Engineering**: 
    * **Exclusion of Post-Event Data**: Removed features like "Actual Arrival Time" to prevent data leakage.
    * **New Features**: Developed "Booking Lead Time" and "Historical Route Disruption Likelihood."
* **Data Balancing**: Implemented the **SMOTE (Synthetic Minority Over-sampling Technique)** algorithm combined with class weighting to address the significant class imbalance (87% On-Time vs. 13% Disrupted).

---

## Key Skills & Tools
* **Machine Learning Frameworks**: End-to-end pipeline development using **Scikit-Learn**.
* **Algorithms**: Implementation and comparative analysis of **Logistic Regression**, **Random Forest**, and **XGBoost**.
* **Optimization**: Hyperparameter tuning using **GridSearchCV** and **Cross-Validation**.
* **Evaluation Metrics**: Focus on **Macro-F1 Score**, **Precision-Recall curves**, and **Confusion Matrices** to account for class imbalance.

---

## Core Concepts
* **Pipeline Construction**: Integration of scaling, encoding, and SMOTE into a single cross-validated workflow to ensure robust performance and prevent leakage.
* **Ensemble Learning**: Utilizing Boosting (XGBoost) and Bagging (Random Forest) techniques to capture complex non-linear relationships in travel data.
* **Feature Importance**: Analyzing model coefficients and gain to identify the primary drivers of rail disruptions.

---

## Key Results & Outputs
* **Model Performance**: **XGBoost** emerged as the superior model, achieving the highest Macro-F1 score and demonstrating strong capability in identifying disruptions without excessive false alarms.
* **Predictive Insights**: Identified that specific routes and "Advance" ticket types (associated with specific peak travel windows) were the strongest predictors of potential service failure.
* **Practical Deliverable**: A fully documented Python-based ML pipeline capable of processing raw journey data and outputting a disruption probability score.
