-- Task 1: Show the first and last names and number_of_orders for all customers
SELECT "first_name", "last_name", COUNT("orders"."id") AS "number_of_orders"
FROM "customers"
LEFT JOIN "orders" ON "orders"."customer_id" = "customers"."id"
GROUP BY "customers"."id"
ORDER BY "number_of_orders" DESC, "first_name", "last_name";

-- Task 2: Show the first and last names and total_spent for all customers
SELECT "first_name", "last_name",
COALESCE(ROUND(SUM("products"."price" * "order_items"."quantity"), 2), 0) AS "total_spent"
FROM "customers"
LEFT JOIN "orders" ON "orders"."customer_id" = "customers"."id"
LEFT JOIN "order_items" ON "order_items"."order_id" = "orders"."id"
LEFT JOIN "products" ON "products"."id" = "order_items"."product_id"
GROUP BY "customers"."id"
ORDER BY "total_spent" DESC, "first_name", "last_name";


-- Task 3: Show the first and last names, number_of_orders, and customer_type for all customers
SELECT "first_name", "last_name", COUNT("orders"."id") AS "number_of_orders",
CASE 
    WHEN COUNT("orders"."id") = 0 THEN 'inactive'
    WHEN COUNT("orders"."id") = 1 THEN 'occasional'
    WHEN COUNT("orders"."id") IN (2, 3) THEN 'regular'
    WHEN COUNT("orders"."id") >= 4 THEN 'loyal'
END AS "customer_type"
FROM "customers"
LEFT JOIN "orders" ON "orders"."customer_id" = "customers"."id"
GROUP BY "customers"."id"
ORDER BY "number_of_orders" DESC, "first_name", "last_name";

-- Task 4: Show the first and last names, delivered_orders, and pending_orders for all customers
SELECT "first_name", "last_name", 
    SUM(CASE WHEN "orders"."status" = 'delivered' THEN 1 ELSE 0 END) AS "delivered_orders", 
    SUM(CASE WHEN "orders"."status" = 'pending' THEN 1 ELSE 0 END) AS "pending_orders"
FROM "customers"
LEFT JOIN "orders" ON "orders"."customer_id" = "customers"."id"
GROUP BY "customers"."id"
ORDER BY "first_name", "last_name";

-- Task 5: Show the first and last names and last_order_date for all customers
SELECT "first_name", "last_name", 
COALESCE(MAX("orders"."order_date"), 'no orders yet') AS "last_order_date"
FROM "customers"
LEFT JOIN "orders" ON "orders"."customer_id" = "customers"."id"
GROUP BY "customers"."id"
ORDER  BY "first_name", "last_name";