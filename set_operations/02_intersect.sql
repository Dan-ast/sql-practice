-- Task 1: Show the customer IDs that appear in both pending and delivered orders
SELECT "customer_id"
FROM "orders"
WHERE "status" = 'pending'

INTERSECT 

SELECT "customer_id"
FROM "orders"
WHERE "status" = 'delivered'
ORDER BY "customer_id";

-- Task 2: Show the product IDs of items that appear in both delivered and pending orders
SELECT "product_id"
FROM "order_items"
WHERE "order_id" IN (
    SELECT "id"
    FROM "orders"
    WHERE "status" = 'delivered'
)

INTERSECT 

SELECT "product_id"
FROM "order_items"
WHERE "order_id" IN (
    SELECT "id"
    FROM "orders"
    WHERE "status" = 'pending'
)
ORDER BY "product_id";

-- Task 3: Show the cities that have at least one customer whose email contains 'example.com' and at least one customer whose last name starts with 'N'
SELECT "city"
FROM "customers"
WHERE "email" LIKE '%example.com'

INTERSECT

SELECT "city"
FROM "customers"
WHERE "last_name" LIKE 'N%'

ORDER BY "city";

-- Task 4: Show the categories that contain products with stock = 0 and products with price >= 100
SELECT "category"
FROM "products"
WHERE "stock" = 0

INTERSECT

SELECT "category"
FROM "products"
WHERE "price" >= 100

ORDER BY "category";