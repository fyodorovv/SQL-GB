CREATE DATABASE hw2;
USE hw2;

-- 1. Используя операторы языка SQL, создайте таблицу “sales”. Заполните ее данными.

CREATE TABLE sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    count_product INT NOT NULL
);

INSERT INTO sales(order_date, count_product)
VALUES
	(DATE '2023-01-01', 156),
	(DATE '2023-01-02', 180),
	(DATE '2023-01-03', 21),
	(DATE '2023-01-04', 124),
	(DATE '2023-01-05', 341);

-- Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.

SELECT id,
    CASE
		WHEN count_product < 100 THEN "меньше 100"
        WHEN count_product BETWEEN 100 AND 300 THEN "100-300"
        ELSE "больше 300"
    END AS "Тип заказа"
FROM sales;


-- 3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE


CREATE TABLE orders
(
	orderid INT PRIMARY KEY AUTO_INCREMENT,
    employeeid VARCHAR(20),
    amount FLOAT DEFAULT 0.0,
	orderstatus VARCHAR(20)
);

INSERT INTO orders (employeeid, amount, orderstatus)
VALUES
('s03', 15.00, "OPEN"),
('e01', 25.50, "OPEN"),
('e05', 100.70, "CLOSED"),
('e02', 22.18, "OPEN"),
('e04', 9.50, "CANCELLED");

SELECT orderid, orderstatus,
	CASE
		WHEN orderstatus = "OPEN" THEN "Order is in open state"
        WHEN orderstatus = "CLOSED" THEN "Order is closed"
        WHEN orderstatus = "CANCELLED" THEN "Order is cancelled"
        ELSE ""
    END AS ordersummary
FROM orders;



