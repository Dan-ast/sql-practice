-- Task 1: Show the first and last names and emails of customers whose email is NULL
SELECT "first_name", "last_name", "email"
FROM "customers"
WHERE "email" IS NULL
ORDER BY "first_name", "last_name";

-- Task 2: Show the names and categories of products whose category is NULL
SELECT "name", "category"
FROM "products"
WHERE "category" IS NULL
ORDER BY "name";

-- Task 3: Show the IDs and statuses of orders whose status is NULL
SELECT "id", "status"
FROM "orders"
WHERE "status" IS NULL
ORDER BY "id";

-- Task 4: Show the first and last names of customers who have no orders
SELECT "first_name", "last_name"
FROM "customers"
LEFT JOIN "orders" ON "orders"."customer_id" = "customers"."id"
WHERE "orders"."id" IS NULL
ORDER BY "first_name", "last_name";