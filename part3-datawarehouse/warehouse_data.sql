USE fleximart_dw;

-- 1. Populate Dimension Date (Sample for Jan-Feb 2024)
INSERT INTO dim_date (date_key, full_date, day_of_week, month, month_name, quarter, year, is_weekend) VALUES
(20240101, '2024-01-01', 'Monday', 1, 'January', 'Q1', 2024, FALSE),
(20240102, '2024-01-02', 'Tuesday', 1, 'January', 'Q1', 2024, FALSE),
(20240115, '2024-01-15', 'Monday', 1, 'January', 'Q1', 2024, FALSE),
(20240120, '2024-01-20', 'Saturday', 1, 'January', 'Q1', 2024, TRUE),
(20240201, '2024-02-01', 'Thursday', 2, 'February', 'Q1', 2024, FALSE),
(20240214, '2024-02-14', 'Wednesday', 2, 'February', 'Q1', 2024, FALSE);

-- 2. Populate Dimension Product
INSERT INTO dim_product (product_name, category, subcategory, unit_price) VALUES
('Galaxy S21', 'Electronics', 'Smartphone', 45000),
('MacBook Pro', 'Electronics', 'Laptop', 120000),
('Nike Air', 'Fashion', 'Footwear', 4000),
('Levi Jeans', 'Fashion', 'Clothing', 2500),
('Sony TV', 'Electronics', 'Television', 55000);

-- 3. Populate Dimension Customer
INSERT INTO dim_customer (customer_name, city, state, customer_segment) VALUES
('Rahul Sharma', 'Mumbai', 'MH', 'Regular'),
('Priya Patel', 'Ahmedabad', 'GJ', 'Premium'),
('Amit Kumar', 'Delhi', 'DL', 'Regular'),
('Sneha Reddy', 'Hyderabad', 'TS', 'Premium');

-- 4. Populate Fact Sales
INSERT INTO fact_sales (date_key, product_key, customer_key, quantity_sold, unit_price, total_amount) VALUES
(20240115, 1, 1, 1, 45000, 45000), -- Rahul bought Phone
(20240120, 3, 2, 2, 4000, 8000),   -- Priya bought 2 Shoes
(20240201, 2, 4, 1, 120000, 120000), -- Sneha bought Laptop
(20240214, 4, 3, 1, 2500, 2500);
