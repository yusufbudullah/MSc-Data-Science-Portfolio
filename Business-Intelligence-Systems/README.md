# Business Intelligence Systems: Analyzing UK National Rail Delays

This project is a comprehensive **Business Intelligence (BI)** study focused on identifying, analyzing, and mitigating train delays within the **UK National Rail** network. The project follows the complete BI lifecycle, from data extraction and descriptive analysis to prescriptive recommendations, to improve operational efficiency and passenger satisfaction.

---

## The Challenge
The UK National Rail network experienced significant service disruptions between **January and April 2024**, resulting in frequent delays, cancellations, and a surge in refund requests. The objective was to utilize systematic BI approaches, including diagnostic and knowledge analysis—to uncover root causes and propose data-driven strategies for optimized scheduling and infrastructure management.

---

## The Dataset
The project utilizes a dataset representing **UK National Rail ticket sales and journeys** from **January to April 2024**.
* **Source:** [Maven Analytics Data Playground - UK Train Rides](https://mavenanalytics.io/data-playground/uk-train-rides).
* **Content:** 30,000+ records featuring ticket types (Advance, Anytime, Off-Peak), departure/arrival stations, scheduled vs. actual travel times, journey status, and refund request markers.
* **Preprocessing:** Raw data was cleaned to resolve inconsistencies in "Reason for Delay" fields (e.g., grouping variations of "Signal Failure") and transformed to include new features like **Delay Severity** and **Route Identifiers**.

---

## Key Skills & Tools
* **Data Analysis & Visualization:** Descriptive and Diagnostic analysis using **Tableau**.
* **BI Frameworks:** Insight creation via the **4 stages of the BI lifecycle**.
* **Strategic Reporting:** Prescriptive analysis, KPI development, and scorecard design.
* **External Data Integration:** Correlating organizational data with external events (weather/strikes) and academic literature regarding AI-powered rail solutions.

---

## Core Concepts
* **Multi-Layered Analysis:** Integration of **Organizational Data**, **Information Analysis** (external events like Storm Henk and industrial strikes), and **Knowledge Analysis** (AI-powered scheduling and IoT maintenance frameworks).
* **Operational KPIs:** Monitoring metrics such as `% of Trains Delayed Over 15 Minutes`, `Average Delay Duration`, and `Refund Rates for Advance Tickets`.
* **Root Cause Identification:** Investigating "Operational Hotspots" on major intercity routes like Manchester Piccadilly to London Euston and Manchester to Leeds.

---

## Key Results & Outputs
* **Presentation:**
<p align="center">
  <a href="https://youtu.be/GBy6hpSBsoo">
    <img src="https://img.youtube.com/vi/GBy6hpSBsoo/maxresdefault.jpg?v=2" width="650">
  </a>
</p>

* **Diagnostic Findings:** Identified that **Weather Conditions (1,372 cases)**, Signal Issues, and Staffing shortages were the primary drivers of severe delays.
* **Customer Impact Insights:** Discovered a strong correlation between **Advance Ticket holders** and refund requests (27.13%), driven by the lack of travel flexibility during disruptions.
* **Prescriptive Deliverables:**
    * **Strategic Recommendations:** Implementation of AI-based delay prediction and automated refund systems.
    * **BI Performance Scorecard:** A centralized dashboard for real-time monitoring of delay severity and route risks.
    * **Infrastructure Plan:** Prioritizing preventative maintenance on signal-vulnerable routes.
