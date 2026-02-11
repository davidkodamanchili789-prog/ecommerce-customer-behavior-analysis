# E-Commerce Customer Behavior & Analytics Dashboard

## 📌 Project Overview
This project provides a comprehensive analysis of e-commerce user behavior, linking session engagement metrics (time on site, pages viewed) to financial outcomes (Average Order Value, Total Revenue). By leveraging a custom ETL pipeline and a trendy, brand-aligned Power BI dashboard, this project identifies high-conversion user segments and product cross-sell opportunities.

## 🛠️ Tech Stack
- **Database:** MySQL (Data Modeling & ETL)
- **Data Visualization:** Power BI Desktop
- **Design:** Custom UI/UX (Professional Rose/Pink Palette)
- **Scripting:** SQL, Markdown

## 🚀 Key Technical Challenges & Solutions

### 1. Optimized ETL Pipeline (MySQL)
**Challenge:** Standard import wizards were failing due to boolean data types ("True/False") and were extremely slow for the 17,000+ row dataset.
**Solution:** - Implemented a **Staging Table pattern** to ingest raw CSV data as text.
- Utilized `LOAD DATA LOCAL INFILE` to reduce ingestion time from ~20 minutes to **0.78 seconds**.
- Engineered SQL scripts to transform data types (Boolean/Date) during the migration from Staging to Final tables.

### 2. Custom UI/UX Implementation (Power BI)
**Challenge:** Standard dashboard templates often look generic and lack a professional "brand" feel.
**Solution:** - Developed a **Professional Pink/Rose theme** using a monochromatic palette (`#881337`, `#FB7185`, `#FFF1F2`).
- Applied a **Card-Based Layout** with rounded corners and soft shadows for a modern, application-like feel.
- Followed the **Z-Pattern** layout to prioritize Key Performance Indicators (KPIs).

## 📊 Dashboard Insights
- **Customer Journey Funnel:** Visualized the drop-off between high-intent browsers (>12 pages) and standard users, revealing that high-intent users spend **X% more** on average.
- **Product Affinity Matrix:** Used a self-join SQL logic to create a heatmap of "Frequently Bought Together" categories.
- **Session Engagement:** Identified the "sweet spot" for session duration that leads to maximum revenue per order.

## 📁 Project Structure
```text
├── data/                  # Raw and Cleaned CSV files
├── scripts/               # main_analysis_and_etl.sql
├── dashboard/             # E-Commerce_Analytics.pbix & screenshots
└── documentation/         # README.md and project reports