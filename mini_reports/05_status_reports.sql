-- Task 1: Show the statuses and number_of_orders
SELECT "status", COUNT("id") AS "number_of_orders"
FROM "orders"
GROUP BY "status"
ORDER BY "number_of_orders" DESC, "status";

-- Task 2: Show the statuses and total_items
SELECT "status", COALESCE(SUM("order_items"."quantity"), 0) AS "total_items"
FROM "orders"
LEFT JOIN "order_items" ON "order_items"."order_id" = "orders"."id"
GROUP BY "status"
ORDER BY "total_items" DESC, "status";

-- Task 3: Show the statuses and total_revenue
SELECT "status", COALESCE(ROUND(SUM("products"."price" * "order_items"."quantity"), 2), 0) AS "total_revenue"
FROM "orders"
LEFT JOIN "order_items" ON "order_items"."order_id" = "orders"."id"
LEFT JOIN "products" ON "products"."id" = "order_items"."product_id"
GROUP BY "status"
ORDER BY "total_revenue" DESC, "status";

-- Task 4: Show the statuses, number_of_orders, and status_activity
SELECT "status", COUNT("orders"."id") AS "number_of_orders", 
CASE 
    WHEN COUNT("orders"."id") = 1 THEN 'low activity'
    WHEN COUNT("orders"."id") IN (2, 3, 4) THEN 'medium activity'
    WHEN COUNT("orders"."id") >= 5 THEN 'high activity'
END AS "status_activity"
FROM "orders"
GROUP BY "status"
ORDER BY "number_of_orders" DESC, "status";

-- Task 5: Show the statuses and last_order_date
SELECT "status", COALESCE(MAX("order_date"), 'no orders yet') AS "last_order_date"
FROM "orders"
GROUP BY "status"
ORDER BY "status";