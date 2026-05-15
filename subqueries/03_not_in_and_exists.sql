-- Task 1. Show the first and last names of customers who have not placed any orders
SELECT "first_name", "last_name"
FROM "customers"
WHERE "id" NOT IN (
    SELECT "customer_id"
    FROM "orders"
)
ORDER BY "first_name", "last_name";

-- Task 2. Show the names of products that have never been ordered
SELECT "name"
FROM "products"
WHERE "id" NOT IN (
    SELECT "product_id"
    FROM "order_items"
)
ORDER BY "name";

-- Task 3. Show the first and last names of customers who do not have any delivered orders
SELECT "first_name", "last_name"
FROM "customers"
WHERE "id" NOT IN (
    SELECT "customer_id"
    FROM "orders"
    WHERE "status" = 'delivered'
)
ORDER BY "first_name", "last_name";

-- Task 4. Show the names of products that appear in at least one delivered order
SELECT "name"
FROM "products"
WHERE EXISTS (
    SELECT 1
    FROM "order_items"
    JOIN "orders" ON "order_items"."order_id" = "orders"."id"
    WHERE  "order_items"."product_id" = "products"."id" AND "orders"."status" = 'delivered'
)
ORDER BY "name";