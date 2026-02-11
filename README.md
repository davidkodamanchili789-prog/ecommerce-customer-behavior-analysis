E-Commerce Analytics & High-Speed ETL Pipeline
📌 Project Overview
This project transforms raw, unstructured e-commerce data into actionable business intelligence. It addresses the common industry challenge of "Dirty Data" and slow ingestion speeds by implementing a Staging Table ETL Pattern in MySQL, coupled with a high-performance Power BI Executive Dashboard.

The analysis focuses on identifying high-value user segments and discovering product correlations to drive cross-selling strategies.

🛠️ Tech Stack
Database: MySQL (Advanced SQL for ETL & Data Modeling)

Visualization: Power BI Desktop (DAX, UI/UX Design)

Data Processing: CSV Staging & In-place Transformations

Design: Monochromatic Professional UI (Rose/Pink Palette)

🚀 The Problem & Technical Solution
1. The "Ingestion Bottleneck"
Problem: The raw dataset (17,000+ rows) contained inconsistent data types, specifically Boolean strings ("True"/"False") and varied date formats, which caused standard CSV import wizards to fail or take over 20 minutes to process. Solution: * Implemented a Staging Table Pattern. Data was first ingested as raw VARCHAR strings into a temporary table.

Utilized LOAD DATA LOCAL INFILE for bulk ingestion, reducing the data load time from ~20 minutes to 0.78 seconds.

Used STR_TO_DATE and CAST functions to perform "In-place Transformations" while moving data from the Staging table to the Production table.

2. Market Basket Analysis (Product Affinity)
Problem: The business needed to know which products are frequently bought together to optimize their website layout. Solution: * Developed a Self-Join SQL Query to compare products bought by the same Customer_ID within the same session.

Generated a Correlation Strength Matrix (Product Affinity) which now powers the "Recommended Categories" section of the dashboard.

📊 Key Analytics & Insights
User Segmentation: By segmenting users based on session depth, the analysis revealed that "High-Intent" users (viewing >12 pages) have a significantly higher Average Order Value (AOV) compared to standard browsers.

Conversion Funnel: Identified specific drop-off points in the customer journey where session duration did not correlate with purchase intent.

Revenue Optimization: The dashboard highlights the "Sweet Spot" for discounts—finding the exact threshold where discount amounts maximize total revenue without eroding margins.
