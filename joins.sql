-- SQL practice: INNER JOIN and LEFT JOIN
-- Sample data: coconut buyers and their lorry orders

-- Buyers table
CREATE TABLE buyers (
    buyer_id INTEGER,
    name VARCHAR(50),
    city VARCHAR(30)
);

INSERT INTO buyers VALUES
(1, 'Ravi Traders', 'Delhi'),
(2, 'Sharma & Co', 'Nagpur'),
(3, 'Gupta Stores', 'Indore'),
(4, 'Khan Brothers', 'Bhopal'),
(5, 'Patel Mart', 'Delhi'),
(6, 'Joshi Foods', 'Jaipur');

-- Orders table (price = rupees per bag)
CREATE TABLE orders (
    order_id INTEGER,
    buyer_id INTEGER,
    type VARCHAR(10),
    bags INTEGER,
    price INTEGER,
    month VARCHAR(3)
);

INSERT INTO orders VALUES
(101, 1, 'dry', 50, 620, 'Aug'),
(102, 2, 'ball', 30, 750, 'Aug'),
(103, 1, 'ball', 20, 800, 'Aug'),
(104, 3, 'dry', 40, 580, 'Sep'),
(105, 2, 'dry', 60, 640, 'Sep'),
(106, 5, 'dry', 80, 650, 'Sep'),
(107, 3, 'ball', 25, 740, 'Sep'),
(108, 1, 'dry', 45, 700, 'Oct'),
(109, 5, 'ball', 35, 790, 'Oct'),
(110, 2, 'dry', 70, 690, 'Oct');

-- 1. Each order with the buyer's name (INNER JOIN)
SELECT o.order_id, b.name, o.bags
FROM orders o
INNER JOIN buyers b ON o.buyer_id = b.buyer_id;

-- 2. Total bags per buyer
SELECT b.name, SUM(o.bags) AS total_bags
FROM orders o
INNER JOIN buyers b ON o.buyer_id = b.buyer_id
GROUP BY b.name;
-- Result: Gupta Stores 65, Patel Mart 115, Ravi Traders 115, Sharma & Co 160

-- 3. Total dry bags per city (JOIN + WHERE + GROUP BY)
SELECT b.city, SUM(o.bags) AS dry_bags
FROM orders o
INNER JOIN buyers b ON o.buyer_id = b.buyer_id
WHERE o.type = 'dry'
GROUP BY b.city;
-- Result: Delhi 175, Indore 40, Nagpur 130

-- 4. Number of orders per buyer, including buyers with 0 orders (LEFT JOIN)
SELECT b.name, COUNT(o.order_id) AS order_count
FROM buyers b
LEFT JOIN orders o ON b.buyer_id = o.buyer_id
GROUP BY b.name;
-- Result: Khan Brothers and Joshi Foods show 0
-- COUNT(o.order_id) is used because COUNT(*) would count their empty row as 1

-- 5. Buyers who have never ordered (LEFT JOIN + IS NULL)
SELECT b.name
FROM buyers b
LEFT JOIN orders o ON b.buyer_id = o.buyer_id
WHERE o.order_id IS NULL;
-- Result: Khan Brothers, Joshi Foods

-- 6. Revenue per city, highest first
SELECT b.city, SUM(o.bags * o.price) AS revenue
FROM orders o
INNER JOIN buyers b ON o.buyer_id = b.buyer_id
GROUP BY b.city
ORDER BY revenue DESC;
-- Result: Delhi 158150, Nagpur 109200, Indore 41700
