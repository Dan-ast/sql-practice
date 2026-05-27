-- Task 1: Show the first and last names of customers, along with the order date and status for all orders
SELECT "first_name", "last_name", "orders"."order_date", "orders"."status"
FROM "customers"
INNER JOIN "orders" ON "orders"."customer_id" = "customers"."id"
ORDER BY "order_date", "last_name";

-- Task 2: Show the product names, prices, and quantities for all items in "order_items"
SELECT "name", "price", "order_items"."quantity"
FROM "products"
INNER JOIN "order_items" ON "order_items"."product_id" = "products"."id"
ORDER BY "name";

-- Task 3: Show the order IDs, product names and quantities for all order items
SELECT "order_id", "products"."name", "quantity"
FROM "order_items"
INNER JOIN "products" ON "products"."id" = "order_items"."product_id"
ORDER BY "order_id", "name";

-- Task 4: Show the first and last names of customers, along with the product names and quantities of the items they ordered 
SELECT "first_name", "last_name", "products"."name", "order_items"."quantity"
FROM "customers"
INNER JOIN "orders" ON "orders"."customer_id" = "customers"."id"
INNER JOIN "order_items" ON "order_items"."order_id" = "orders"."id"
INNER JOIN "products" ON "products"."id" = "order_items"."product_id"
ORDER BY "first_name", "last_name", "products"."name";