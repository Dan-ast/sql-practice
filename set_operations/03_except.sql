-- Task 1: Show the customer IDs who have 'pending' orders but no 'delivered' orders
SELECT "customer_id"
FROM "orders"
WHERE "status" = 'pending'

EXCEPT

SELECT "customer_id"
FROM "orders"
WHERE "status" = 'delivered'

ORDER BY "customer_id";

-- Task 2. Show the product IDs of items that have been delivered but do not appear in pending orders
SELECT "product_id"
FROM "order_items"
WHERE "order_id" IN (
    SELECT "id"
    FROM "orders"
    WHERE "status" = 'delivered'
)

EXCEPT 

SELECT "product_id"
FROM "order_items"
WHERE "order_id" IN (
    SELECT "id"
    FROM "orders"
    WHERE "status" = 'pending'
)
ORDER BY "product_id";

-- Task 3. Show the cities that appear in in the group of customers with 'example.com' in their email, but not in the group of customers whose last name starts with 'N'
SELECT "city"
FROM "customers"
WHERE "email" LIKE '%example.com'

EXCEPT 

SELECT "city"
FROM "customers"
WHERE "last_name" LIKE 'N%'

ORDER BY "city";

-- Task 4: Show the categories that appear in the group of products with stock = 0 but not in the group of products with price >= 100
SELECT "category"
FROM "products"
WHERE "stock" = 0

EXCEPT 

SELECT "category"
FROM "products"
WHERE "price" >= 100

ORDER BY "category";