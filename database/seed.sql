INSERT INTO "customers" ("id", "first_name", "last_name", "city", "email") VALUES
(1, 'Anna', 'Schmidt', 'Berlin', 'anna.schmidt@example.com'),
(2, 'Lukas', 'Weber', 'Munich', 'lukas.weber@example.com'),
(3, 'Sofia', 'Meyer', 'Hamburg', 'sofia.meyer@example.com'),
(4, 'Daniel', 'Koch', 'Berlin', 'daniel.koch@example.com'),
(5, 'Emma', 'Wagner', 'Cologne', 'emma.wagner@example.com'),
(6, 'Noah', 'Becker', 'Frankfurt', 'noah.becker@example.com'),
(7, 'Mia', 'Hoffmann', 'Stuttgart', 'mia.hoffmann@example.com'),
(8, 'Leon', 'Schulz', 'Dresden', 'leon.schulz@example.com');

INSERT INTO "products" ("id", "name", "category", "price", "stock") VALUES
(1, 'Mechanical Keyboard', 'Electronics', 89.99, 15),
(2, 'Wireless Mouse', 'Electronics', 29.99, 40),
(3, '27-inch Monitor', 'Electronics', 219.50, 10),
(4, 'Notebook A5', 'Stationery', 6.50, 100),
(5, 'Gel Pen Set', 'Stationery', 12.90, 60),
(6, 'Desk Lamp', 'Home', 34.00, 25),
(7, 'Ceramic Mug', 'Home', 14.20, 50),
(8, 'Backpack', 'Accessories', 49.99, 20),
(9, 'USB-C Hub', 'Electronics', 39.95, 30),
(10, 'Water Bottle', 'Accessories', 18.75, 45);

INSERT INTO "orders" ("id", "customer_id", "order_date", "status") VALUES
(1, 1, '2026-04-01', 'delivered'),
(2, 2, '2026-04-02', 'shipped'),
(3, 1, '2026-04-03', 'pending'),
(4, 3, '2026-04-04', 'delivered'),
(5, 4, '2026-04-05', 'cancelled'),
(6, 5, '2026-04-06', 'delivered'),
(7, 6, '2026-04-06', 'shipped'),
(8, 7, '2026-04-07', 'pending'),
(9, 8, '2026-04-08', 'delivered'),
(10, 2, '2026-04-08', 'delivered');

INSERT INTO "order_items" ("id", "order_id", "product_id", "quantity") VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 2, 3, 1),
(4, 2, 9, 1),
(5, 3, 4, 3),
(6, 3, 5, 2),
(7, 4, 8, 1),
(8, 4, 10, 2),
(9, 5, 6, 1),
(10, 6, 7, 4),
(11, 6, 4, 5),
(12, 7, 1, 1),
(13, 7, 3, 1),
(14, 8, 2, 1),
(15, 8, 10, 1),
(16, 9, 5, 3),
(17, 9, 6, 1),
(18, 10, 9, 2),
(19, 10, 2, 1),
(20, 10, 4, 2);