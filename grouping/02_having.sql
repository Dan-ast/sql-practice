-- Task 1. Show cities where more than one customer lives
SELECT "city", COUNT(*) AS "number of customers"
FROM "customers"
GROUP BY "city"
HAVING COUNT(*) > 1
ORDER BY "city";

-- Task 2. Show categories that have more than 2 products
SELECT "category", COUNT(*) AS "number of products"
FROM "products"
GROUP BY "category"
HAVING COUNT(*) > 2
ORDER BY "number of products" DESC;

-- Task 3. Show customer IDs with more than 1 order
SELECT "customer_id", COUNT(*) AS "number of orders"
FROM "orders"
GROUP BY "customer_id"
HAVING COUNT(*) > 1
ORDER BY "customer_id";

-- Task 4. Show statuses with fewer than 3 orders
SELECT "status", COUNT(*) AS "number of orders"
FROM "orders"
GROUP BY "status"
HAVING COUNT(*) < 3
ORDER BY "status";