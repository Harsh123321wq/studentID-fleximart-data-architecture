-- Query 1: Monthly Sales Drill-Down
SELECT 
    d.year, d.quarter, d.month_name,
    SUM(f.total_amount) as total_sales,
    SUM(f.quantity_sold) as total_quantity
FROM fact_sales f
JOIN dim_date d ON f.date_key = d.date_key
WHERE d.year = 2024
GROUP BY d.year, d.quarter, d.month, d.month_name
ORDER BY d.month;

-- Query 2: Top Products by Revenue
SELECT 
    p.product_name, 
    p.category,
    SUM(f.quantity_sold) as units_sold,
    SUM(f.total_amount) as revenue,
    (SUM(f.total_amount) / (SELECT SUM(total_amount) FROM fact_sales) * 100) as revenue_percentage
FROM fact_sales f
JOIN dim_product p ON f.product_key = p.product_key
GROUP BY p.product_key
ORDER BY revenue DESC
LIMIT 10;

-- Query 3: Customer Segmentation Analysis
SELECT 
    CASE 
        WHEN SUM(f.total_amount) > 50000 THEN 'High Value'
        WHEN SUM(f.total_amount) BETWEEN 20000 AND 50000 THEN 'Medium Value'
        ELSE 'Low Value'
    END as customer_segment,
    COUNT(DISTINCT f.customer_key) as customer_count,
    SUM(f.total_amount) as total_revenue
FROM fact_sales f
GROUP BY customer_segment;
