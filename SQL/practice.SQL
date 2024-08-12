-- Create your own store! Your store should sell one type of things, like clothing or bikes, whatever you want your store to specialize in. 
-- You should have a table for all the items in your store, and at least 5 columns for the kind of data you think you'd need to store.
--  You should sell at least 15 items, and use select statements to order your items by price and show at least one statistic about the items.

CREATE TABLE store (id INTEGER PRIMARY KEY,material TEXT, stock INTEGER, color TEXT, price INTEGER);

INSERT INTO store VALUES (1, "cotton", 10, "blue", 20.00);
INSERT INTO store VALUES (2, "linen", 6, "green", 15.00);
INSERT INTO store VALUES (3, "silk", 21, "red", 50.00);
INSERT INTO store VALUES (4, "cotton", 3, "purple", 12.00);
INSERT INTO store VALUES (5, "silk", 7, "blue", 55.00);
INSERT INTO store VALUES (6, "linen", 26, "yellow", 18.00);
INSERT INTO store VALUES (7, "cotton", 9, "red", 22.00);
INSERT INTO store VALUES (8, "silk", 3, "green", 52.00);
INSERT INTO store VALUES (9, "linen", 46, "pink", 25.00);
INSERT INTO store VALUES (10, "cotton", 2, "pink", 10.00);
INSERT INTO store VALUES (11, "silk", 8, "white", 60.00);
INSERT INTO store VALUES (12, "linen", 6, "black", 16.00);
INSERT INTO store VALUES (13, "cotton", 9, "yellow", 11.00);
INSERT INTO store VALUES (14, "linen", 11, "blue", 28.00);
INSERT INTO store VALUES (15, "silk", 4, "purple", 62.00);


UPDATE store SET stock = 8 WHERE id = 13; 
-- sold one item
UPDATE store SET stock = 18 WHERE id = 3;
-- sold 3 items
UPDATE store SET stock = 40 WHERE id = 9;
-- sold 6 items
UPDATE store SET stock = 5 WHERE id = 5;
-- sold 2 items
UPDATE store SET stock = 1 WHERE id = 15;
-- sold 3 items

SELECT * FROM store ORDER BY price;

-- Total Value of Stock: Calculate the total monetary value of all items currently 
-- in stock by multiplying the stock of each item by its price and summing these amounts. 
-- This gives you a snapshot of the total inventory value.

SELECT SUM(stock * price) AS total_inventory_value
FROM store;