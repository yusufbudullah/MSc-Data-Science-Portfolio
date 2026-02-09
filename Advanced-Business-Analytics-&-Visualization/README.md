# Advanced Business Analytics & Visualization: Visual Storytelling & Predictive Analytics

This repository contains two distinct projects that demonstrate expertise in high-impact visual communication and the technical development of predictive solutions. 

---

## Part 1: Visual Analytics & Storytelling (UK Rail Performance)
This project focuses on the "storytelling" aspect of data science, transforming raw operational data into an interactive visual narrative to drive business insights.

* **Objective:** To identify operational inefficiencies and revenue risks within the UK National Rail network through interactive exploration.
* **Dataset:** [Maven Analytics UK Train Rides](https://mavenanalytics.io/data-playground/uk-train-rides).
* **Key Skills & Tools:**
  * **Visual Storytelling:** Designing cohesive narratives using **Tableau Storyboards**
  * **Dashboard Engineering:** Creating interactive, user-driven drill-downs
  * **Communication:** [Recorded video walkthrough](https://youtu.be/0iM9l_zAdvw)

### Interactive Dashboard

<p align="center">
  <a href="https://public.tableau.com/views/YousoufBudullah_ABAV_UKRail/Story1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link">
    <img src="Outputs/Dashboard_Preview.png" width="650">
  </a>
</p>

Click the image to open the interactive Tableau dashboard.

* **Core Concepts:**
    * **Graphical Integrity:** Adhering to principles that ensure data is represented accurately without distortion.
    * **Operational Hotspots:** Identifying geographic or temporal clusters of service failure.
    * **Narrative Flow:** Guiding stakeholders from high-level KPIs to actionable root-cause insights.

---

## Part 2: Problem Analysis & Solution Development (Financial Churn Prediction)
This project is a technical deep-dive into the end-to-end data science lifecycle, focusing on solving the business problem of customer attrition in the financial sector.

* **Objective:** To design and validate a high-performance predictive model that identifies at-risk banking customers for proactive retention.
* **Dataset:** `Advanced-Business-Analytics-&-Visualization/Bank_Churn.csv`
* **Technologies Used:** **SAS Viya** (Primary modeling environment).
* **Key Skills & Tools:**
    * **Automated Feature Engineering:** Utilizing the **SAS Feature Machine** for variable generation.
    * **Advanced Pre-processing:** Implementing **Interactive Grouping** and **Imputation** strategies.
    * **Model Assessment:** Comparative analysis of ensemble and linear algorithms.
* **Core Concepts:**
    * **Predictive Modeling:** Building supervised learning pipelines to forecast binary outcomes (Churn vs. Retained).
    * **Model Validation:** Using **Lift Charts**, **ROC Curves**, and **Misclassification Rates** to determine model efficacy.
    * **Business Translation:** Converting model coefficients and "Importance Scores" into strategic business recommendations like **Age Specific Engagement**.

---

## Key Results & Outputs
* **Part 1:** A recorded video presentation and interactive dashboard demonstration.
* **Part 2:** A 3,000+ word technical report identifying **Gradient Boosting** as the champion model, revealing that inactivity and specific product counts are the strongest churn predictors.
