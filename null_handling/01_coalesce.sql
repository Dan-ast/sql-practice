-- Task 1: Show the first and last names and emails for all customers. If an email is NULL, show 'no email'
SELECT "first_name", "last_name",
COALESCE("email", 'no email') AS "email_display"
FROM "customers"
ORDER BY "first_name", "last_name";

-- Task 2: Show the names of all products and display 'uncategorized' when the category is NULL
SELECT "name", 
COALESCE("category", 'uncategorized') AS "category_display"
FROM "products"
ORDER BY "name";

-- Task 3: Show the IDs of all orders and display 'unknown' when the status is NULL
SELECT "id",
COALESCE("status", 'unknown') AS "status_display"
FROM "orders"
ORDER BY "id";

-- Task 4: Show the first and last names of all customers and their order statues. When the order status is NULL, show 'no orders'
SELECT "first_name", "last_name", 
COALESCE("orders"."status", 'no orders') AS "order_status"
FROM "customers"
LEFT JOIN "orders" ON "orders"."customer_id" = "customers"."id"
ORDER BY "first_name", "last_name", "order_status";