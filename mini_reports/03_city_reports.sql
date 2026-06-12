-- Task 1: Show each cities and its number_of_customers
SELECT "city", COUNT("id") AS "number_of_customers"
FROM "customers"
GROUP BY "city"
ORDER BY "number_of_customers" DESC, "city";

-- Task 2: Show each cities and its number_of_orders
SELECT "city", COUNT("orders"."id") AS "number_of_orders"
FROM "customers"
LEFT JOIN "orders" ON "orders"."customer_id" = "customers"."id"
GROUP BY "city"
ORDER BY "number_of_orders" DESC, "city";

-- Task 3: Show each cities and its total_revenue
SELECT "city", 
COALESCE(ROUND(SUM("products"."price" * "order_items"."quantity"), 2), 0) AS "total_revenue"
FROM "customers"
LEFT JOIN "orders" ON "orders"."customer_id" = "customers"."id"
LEFT JOIN "order_items" ON "order_items"."order_id" = "orders"."id"
LEFT JOIN "products" ON "products"."id" = "order_items"."product_id"
GROUP BY "city"
ORDER BY "total_revenue" DESC, "city";

-- Task 4: Show the cities, number_of_orders, and city_activity
SELECT "city", COUNT("orders"."id") AS "number_of_orders", 
CASE 
    WHEN COUNT("orders"."id") = 0 THEN 'inactive city'
    WHEN COUNT("orders"."id") = 1 THEN 'low activity'
    WHEN COUNT("orders"."id") IN (2, 3) THEN 'medium activity'
    WHEN COUNT("orders"."id") >= 4 THEN 'high activity'
END AS "city_activity"
FROM "customers"
LEFT JOIN "orders" ON "orders"."customer_id" = "customers"."id"
GROUP BY "city"
ORDER BY "number_of_orders" DESC, "city";

-- Task 5: Show the cities and last_order_date for all cities
SELECT "city", 
COALESCE(MAX("orders"."order_date"), 'no orders yet') AS "last_order_date"
FROM "customers"
LEFT JOIN "orders" ON "orders"."customer_id" = "customers"."id"
GROUP BY "city"
ORDER BY "city";