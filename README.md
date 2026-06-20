# Food-Delivery-SQL-Analysis
SQL-based business analysis of a food delivery platform covering revenue, cancellations, customer retention and delivery performance.

# Food Delivery Business Analysis — SQL Project

## Project Overview
This project simulates a real-world data analyst task for a food delivery company
(similar to Swiggy/Zomato). The goal was to analyze operational data and generate
actionable business insights across revenue, cancellations, customer behaviour,
and delivery performance.

---

## Business Problems Solved
| # | Business Question |
|---|-------------------|
| 1 | Which restaurants generate the most revenue? |
| 2 | Which cities have the highest cancellation rates? |
| 3 | Who are the top customers by lifetime value? |
| 4 | Which time slots drive peak orders? |
| 5 | Which delivery partners have the worst performance? |
| 6 | Which customers ordered once and never returned? |
| 7 | Which cuisine types command the highest order value? |
| 8 | What is the overall performance summary by city? |

---

## Database Schema
![Schema](https://via.placeholder.com/800x400?text=Schema+Diagram)

**Tables:**
- `customers` — customer profiles and locations
- `restaurants` — restaurant details and cuisine types
- `delivery_partners` — partner info and city coverage
- `orders` — transactional data linking all entities

---

## Data Cleaning Steps
Real-world dirty data was intentionally introduced and cleaned:

| Issue Found | Fix Applied |
|-------------|-------------|
| 3 customers had NULL city values | Updated to 'Unknown' for tracking |
| Inconsistent casing ('pune', 'MUMBAI') | Standardized to proper case |
| 5 NULL delivery times on cancelled orders | Set to 0 — cancelled orders have no delivery time |

---

## Key Business Insights

**1. Revenue Leaders**
Biryani Bros leads revenue despite mid-range order count — driven by high average
order value (₹680). High AOV restaurants should be protected from heavy discounting.

**2. Cancellation Risk**
Nagpur has a 33.33% cancellation rate — highest across all cities. Investigate
delivery partner coverage and restaurant reliability before expanding in this market.

**3. Customer Lifetime Value**
Rahul Sharma is the top customer at ₹1,390 lifetime value. Retention strategy
should target both high-frequency AND high-AOV customers separately.

**4. Peak Hours**
Lunch slot (12–15hrs) dominates both order volume and revenue. Delivery partner
availability must be prioritized during this window.

**5. Delivery Performance**
Anil Bhosale (Pune) averages 45.25 mins delivery time — highest in the network.
Slow delivery damages experience even when orders are not cancelled.

**6. Customer Retention**
33% of customers are one-time buyers. Re-engagement campaigns within 7 days of
first order could significantly improve retention at low acquisition cost.

**7. Cuisine AOV**
Japanese cuisine has the highest AOV but only 2 orders — statistically unreliable.
Indian cuisine is the safest revenue bet with highest volume and 2nd highest AOV.

**8. City Performance Summary**
| City | Revenue | Orders | Cancellation Rate | Avg Delivery Time |
|------|---------|--------|-------------------|-------------------|
| Mumbai | ₹4,900 | 12 | 8.33% | 37.27 mins |
| Pune | ₹3,460 | 8 | 0.00% | 39.25 mins |
| Nagpur | ₹1,320 | 6 | 33.33% | 25.75 mins |
| Unknown | ₹1,510 | 4 | 25.00% | 42.00 mins |

---

## Tools Used
- **MySQL** — database creation, querying, analysis
- **SQL Concepts** — JOINs, CTEs, Window Functions, CASE statements, RANK, LAG, Subqueries

---

## Project Structure
Food-Delivery-SQL-Analysis/

├── <img width="1920" height="1020" alt="Schema-Create Tables" src="https://github.com/user-attachments/assets/08444e95-ec57-401e-84d8-21bc37db9e7d" />
     — Database and table creation

├── <img width="1920" height="1020" alt="Insert Data" src="https://github.com/user-attachments/assets/d64ca969-c5b8-402e-8144-6ed619110ad4" />
 — Raw data with intentional quality issues

├── <img width="1920" height="1020" alt="Data Cleaning" src="https://github.com/user-attachments/assets/cb4c886a-ace3-4be1-a196-d7098f8ecfca" />
— Data cleaning steps with comments

├── <img width="1920" height="1020" alt="Business Analysis_1" src="https://github.com/user-attachments/assets/071604ef-859d-4359-b005-5a308557ca22" />
    <img width="1920" height="1020" alt="Business Analysis_2" src="https://github.com/user-attachments/assets/6d95da50-ba79-4288-a49b-04bc76a628f2" />
 — Business queries

└── <img width="1920" height="1020" alt="Business Insights" src="https://github.com/user-attachments/assets/00e52e73-03c8-4fae-ab7d-6a4a609f6c90" />
 — Written insights and recommendations

## How to Run
1. Open MySQL Workbench or any MySQL client
2. Run `schema/create_tables.sql` first
3. Run `data/insert_data.sql` to load data
4. Run `cleaning/data_cleaning.sql` to clean the data
5. Run `analysis/business_queries.sql` to see all analysis

---

## Author
**Gaurav Mandhan** — Aspiring Data Analyst
[LinkedIn](https://linkedin.com/in/gaurav-mandhan-719a95407) |
[GitHub](https://github.com/gauravmandhan2-design)
