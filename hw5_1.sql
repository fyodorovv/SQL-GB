use hw_5;

create table if not exists Cars(
	Id int not null,
	Name VARCHAR(20) not null,
	Cost int not null
);

insert into Cars (Id, Name, Cost) values
(1, 'Audi', 52642),
(2, 'Mercedes', 57127),
(3, 'Skoda', 9000),
(4, 'Volvo', 29000),
(5, 'Bentley', 350000),
(6, 'Citroen', 21000),
(7, 'Hummer', 41400),
(8, 'Volkswagen', 21600);

-- Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов
create view CheapCars as select Name from Cars where Cost<25000;
-- Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
alter view CheapCars as select Name from Cars where Cost<30000;
select * from CheapCars;
-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично)
create view NewCars as select * from Cars where Name in ('Skoda', 'Audi');
select * from NewCars;

