-- Task 1. Show the first and last names of customers who have at least one order
SELECT "first_name", "last_name"
FROM "customers"
WHERE "id" IN (
    SELECT "customer_id"
    FROM "orders"
)
ORDER BY "first_name","last_name";

-- Task 2. Show the names of products that have been ordered at least once
SELECT "name"
FROM "products"
WHERE "id" IN (
    SELECT "product_id"
    FROM "order_items"
)
ORDER BY "name";

-- Task 3. Show the first and last names of customers who have a pending order
SELECT "first_name", "last_name"
FROM "customers"
WHERE "id" IN (
    SELECT "customer_id"
    FROM "orders"
    WHERE "status" = 'pending'
)
ORDER BY "first_name", "last_name";

-- Task 4. Show the names of products included in orders made by the customer with id = 2
SELECT "name"
FROM "products"
WHERE "id" IN (
    SELECT "product_id"
    FROM "order_items"
    WHERE "order_id" IN (
        SELECT "id"
        FROM "orders"S
        WHERE "customer_id" = 2
    )
)
ORDER BY "name";