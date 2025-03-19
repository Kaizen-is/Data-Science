CREATE DATABASE OnlineShop;
CREATE SCHEMA Products;

CREATE TABLE Items (
	item_id int primary key,
    item_name varchar(100),
    category varchar(100),
    price int,
    stock int
);

INSERT INTO Items (item_id, item_name, category, price, stock)
VALUES
(1, 'Dishwasher', 'Kitchen', 499.99, 15),
(2, 'Blender', 'Kitchen', 89.99, 30),
(3, 'Microwave Oven', 'Kitchen', 149.99, 25),
(4, 'Air Purifier', 'Home', 120.50, 20),
(5, 'Vacuum Cleaner', 'Home', 199.99, 35),
(6, 'Refrigerator', 'Kitchen', 799.99, 10),
(7, 'Garden Hose', 'Garden', 29.99, 40),
(8, 'Lawn Mower', 'Garden', 199.99, 12),
(9, 'Outdoor Furniture Set', 'Garden', 350.00, 8),
(10, 'Coffee Maker', 'Kitchen', 59.99, 45),
(11, 'Garden Shovel', 'Garden', 15.49, 50),
(12, 'Cookware Set', 'Kitchen', 159.99, 20),
(13, 'Sofa', 'Home', 599.99, 18),
(14, 'Patio Umbrella', 'Garden', 99.99, 25),
(15, 'Wall Clock', 'Home', 29.99, 40);
