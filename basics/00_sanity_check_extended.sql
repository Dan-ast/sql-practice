-- Check table counts
SELECT 'customers' AS table_name, COUNT(*) AS row_count
FROM customers;

SELECT 'products' AS table_name, COUNT(*) AS row_count
FROM products;

SELECT 'orders' AS table_name, COUNT(*) AS row_count
FROM orders;

SELECT 'order_items' AS table_name, COUNT(*) AS row_count
FROM order_items;

-- Check customers with no orders
SELECT "first_name", "last_name"
FROM "customers"
WHERE "id" NOT IN (
    SELECT "customer_id"
    FROM "orders"
)
ORDER BY "first_name", "last_name";

-- Check products with stock = 0
SELECT "name", "stock"
FROM "products"
WHERE "stock" = 0
ORDER BY "name";

-- Check orders with no items
SELECT "id", "status"
FROM "orders"
WHERE "id" NOT IN (
    SELECT "order_id"
    FROM "order_items"
)
ORDER BY "id";