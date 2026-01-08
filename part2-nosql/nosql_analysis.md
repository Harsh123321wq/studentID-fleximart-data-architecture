# NoSQL Analysis Report

## Section A: Limitations of RDBMS
In the context of FlexiMart's catalog expansion, RDBMS faces significant friction. 
1. **Schema Rigidity:** Adding diverse products like "Laptops" (RAM, CPU) and "Shoes" (Size, Material) creates a **Sparse Matrix problem** in SQL, where a single table has many null columns for irrelevant attributes.
2. **Review Complexity:** Storing reviews in RDBMS requires a separate table joined by Foreign Keys. For a high-traffic product page, performing these joins for every read operation is expensive and increases latency.

## Section B: NoSQL Benefits (MongoDB)
MongoDB is ideal for this use case because:
1. **Flexible Schema:** It uses BSON documents. A laptop document can have a `cpu` field, while a shoe document has `size`, coexisting in the same collection without schema alteration commands (`ALTER TABLE`).
2. **Embedded Documents:** Reviews can be stored *inside* the product document as an array. This allows fetching the product details AND the top 5 reviews in a **single database read operation**, significantly boosting performance.

## Section C: Trade-offs
1. **ACID Compliance:** While MongoDB supports transactions, they are not as robust or performant as multi-table transactions in PostgreSQL.
2. **Data Duplication:** To optimize reads, data (like category names) is often duplicated across documents, making updates more complex (no cascading updates).
