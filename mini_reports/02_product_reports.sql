-- Task 1: Show the product names and times_ordered for all products
SELECT "name", COUNT("order_items"."id") AS "times_ordered"
FROM "products"
LEFT JOIN "order_items" ON "order_items"."product_id" = "products"."id"
GROUP BY "products"."id"
ORDER BY "times_ordered" DESC, "name";

-- Task 2: Show the product names and total_units_sold for all products
SELECT "name", 
COALESCE(SUM("quantity"), 0) AS "total_units_sold"
FROM "products"
LEFT JOIN "order_items" ON "order_items"."product_id" = "products"."id"
GROUP BY "products"."id"
ORDER BY "total_units_sold" DESC, "name";

-- Task 3: Show the names and total_revenue for all products
SELECT "name", 
COALESCE(ROUND(SUM("products"."price" * "order_items"."quantity"), 2), 0) AS "total_revenue"
FROM "products"
LEFT JOIN "order_items" ON "order_items"."product_id" = "products"."id"
GROUP BY "products"."id"
ORDER BY "total_revenue" DESC, "name";

-- Task 4: Show the product names, stock values, total_units_sold, amd inventory_status for all products
SELECT "name", "stock", COALESCE(SUM("quantity"), 0) AS "total_units_sold",
CASE 
    WHEN "stock" = 0 AND COALESCE(SUM("quantity"), 0) = 0 THEN 'dead stock'
    WHEN "stock" = 0 AND COALESCE(SUM("quantity"), 0) > 0 THEN 'sold out'
    WHEN "stock" > 0 AND COALESCE(SUM("quantity"), 0) = 0 THEN 'never ordered'
    ELSE 'active product'
END AS "inventory_status"
FROM "products"
LEFT JOIN "order_items" ON "order_items"."product_id" = "products"."id"
GROUP BY "products"."id"
ORDER BY "name";

-- Task 5: Show the product names, times_ordered, and sales_level for all products
SELECT "name", COALESCE(COUNT("order_items"."id"), 0) AS "times_ordered",
CASE 
    WHEN COUNT("order_items"."id") = 0 THEN 'not ordered'
    WHEN COUNT("order_items"."id") = 1 THEN 'low demand'
    WHEN COUNT("order_items"."id") IN (2, 3) THEN 'medium demand'
    WHEN COUNT("order_items"."id") >= 4 THEN 'high demand'
END AS "sales_level"
FROM "products"
LEFT JOIN "order_items" ON "order_items"."product_id" = "products"."id"
GROUP BY "products"."id"
ORDER BY "times_ordered" DESC, "name";