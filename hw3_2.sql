use hw3;

create table employee (id int, e_name varchar(100), surname varchar(100),
specialty varchar(100), seniority int, salary int, age int);

insert employee (id, e_name, surname,specialty, seniority, salary, age) values 
(1, "Вася", "Васькин", "начальник", 40, 100000, 60),
(2, "Петя", "Петькин", "начальник", 8, 70000, 30),
(3, "Катя", "Каткина", "инженер", 2, 70000, 25),
(4, "Саша", "Сашкин", "инженер", 12, 50000, 35),
(5, "Иван", "Иванов", "рабочий", 40, 30000, 59),
(6, "Петр", "Петров", "рабочий", 20, 25000, 40),
(7, "Сидор", "Сидоров", "рабочий", 10, 20000, 35),
(8, "Антон", "Антонов", "рабочий", 8, 19000, 28),
(9, "Юра", "Юркин", "рабочий", 5, 15000, 25),
(10, "Максим", "Воронин", "рабочий", 2, 11000, 22),
(11, "Юра", "Галкин", "рабочий", 3, 12000, 24),
(12, "Люся", "Люськина", "уборщик", 10, 10000, 49);

-- Отсортируйте поле “зарплата” в порядке убывания и возрастания
select * from employee
order by salary;
select * from employee
order by salary desc;
-- Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой (возможен подзапрос)
select * from (select * from employee
order by salary desc
limit 5) t
order by t.salary;

-- Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000
select specialty, sum(salary) sum_salary from employee
group by specialty
having sum_salary > 100000;