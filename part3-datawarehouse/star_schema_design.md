# Star Schema Design

## Section 1: Schema Overview
**FACT TABLE: fact_sales**
* **Grain:** One row per individual line item in a transaction.
* **Measures:** `quantity_sold`, `total_amount`, `discount_amount`.
* **Keys:** `date_key`, `product_key`, `customer_key`.

**DIMENSION: dim_date**
* Allows analysis by Fiscal Quarter, Month Name, and Weekend/Weekday trends.

**DIMENSION: dim_product**
* Attributes: Category, Subcategory, Unit Price. Allows slicing revenue by product hierarchy.

## Section 2: Design Decisions
We chose **Line-Item Granularity** to allow the deepest level of analysis (e.g., "Which products are sold most often in pairs?"). 
**Surrogate Keys** (integers) are used instead of natural keys (like 'C001') to insulate the Data Warehouse from changes in the source system (e.g., if IDs are reused or formats change) and to improve join performance (integers join faster than strings).

## Section 3: Sample Data Flow
**Source:** T001 | 2024-01-15 | C001 | P001 | $500
**DW Transformation:**
1. Lookup C001 -> Get `customer_key` 101.
2. Lookup P001 -> Get `product_key` 55.
3. Convert Date -> Get `date_key` 20240115.
**Target (fact_sales):** { 20240115, 55, 101, 1, 500.00 }
