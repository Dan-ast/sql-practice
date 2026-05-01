-- Task 1. Show cities and the number of customers in each city
SELECT "city", COUNT(*) AS "number of customers"
FROM "customers"
GROUP BY "city"
ORDER BY COUNT("id") DESC, "city";

-- Task 2. Show categories and the number of products in each category
SELECT "category", COUNT(*) AS "number of products"
FROM "products"
GROUP BY "category"
ORDER BY "number of products" DESC, "category";

-- Task 3. Show the status and the number of orders for each status
SELECT "status", COUNT(*) AS "number of orders"
FROM "orders"
GROUP BY "status"
ORDER BY "status";

-- Task 4. Show customer_id and the number of orders for each customer
SELECT "customer_id", COUNT(*) AS "number of orders"
FROM "orders"
GROUP BY "customer_id"
ORDER BY "amount of orders" DESC, "customer_id";