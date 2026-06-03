-- Task 1: Show the cities of customers whose email contains 'example.com' or whose city is Berlin
SELECT "city"
FROM "customers"
WHERE "email" LIKE '%example.com'

UNION

SELECT "city"
FROM "customers"
WHERE "city" = 'Berlin'
ORDER BY "city";

-- Task 2: Show the names of products whose stock is 0 or whose price is at least 100
SELECT "name"
FROM "products"
WHERE "stock" = 0

UNION

SELECT "name"
FROM "products"
WHERE "price" >= 100
ORDER BY "name";

-- Task 3: Show the customer IDs of orders whose status is either 'pending' or 'shipped'
SELECT "customer_id"
FROM "orders"
WHERE "status" = 'pending'

UNION 

SELECT "customer_id"
FROM "orders"
WHERE "status" = 'shipped'
ORDER BY "customer_id";

-- Task 4: Show the product IDs from orders whose status is either 'delivered' or 'pending'
SELECT "product_id"
FROM "order_items" 
WHERE "order_id" IN (
    SELECT "id"
    FROM "orders"
    WHERE "status" = 'delivered'
)

UNION

SELECT "product_id"
FROM "order_items" 
WHERE "order_id" IN (
    SELECT "id"
    FROM "orders"
    WHERE "status" = 'pending'
)
ORDER BY "product_id";
