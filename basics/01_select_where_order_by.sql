-- Task 1. Show all customers from Berlin
SELECT *
FROM "customers"
WHERE "city" = 'Berlin';

-- Task 2. Show product names and prices for products that cost more than 30
SELECT "name", "price"
FROM "products"
WHERE "price" > 30
ORDER BY "price" DESC;

-- Task 3. Show all orders with status "delivered"
SELECT *
FROM "orders"
WHERE "status" = 'delivered'
ORDER BY "order_date";