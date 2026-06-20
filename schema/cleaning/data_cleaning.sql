-- ============================================
-- Food Delivery Business Analysis
-- Author: Gaurav Mandhan
-- File: Schema Creation
-- ============================================

USE food_delivery;

-- ============================================
-- ISSUE 1: NULL city values in customers table
-- Found: 3 customers with missing city
-- Fix: Set to 'Unknown' for tracking purposes
-- ============================================
UPDATE customers 
SET city = 'Unknown' 
WHERE city IS NULL;

-- ============================================
-- ISSUE 2: Inconsistent city name casing
-- Found: 'pune' and 'MUMBAI' in raw data
-- Fix: Standardize to proper case
-- ============================================
UPDATE customers 
SET city = 'Pune' 
WHERE city = 'pune';

UPDATE customers 
SET city = 'Mumbai' 
WHERE city = 'MUMBAI';

-- ============================================
-- ISSUE 3: NULL delivery times on cancelled orders
-- Found: 5 cancelled orders with NULL delivery_time_mins
-- Fix: Set to 0 — cancelled orders have no delivery time
-- Business Logic: NULL here is misleading in AVG calculations
-- ============================================
UPDATE orders 
SET delivery_time_mins = 0 
WHERE status = 'Cancelled' AND delivery_time_mins IS NULL;

-- ============================================
-- VERIFICATION QUERIES
-- Run these after cleaning to confirm fixes
-- ============================================

-- Verify no NULL cities remain
SELECT customer_id, customer_name, city 
FROM customers 
WHERE city IS NULL;

-- Verify consistent casing
SELECT DISTINCT city 
FROM customers 
ORDER BY city;

-- Verify no NULL delivery times remain
SELECT order_id, status, delivery_time_mins 
FROM orders 
WHERE delivery_time_mins IS NULL;
