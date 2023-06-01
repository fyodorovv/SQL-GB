use hw3;

--Создаем таблицы

create table salepeople(
snum int NOT NULL,
sname varchar(30) NOT NULL,
city varchar(30) NOT NULL,
comm DECIMAL(5,2) NOT NULL, primary key (snum));

create table customers(
cnum int NOT NULL,
cname varchar(30) NOT NULL,
city varchar(30) NOT NULL,
rating int NOT NULL,
snum int NOT NULL, primary key (cnum), foreign key (snum) references salepeople(snum));

create table orders(
onum int NOT NULL,
amt DECIMAL(7,2) NOT NULL,
odate date NOT NULL,
cnum int NOT NULL,
snum int NOT NULL,primary key (onum), foreign key (cnum) references customers(cnum), foreign key (snum) references salepeople(snum));

insert into salepeople (snum, sname, city, comm) values
(1001, "Peel", "London", .12),
(1002, "Serres", "San Jose", .13),
(1004, "Motika", "London", .11),
(1007, "Rifkin", "Barcelona", .15),
(1003, "Axelrod", "New York", .10);

insert into customers (cnum, cname, city, rating, snum) values
(2001, "Hoffman", "London", 100, 1001),
(2002, "Giovanni", "Rome", 200, 1003),
(2003, "Liu", "SanJose", 200, 1002),
(2004, "Grass", "Berlin", 300, 1002),
(2006, "Clemens", "London", 100, 1001),
(2008, "Cisneros", "SanJose", 300, 1007),
(2007, "Pereira", "Rome", 100, 1004);

insert into orders (onum, amt, odate, cnum, snum) values
(3001, 18.69, '1990-03-10', 2008, 1007),
(3003, 767.19, '1990-03-10', 2001, 1001),
(3002, 1900.10, '1990-03-10', 2007, 1004),
(3005, 5160.45, '1990-03-10', 2003, 1002),
(3006, 1098.16, '1990-03-10', 2008, 1007),
(3009, 1713.23, '1990-04-10', 2002, 1003),
(3007, 75.75, '1990-04-10', 2004, 1002),
(3008, 4723.00, '1990-05-10', 2006, 1001),
(3010, 1309.95, '1990-06-10', 2004, 1002),
(3011, 9891.88, '1990-06-10', 2006, 1001);

-- 1.Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum, comm. (к первой или второй таблице, используя SELECT)
 SELECT city, sname, snum, comm FROM salepeople;
-- 2.Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)
 SELECT rating, cname FROM customers WHERE city = 'SanJose';
-- 3.Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без каких бы то ни было повторений. (уникальные значения в  “snum“ “Продавцы”)
SELECT DISTINCT snum FROM orders;
-- 4*.Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. Используется оператор "LIKE": (“заказчики”)
SELECT * FROM customers WHERE cname LIKE 'G%';
-- 5.Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000. (“Заказы”, “amt”  - сумма)
SELECT * FROM orders WHERE amt > 1000;
-- 6.Напишите запрос который выбрал бы наименьшую сумму заказа.(Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)
SELECT MIN(amt) FROM orders;
-- 7.Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, у которых рейтинг больше 100 и они находятся не в Риме.
SELECT * FROM customers WHERE rating > 100 AND city != 'Rome';