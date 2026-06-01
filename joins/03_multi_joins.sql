-- Task 1: Show the first and last names of customers, along with order IDs, dates, and statuses for all orders
SELECT "first_name", "last_name", "orders"."id", "order_date", "status"
FROM "customers"
JOIN "orders" ON "orders"."customer_id" = "customers"."id"
ORDER BY "order_date", "first_name", "last_name";

-- Task 2: Show order IDs, product names, prices, and quantities for all items in orders
SELECT "orders"."id", "products"."name", "products"."price", "order_items"."quantity"
FROM "orders"
JOIN "order_items" ON "order_items"."order_id" = "orders"."id"
JOIN "products" ON "products"."id" = "order_items"."product_id"
ORDER BY "orders"."id", "products"."name";

-- Task 3: Show the first and last names of customers, along with product names, quantities, and order dates for all ordered items
SELECT "first_name", "last_name", "products"."name", "order_items"."quantity", "order_date"
FROM "customers"
JOIN "orders" ON "orders"."customer_id" = "customers"."id"
JOIN "order_items" ON "order_items"."order_id" = "orders"."id"
JOIN "products" ON "products"."id" = "order_items"."product_id"
ORDER BY "order_date", "first_name", "products"."name";

-- Task 4: Show the first and last names of customers, along with statuses, product names, quantities, and prices for all items in orders 
SELECT "first_name", "last_name", "status", "products"."name", "order_items"."quantity", "products"."price"
FROM "customers"
JOIN "orders" ON "orders"."customer_id" = "customers"."id"
JOIN "order_items" ON "order_items"."order_id" = "orders"."id"
JOIN "products" ON "products"."id" = "order_items"."product_id"
ORDER BY "first_name", "last_name", "status", "products"."name";
