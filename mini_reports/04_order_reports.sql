-- Task 1: Show the order IDs, statuses, and number_of_rows for all orders
SELECT "orders"."id", "orders"."status", COUNT("order_items"."id") AS "number_of_rows"
FROM "orders"
LEFT JOIN "order_items" ON "order_items"."order_id" = "orders"."id"
GROUP BY "orders"."id"
ORDER BY "orders"."id";

-- Task 2: Show the order IDs and total_items for all orders
SELECT "orders"."id", 
COALESCE(SUM("order_items"."quantity"), 0) AS "total_items"
FROM "orders"
LEFT JOIN "order_items" ON "order_items"."order_id" = "orders"."id"
GROUP BY "orders"."id"
ORDER BY "orders"."id";

-- Task 3: Show the order IDs, statuses, and total_amount for all orders
SELECT "orders"."id", "orders"."status", COALESCE(ROUND(SUM("products"."price" * "order_items"."quantity"), 2), 0) AS "total_amount"
FROM "orders"
LEFT JOIN "order_items" ON "order_items"."order_id" = "orders"."id"
LEFT JOIN "products" ON "products"."id" = "order_items"."product_id"
GROUP BY "orders"."id"
ORDER BY "total_amount" DESC, "orders"."id";

-- Task 4: Show the order IDs, total_items, and order_size for all orders 
SELECT "orders"."id", COALESCE(SUM("order_items"."quantity"), 0) AS "total_items",
CASE 
    WHEN COALESCE(SUM("order_items"."quantity"), 0) = 0 THEN 'empty'
    WHEN COALESCE(SUM("order_items"."quantity"), 0) = 1 THEN 'small'
    WHEN COALESCE(SUM("order_items"."quantity"), 0) IN (2, 3, 4) THEN 'medium'
    WHEN COALESCE(SUM("order_items"."quantity"), 0) >= 5 THEN 'large'
END AS "order_size"
FROM "orders"
LEFT JOIN "order_items" ON "order_items"."order_id" = "orders"."id"
GROUP BY "orders"."id"
ORDER BY "orders"."id";

-- Task 5: Show the order IDs, statuses, number_of_products, and order_complexity for all orders
SELECT "orders"."id", "orders"."status", COUNT(DISTINCT "order_items"."product_id") AS "number_of_products",
CASE 
    WHEN COUNT(DISTINCT "order_items"."product_id") IN (0, 1) THEN 'simple'
    WHEN COUNT(DISTINCT "order_items"."product_id") IN (2, 3) THEN 'standard'
    WHEN COUNT(DISTINCT "order_items"."product_id") >= 4 THEN 'complex'
END AS "order_complexity"
FROM "orders"
LEFT JOIN "order_items" ON "order_items"."order_id" = "orders"."id"
GROUP BY "orders"."id"
ORDER BY "number_of_products" DESC, "orders"."id";