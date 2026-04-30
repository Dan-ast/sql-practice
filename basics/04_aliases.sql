-- Task 1. Show product names with renamed price column
SELECT "name", "price" AS "product price"
FROM "products";

-- Task 2. Show customers' full names using aliaes
SELECt "first_name" AS "First Name", "last_name" AS "Last Name"
FROM "customers";

-- Task 3. Show the average stock of products
SELECT AVG("stock") AS "Average Stock"
FROM "products";
