# Part 2: NoSQL Database Analysis & Implementation

## Overview
This component explores the transition of FlexiMart's product catalog from a rigid relational structure to a flexible Document Store (MongoDB). This part includes a theoretical justification for NoSQL and practical implementation of complex queries and aggregations.



## Files in this Directory
- `nosql_analysis.md`: A detailed report covering the limitations of RDBMS, the benefits of MongoDB's flexible schema, and the trade-offs involved in using NoSQL.
- `mongodb_operations.js`: JavaScript file containing the MongoDB shell commands for:
    - Data ingestion
    - Category-based filtering
    - Nested array aggregation (Review ratings)
    - Document updates
    - Multi-stage aggregation pipelines
- `products_catalog.json`: The raw JSON dataset containing enriched product metadata including nested specifications and user reviews.

## Key Features Implemented

### 1. Flexible Schema Analysis
Unlike the `products` table in Part 1, the MongoDB catalog supports polymorphic attributes. For example, "Electronics" documents contain `processor` and `ram` fields, while "Fashion" documents contain `material` and `fit`, without requiring a common schema.

### 2. Nested Data Handling
User reviews are stored as an array of objects directly within the product document. This eliminates the need for complex JOINs when displaying product pages, improving read performance.

### 3. Aggregation Pipelines
Implemented a complex aggregation to calculate the average price and product count per category, demonstrating MongoDB's capability to handle analytical workloads.

## How to Run
1. **Ensure MongoDB is installed** and the service is running.
2. **Open your terminal** or MongoDB Compass.
3. **Import the data** using `mongoimport` or by running the script:
   ```bash
   mongosh < mongodb_operations.js
