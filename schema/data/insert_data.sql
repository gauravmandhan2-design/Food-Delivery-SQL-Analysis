USE food_delivery;

-- CUSTOMERS
-- Note: Contains NULL cities and inconsistent casing (intentional for cleaning exercise)
INSERT INTO customers (customer_name, city, signup_date) VALUES
('Rahul Sharma', 'Mumbai', '2023-01-15'),
('Priya Patel', 'Pune', '2023-02-20'),
('Amit Singh', 'Mumbai', '2023-01-28'),
('Sneha Kulkarni', 'Nagpur', '2023-03-10'),
('Rohit Verma', NULL, '2023-03-22'),
('Anjali Mehta', 'Pune', '2023-04-05'),
('Vikram Nair', 'Mumbai', '2023-04-18'),
('Pooja Joshi', 'Nagpur', '2023-05-02'),
('Karan Malhotra', 'pune', '2023-05-15'),
('Divya Reddy', 'Mumbai', '2023-06-01'),
('Arjun Das', 'Nagpur', '2023-06-14'),
('Neha Gupta', NULL, '2023-07-03'),
('Suresh Iyer', 'Mumbai', '2023-07-22'),
('Meera Pillai', 'Pune', '2023-08-08'),
('Raj Khanna', 'MUMBAI', '2023-08-25');

-- RESTAURANTS
INSERT INTO restaurants (restaurant_name, cuisine_type, city, avg_prep_time_mins) VALUES
('Spice Garden', 'Indian', 'Mumbai', 25),
('Pizza Hub', 'Italian', 'Pune', 20),
('Burger Barn', 'Fast Food', 'Mumbai', 15),
('Dosa Palace', 'South Indian', 'Nagpur', 30),
('Wok Express', 'Chinese', 'Pune', 20),
('Biryani Bros', 'Indian', 'Mumbai', 35),
('Taco Town', 'Mexican', 'Nagpur', 25),
('Sushi Stop', 'Japanese', 'Pune', 40),
('Chole Bhature Co.', 'North Indian', 'Mumbai', 20),
('Dessert Den', 'Desserts', 'Nagpur', 10);

-- DELIVERY PARTNERS
INSERT INTO delivery_partners (partner_name, city, join_date) VALUES
('Ramesh Kumar', 'Mumbai', '2023-01-10'),
('Sunil Patil', 'Pune', '2023-02-14'),
('Mahesh Yadav', 'Nagpur', '2023-01-20'),
('Deepak Tiwari', 'Mumbai', '2023-03-05'),
('Anil Bhosale', 'Pune', '2023-04-12'),
('Ganesh More', 'Nagpur', '2023-02-28'),
('Ravi Shinde', 'Mumbai', '2023-05-18'),
('Prakash Jadhav', 'Pune', '2023-06-01');

-- ORDERS
-- Note: Contains NULL delivery times on cancelled orders (intentional for cleaning exercise)
INSERT INTO orders (customer_id, restaurant_id, partner_id, order_date, delivery_time_mins, order_value, status) VALUES
(1, 1, 1, '2023-06-01 12:30:00', 45, 450.00, 'Delivered'),
(2, 2, 2, '2023-06-01 13:00:00', 30, 320.00, 'Delivered'),
(3, 3, 4, '2023-06-02 19:15:00', 25, 280.00, 'Delivered'),
(4, 4, 3, '2023-06-02 20:00:00', NULL, 510.00, 'Cancelled'),
(5, 1, 1, '2023-06-03 12:45:00', 50, 390.00, 'Delivered'),
(6, 5, 5, '2023-06-03 21:00:00', 35, 420.00, 'Delivered'),
(7, 6, 7, '2023-06-04 13:30:00', 60, 680.00, 'Delivered'),
(8, 7, 6, '2023-06-04 20:30:00', NULL, 350.00, 'Cancelled'),
(9, 2, 2, '2023-06-05 12:00:00', 28, 290.00, 'Delivered'),
(10, 8, 5, '2023-06-05 19:45:00', 55, 890.00, 'Delivered'),
(1, 6, 1, '2023-06-06 13:15:00', 65, 720.00, 'Delivered'),
(2, 9, 2, '2023-06-06 20:00:00', 22, 180.00, 'Delivered'),
(3, 1, 4, '2023-06-07 12:30:00', 40, 460.00, 'Delivered'),
(11, 3, 7, '2023-06-07 19:00:00', 20, 310.00, 'Delivered'),
(12, 4, 3, '2023-06-08 13:00:00', NULL, 540.00, 'Cancelled'),
(13, 5, 8, '2023-06-08 20:30:00', 38, 400.00, 'Delivered'),
(14, 6, 5, '2023-06-09 12:15:00', 58, 650.00, 'Delivered'),
(15, 7, 6, '2023-06-09 21:00:00', 30, 370.00, 'Delivered'),
(1, 10, 1, '2023-06-10 13:30:00', 15, 220.00, 'Delivered'),
(4, 2, 3, '2023-06-10 19:15:00', 32, 340.00, 'Delivered'),
(5, 8, 6, '2023-06-11 12:00:00', 48, 760.00, 'Delivered'),
(6, 1, 7, '2023-06-11 20:00:00', 42, 430.00, 'Delivered'),
(7, 9, 4, '2023-06-12 13:00:00', 25, 190.00, 'Delivered'),
(8, 3, 8, '2023-06-12 19:30:00', 18, 260.00, 'Delivered'),
(9, 6, 2, '2023-06-13 12:45:00', 55, 700.00, 'Delivered'),
(10, 4, 3, '2023-06-13 20:15:00', NULL, 520.00, 'Cancelled'),
(11, 5, 5, '2023-06-14 13:30:00', 33, 410.00, 'Delivered'),
(12, 7, 6, '2023-06-14 21:00:00', 28, 360.00, 'Delivered'),
(13, 10, 1, '2023-06-15 12:00:00', 12, 240.00, 'Delivered'),
(14, 1, 7, '2023-06-15 19:45:00', 44, 470.00, 'Delivered');
