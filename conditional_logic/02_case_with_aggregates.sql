-- Task 1: Show the first and last names, number of orders, and customer_activity for all customers
SELECT "first_name", "last_name", COUNT("orders"."id") AS "number_of_orders",
CASE 
    WHEN COUNT("orders"."id") = 0 THEN 'inactive'
    WHEN COUNT("orders"."id") = 1 THEN 'new'
    WHEN COUNT("orders"."id") >= 2 THEN 'active'
END AS "customer_activity"
FROM "customers"
LEFT JOIN "orders" ON "orders"."customer_id" = "customers"."id"
GROUP BY "customers"."id", "first_name", "last_name"
ORDER BY "number_of_orders" DESC, "first_name", "last_name";

-- Task 2: Show the order IDs, total_items, and order_size for all orders
SELECT "orders"."id", SUM("order_items"."quantity") AS "total_items",
CASE
    WHEN SUM("order_items"."quantity") = 1 THEN 'small'
    WHEN SUM("order_items"."quantity") IN (2, 3, 4) THEN 'medium'
    WHEN SUM("order_items"."quantity") >= 5 THEN 'large'
END AS "order_size"
FROM "orders"
JOIN "order_items" ON "order_items"."order_id" = "orders"."id"
GROUP BY "orders"."id"
ORDER BY "orders"."id";

-- Task 3: Show the product names, the number of times they have been ordered, and their product_popularity
SELECT "name", COUNT("order_items"."order_id") AS "times_ordered",
CASE 
    WHEN COUNT("order_items"."order_id") = 0 THEN 'not ordered'
    WHEN COUNT("order_items"."order_id") = 1 THEN 'rare'
    WHEN COUNT("order_items"."order_id") IN (2, 3) THEN 'popular'
    WHEN COUNT("order_items"."order_id") >= 4 THEN 'best seller'
END AS "product_popularity"
FROM "products"
LEFT JOIN "order_items" ON "order_items"."product_id" = "products"."id"
GROUP BY "products"."id"
ORDER BY "times_ordered" DESC, "name";

-- Task 4: Show the cities, the number of customers in each city, and a new column called city_size
SELECT "city", COUNT("customers"."id") AS "number_of_customers",
CASE 
    WHEN COUNT("customers"."id") = 1 THEN 'small city'
    WHEN COUNT("customers"."id") = 2 THEN 'medium city'
    WHEN COUNT("customers"."id") >= 3 THEN 'large city'
END AS "city_size"
FROM "customers"
GROUP BY "city"
ORDER BY "number_of_customers" DESC, "city";
