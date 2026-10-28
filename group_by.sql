-- SQL practice: GROUP BY, WHERE, HAVING, ORDER BY
-- Sample data: coconut sales by buyer and state

-- Create the table
CREATE TABLE sales (
    id INTEGER,
    buyer VARCHAR(50),
    state VARCHAR(30),
    type VARCHAR(10),
    bags INTEGER,
    price DECIMAL(6, 2)
);

-- Add sample rows
INSERT INTO sales VALUES
(1, 'Ravi Traders', 'Delhi', 'dry', 50, 12),
(2, 'Sharma & Co', 'Nagpur', 'ball', 30, 15),
(3, 'Ravi Traders', 'Delhi', 'ball', 20, 16),
(4, 'Gupta Stores', 'Indore', 'dry', 40, 11),
(5, 'Sharma & Co', 'Nagpur', 'dry', 60, 12),
(6, 'Gupta Stores', 'Indore', 'ball', 10, 15);

-- 1. Total bags per state
SELECT state, SUM(bags) AS total FROM sales GROUP BY state;

-- 2. Total bags per state, dry coconuts only
SELECT state, SUM(bags) AS total FROM sales WHERE type = 'dry' GROUP BY state;

-- 3. States with 60 or more bags in total
SELECT state, SUM(bags) AS total FROM sales GROUP BY state HAVING SUM(bags) >= 60;

-- 4. States sorted by total bags, biggest first
SELECT state, SUM(bags) AS total FROM sales GROUP BY state ORDER BY total DESC;
