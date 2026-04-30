-- Task 1. Find customers whose first name starts with 'A'
SELECT "first_name"
FROM "customers"
WHERE "first_name" LIKE 'A%';

-- Task 2. Find products whose name contains 'o'
SELECT "name" 
FROM "products"
WHERE "name" LIKE '%o%';

-- Task 3. Show the 5 cheapest products
SELECT "name", "price"
FROM "products"
ORDER BY "price"
LIMIT 5;
