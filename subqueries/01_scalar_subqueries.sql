-- Task 1. Show the names and prices of products whose prices are higher than the average price of all products
SELECT "name", "price"
FROM "products"
WHERE "price" > (
    SELECT AVG("price")
    FROM "products"
)
ORDER BY "price" DESC;

-- Task 2. Show first and last names of customers who have more orders than the average number of orders per customer
SELECT "first_name", "last_name"
FROM "customers"
JOIN "orders" ON "orders"."customer_id" = "customers"."id"
GROUP BY "customers"."id"
HAVING COUNT(*) > (
    SELECT AVG("order_count")
    FROM (
        SELECT COUNT(*) AS "order_count"
        FROM "orders"
        GROUP BY "customer_id"
    )
)
ORDER BY "first_name", "last_name";

-- Task 3. Show the names and stock values of products whose stock is equal to the minimum stock in the "products" table
SELECT "name", "stock"
FROM "products"
WHERE "stock" = (
    SELECT MIN("stock")
    FROM "products"
);

-- Task 4. Show the cities where the most customers live
SELECT "city"
FROM "customers"
GROUP BY "city"
HAVING COUNT(*) = (
    SELECT MAX("city_count")
    FROM (
        SELECT COUNT(*) AS "city_count"
        FROM "customers"
        GROUP BY "city"
    )
);
