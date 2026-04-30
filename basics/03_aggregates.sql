-- Task 1. Count all customers
SELECT COUNT(*) AS "total customers"
FROM "customers";

-- Task 2. Find the average price of all products
SELECT AVG("price") AS "average price"
FROM "products";

-- Task 3. Find the cheapest and the most expensive product
SELECT MIN("price") AS "min price", MAX("price") AS "max price"
FROM "products";

-- Task 4. Count all delivered orders
SELECT COUNT(*) AS "delivered orders"
FROM "orders"
WHERE "status" = 'delivered';
