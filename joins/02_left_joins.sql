-- Task 1: Show the first nad last names, order dates and statuses for all customers, even if they have no orders
SELECT "first_name", "last_name", "orders"."order_date", "orders"."status"
FROM "customers"
LEFT JOIN "orders" ON "orders"."customer_id" = "customers"."id"
ORDER BY "first_name", "last_name", "order_date";

-- Task 2: Show names, prices, and quantities for all products, even if they have never been ordered
SELECT "name", "price", "quantity" 
FROM "products"
LEFT JOIN "order_items" ON "order_items"."product_id" = "products"."id"
ORDER BY "name", "quantity";

-- Task 3: Show the order IDs, statuses, and quantities for all orders, even if some orders have no order items
SELECT "order_id", "status", "quantity"
FROM "orders"
LEFT JOIN "order_items" ON "order_items"."order_id" = "orders"."id"
ORDER BY "orders"."id";

-- Task 4: Show the first and last names, the number of orders for all customers, including customers with 0 orders
SELECT "first_name", "last_name", COUNT("orders"."id") as "amount of orders"
FROM "customers"
LEFT JOIN "orders" ON "orders"."customer_id" = "customers"."id"
GROUP BY "customers"."id", "first_name", "last_name"
ORDER BY "amount of orders" DESC, "first_name", "last_name";
