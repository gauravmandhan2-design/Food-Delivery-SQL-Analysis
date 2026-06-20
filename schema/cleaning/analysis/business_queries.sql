-- ============================================
-- Food Delivery Business Analysis
-- Author: Gaurav Mandhan
-- File: Schema Creation
-- ============================================

USE food_delivery;

-- ============================================
-- QUERY 1: Restaurant Revenue Ranking
-- Business Question: Which restaurants generate the most revenue?
-- ============================================
SELECT 
    r.restaurant_name,
    r.cuisine_type,
    COUNT(o.order_id) AS total_orders,
    SUM(o.order_value) AS total_revenue,
    ROUND(AVG(o.order_value), 2) AS avg_order_value
FROM restaurants r
JOIN orders o ON r.restaurant_id = o.restaurant_id
WHERE o.status = 'Delivered'
GROUP BY r.restaurant_id, r.restaurant_name, r.cuisine_type
ORDER BY total_revenue DESC;

-- ============================================
-- QUERY 2: Cancellation Rate by City
-- Business Question: Which cities have the highest cancellation rates?
-- ============================================
SELECT 
    c.city,
    COUNT(o.order_id) AS total_orders,
    SUM(CASE WHEN o.status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_orders,
    ROUND(SUM(CASE WHEN o.status = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / 
          COUNT(o.order_id), 2) AS cancellation_rate_pct
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.city
ORDER BY cancellation_rate_pct DESC;

-- ============================================
-- QUERY 3: Customer Lifetime Value — Window Function
-- Business Question: Who are the top customers by lifetime value?
-- ============================================
SELECT 
    customer_id,
    customer_name,
    city,
    total_orders,
    lifetime_value,
    ROUND(avg_order_value, 2) AS avg_order_value,
    RANK() OVER (ORDER BY lifetime_value DESC) AS value_rank
FROM (
    SELECT 
        c.customer_id,
        c.customer_name,
        c.city,
        COUNT(o.order_id) AS total_orders,
        SUM(o.order_value) AS lifetime_value,
        AVG(o.order_value) AS avg_order_value
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    WHERE o.status = 'Delivered'
    GROUP BY c.customer_id, c.customer_name, c.city
) ranked_customers
ORDER BY value_rank;

-- ============================================
-- QUERY 4: Peak Order Time Slots
-- Business Question: Which time slots drive the most orders and revenue?
-- ============================================
SELECT 
    HOUR(order_date) AS order_hour,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(order_value), 2) AS total_revenue,
    CASE 
        WHEN HOUR(order_date) BETWEEN 6 AND 11 THEN 'Morning'
        WHEN HOUR(order_date) BETWEEN 12 AND 15 THEN 'Lunch'
        WHEN HOUR(order_date) BETWEEN 16 AND 18 THEN 'Evening'
        WHEN HOUR(order_date) BETWEEN 19 AND 23 THEN 'Dinner'
        ELSE 'Late Night'
    END AS time_slot
FROM orders
WHERE status = 'Delivered'
GROUP BY order_hour
ORDER BY total_orders DESC;

-- ============================================
-- QUERY 5: Delivery Partner Performance
-- Business Question: Which delivery partners have the worst delivery times?
-- ============================================
SELECT 
    dp.partner_name,
    dp.city,
    COUNT(o.order_id) AS total_deliveries,
    ROUND(AVG(o.delivery_time_mins), 2) AS avg_delivery_time,
    MAX(o.delivery_time_mins) AS worst_delivery_time,
    RANK() OVER (ORDER BY AVG(o.delivery_time_mins) DESC) AS performance_rank
FROM delivery_partners dp
JOIN orders o ON dp.partner_id = o.partner_id
WHERE o.status = 'Delivered'
GROUP BY dp.partner_id, dp.partner_name, dp.city
ORDER BY avg_delivery_time DESC;

-- ============================================
-- QUERY 6: Customer Retention Analysis
-- Business Question: Who ordered once and never came back?
-- ============================================
SELECT 
    c.customer_id,
    c.customer_name,
    c.city,
    COUNT(o.order_id) AS total_orders,
    MIN(o.order_date) AS first_order,
    MAX(o.order_date) AS last_order,
    CASE 
        WHEN COUNT(o.order_id) = 1 THEN 'One-Time Customer'
        WHEN COUNT(o.order_id) BETWEEN 2 AND 3 THEN 'Occasional Customer'
        ELSE 'Loyal Customer'
    END AS customer_segment
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status = 'Delivered'
GROUP BY c.customer_id, c.customer_name, c.city
ORDER BY total_orders ASC;

-- ============================================
-- QUERY 7: Average Order Value by Cuisine Type
-- Business Question: Which cuisines command the highest order value?
-- ============================================
SELECT 
    r.cuisine_type,
    COUNT(o.order_id) AS total_orders,
    ROUND(AVG(o.order_value), 2) AS avg_order_value,
    ROUND(SUM(o.order_value), 2) AS total_revenue,
    RANK() OVER (ORDER BY AVG(o.order_value) DESC) AS aov_rank
FROM restaurants r
JOIN orders o ON r.restaurant_id = o.restaurant_id
WHERE o.status = 'Delivered'
GROUP BY r.cuisine_type
ORDER BY avg_order_value DESC;

-- ============================================
-- QUERY 8: City Level Performance Summary
-- Business Question: How does each city perform across all key metrics?
-- ============================================
SELECT 
    c.city,
    COUNT(o.order_id) AS total_orders,
    SUM(CASE WHEN o.status = 'Delivered' THEN 1 ELSE 0 END) AS delivered_orders,
    SUM(CASE WHEN o.status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_orders,
    ROUND(SUM(CASE WHEN o.status = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / 
          COUNT(o.order_id), 2) AS cancellation_rate_pct,
    ROUND(SUM(CASE WHEN o.status = 'Delivered' THEN o.order_value ELSE 0 END), 2) AS total_revenue,
    ROUND(AVG(CASE WHEN o.status = 'Delivered' THEN o.order_value END), 2) AS avg_order_value,
    ROUND(AVG(CASE WHEN o.status = 'Delivered' THEN o.delivery_time_mins END), 2) AS avg_delivery_time
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.city
ORDER BY total_revenue DESC;
