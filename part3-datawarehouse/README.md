# Part 3: Data Warehouse and Analytics

## Overview
This component focuses on building a **Star Schema** data warehouse (`fleximart_dw`) designed for high-performance analytical reporting. It transitions the data from a normalized transactional structure to a dimensional model optimized for Business Intelligence (BI).



## Dimensional Model Design

### 1. Fact Table: `fact_sales`
- **Grain:** Individual transaction line-item level.
- **Measures:** Quantity Sold, Unit Price, Discount Amount, Total Amount.
- **Purpose:** Stores the quantitative metrics of the business.

### 2. Dimension Tables
- **`dim_date`:** Enables time-series analysis (Daily, Monthly, Quarterly, Yearly).
- **`dim_product`:** Contains product attributes for category-level performance tracking.
- **`dim_customer`:** Contains geographic and segment data for demographic analysis.

## Key Features
- **Surrogate Keys:** All dimension tables use integer surrogate keys (e.g., `product_key`) instead of natural keys to maintain historical accuracy and improve join speed.
- **Drill-Down Capability:** The `dim_date` table allows stakeholders to drill down from Yearly totals to specific months or even weekend vs. weekday performance.
- **OLAP Queries:** Includes complex SQL using Window Functions and CTEs for revenue percentage and customer segmentation.

## Files in this Directory
- `star_schema_design.md`: Detailed documentation of the fact/dimension relationships and design justifications.
- `warehouse_schema.sql`: DDL script to create the Data Warehouse structure.
- `warehouse_data.sql`: DML script with 40+ realistic transaction records.
- `analytics_queries.sql`: SQL scripts for Monthly Trends, Top Products, and Customer Value Segmentation.

## How to Run
1. Create the warehouse database:
   ```sql
   CREATE DATABASE fleximart_dw;
