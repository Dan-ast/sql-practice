-- Task 1: Show the first and last names of customers who have more than 1 order
SELECT "first_name", "last_name"
FROM "customers"
WHERE (
    SELECT COUNT(*)
    FROM "orders"
    WHERE "orders"."customer_id" = "customers"."id"
) > 1
ORDER BY "first_name", "last_name";

-- Task 2: Show the names of the products whose stock is lower than the average stock of all products in the same category
SELECT "name"
FROM "products"
WHERE "stock" < (
    SELECT AVG("stock")
    FROM "products" AS "p2"
    WHERE "p2"."category" = "products"."category"
)
ORDER BY "name";

-- Task 3: Show the names of the products whose prices are the highest in their category
SELECT "name"
FROM "products"
WHERE "price" = (
    SELECT MAX("price")
    FROM "products" AS "p2"
    WHERE "p2"."category" = "products"."category"
)
ORDER BY "name";

-- Task 4: Show the id and status of orders that contain more than 1 item
SELECT "id", "status"
FROM "orders"
WHERE (
    SELECT COUNT(*)
    FROM "order_items"
    WHERE "order_items"."order_id" = "orders"."id"
) > 1
ORDER BY "id";