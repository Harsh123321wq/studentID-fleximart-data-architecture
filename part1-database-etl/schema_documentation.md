# Database Schema Documentation

## Entity-Relationship Description

### Entity: customers
* **Purpose:** Stores demographic and contact information for registered users.
* **Attributes:**
    * `customer_id`: Unique identifier (Primary Key, Auto-increment).
    * `email`: Unique contact email (Business Key).
    * `registration_date`: Date the user signed up.
* **Relationships:**
    * One Customer has MANY Orders (1:N).

### Entity: orders
* **Purpose:** Headers for sales transactions.
* **Attributes:**
    * `order_id`: Unique transaction identifier.
    * `total_amount`: Aggregated value of the order.
* **Relationships:**
    * Belongs to ONE Customer.
    * Contains MANY Order Items (1:N).

## Normalization Explanation
This design complies with **Third Normal Form (3NF)**:
1.  **1NF:** All columns contain atomic values (no comma-separated lists).
2.  **2NF:** All non-key attributes depend on the entire primary key. In `order_items`, price depends on `product_id` and order info depends on `order_id`.
3.  **3NF:** No transitive dependencies. Customer city depends only on `customer_id`, not on the order. Product Category depends only on `product_id`.

## Sample Data
| customer_id | first_name | email |
|---|---|---|
| 1 | Rahul | rahul@gmail.com |
| 2 | Priya | priya@yahoo.com |
