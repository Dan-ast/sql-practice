-- Task 1: Show the names, stock values, and a new column called stock_status for all products 
SELECT "name", "stock",
CASE 
    WHEN "stock" = 0 THEN 'out of stock'
    WHEN "stock" <= 10 THEN 'low stock'
    ELSE 'in stock'
END AS "stock_status"
FROM "products"
ORDER BY "name";

-- Task 2: Show the names, prices and a new column called price_category for all products
SELECT "name", "price", 
CASE 
    WHEN "price" < 20 THEN 'cheap'
    WHEN "price" >= 20 AND "price" < 100 THEN 'medium'
    WHEN "price" >= 100 THEN 'expensive'
END AS "price_category"
FROM "products"
ORDER BY "price", "name";

-- Task 3: Show the order IDs, statuses, and a new column called status_group for all orders
SELECT "id", "status", 
CASE 
    WHEN "status" IN ('pending', 'processing') THEN 'open'
    WHEN "status" = 'shipped' THEN 'in transit'
    WHEN "status" IN ('delivered', 'cancelled')  THEN 'closed'
    ELSE 'other'
END AS "status_group"
FROM "orders"
ORDER BY "id";

-- Task 4: Show the first and last names, emails, and a new column called email_status for all customers
SELECT "first_name", "last_name", "email", 
CASE 
    WHEN "email" LIKE '%example.com' THEN 'company-like'
    ELSE 'other domain'
END AS "email_status"
FROM "customers"
ORDER BY "first_name", "last_name";