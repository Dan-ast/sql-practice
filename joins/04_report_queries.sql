-- Task 1: Show the order IDs, the first and last names of customers, and statuses for all orders
SELECT "orders"."id", "first_name", "last_name", "status"
FROM "customers"
JOIN "orders" ON "orders"."customer_id" = "customers"."id"
ORDER BY "orders"."id";

-- Task 2: Show the order IDs and the number of item rows in all orders
SELECT "orders"."id", COUNT("order_items"."id") AS "number_of_rows"
FROM "orders"
JOIN "order_items" ON "order_items"."order_id" = "orders"."id"
GROUP BY "orders"."id"
ORDER BY "orders"."id";

-- Task 3: Show the order IDs and the total number of items in all orders
SELECT "orders"."id", SUM("quantity") AS "number_of_items"
FROM "orders"
JOIN "order_items" ON "order_items"."order_id" = "orders"."id"
GROUP BY "orders"."id"
ORDER BY "orders"."id";

-- Task 4: Show the order IDs and the total cost of each order
SELECT "orders"."id", ROUND(SUM("order_items"."quantity" * "products"."price"), 2) AS "total_sum"
FROM "orders"
JOIN "order_items" ON "order_items"."order_id" = "orders"."id"
JOIN "products" ON "products"."id" = "order_items"."product_id"
GROUP BY "orders"."id"
ORDER BY "orders"."id";

-- Task 5: Show the first and last names of customers, along with the number of orders for each customer
SELECT "first_name", "last_name", COUNT("orders"."id") AS "number_of_orders"
FROM "customers"
JOIN "orders" ON "orders"."customer_id" = "customers"."id"
GROUP BY "customers"."id", "first_name", "last_name"
ORDER BY "number_of_orders" DESC, "first_name", "last_name";

-- Task 6: Show the first and last names of customers and the total cost of all their orders
SELECT "first_name", "last_name", ROUND(SUM("order_items"."quantity" * "products"."price"), 2) AS "total_spent"
FROM "customers"
JOIN "orders" ON "orders"."customer_id" = "customers"."id"
JOIN "order_items" ON "order_items"."order_id" = "orders"."id"
JOIN "products" ON "products"."id" = "order_items"."product_id"
GROUP BY "customers"."id"
ORDER BY "total_spent" DESC, "first_name", "last_name";