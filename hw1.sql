-- 1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными. 
CREATE DATABASE hw1;
USE hw1;
CREATE TABLE mobile
(
  Id INT AUTO_INCREMENT PRIMARY KEY,
  ProductName VARCHAR(45) NOT NULL,
  Manufacturer VARCHAR(45) NOT NULL,
  ProductCount INT NULL,
  Price INT NULL
);

INSERT INTO Mobile (ProductName, Manufacturer, ProductCount, Price)
VALUES
('Galaxy S23', 'Samsung', 3, 79999),
('Fold 4', 'Samsung', 2, 125000),
('Iphone 14', 'Apple', 5, 82000),
('Mate X3', 'Huawei', 2, 144999);

-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2 
SELECT ProductName, Manufacturer, Price
FROM mobile
WHERE ProductCount > 2; 

-- 3. Выведите весь ассортимент товаров марки “Samsung”
SELECT *
FROM mobile
WHERE Manufacturer = 'Samsung';

-- 4. Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000**
SELECT *
FROM mobile
WHERE ProductCount * Price > 100000 AND
	ProductCount * Price < 145000;

-- 4.1 Товары, в которых есть упоминание "Iphone"    
SELECT *
FROM mobile
WHERE ProductName LIKE '%Iphone%';

-- 4.2 Товары, в которых есть упоминание "Galaxy"
SELECT *
FROM mobile
WHERE ProductName LIKE '%Galaxy%';

-- 4.3 Товары, в которых есть ЦИФРЫ
SELECT *
FROM mobile
WHERE ProductName RLIKE '[:digit:]';

-- 4.4 Товары, в которых есть ЦИФРА "8"  
SELECT *
FROM mobile
WHERE ProductName RLIKE '8';