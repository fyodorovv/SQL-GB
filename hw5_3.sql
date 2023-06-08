use hw_5;

create table Travel (
	train_id int,
    station varchar(20) not null,
    station_time time
);

insert into Travel (train_id, station, station_time) values
(110, 'San Francisco', '10:00:00'),
(120, 'San Jose', '13:30:00'),
(110, 'Palo Alto', '11:02:00'),
(120, 'Palo Alto', '12:49:00'),
(110, 'San Jose', '12:35:00'),
(120, 'San Francisco', '11:00:00'),
(110, 'Redwood City', '10:54:00');


-- Добавьте новый столбец под названием «время до следующей станции». Вычислите время в пути для пар смежных станций. 
select *, 
timediff(lead(station_time) over (partition by train_id order by station_time), station_time) 'time_to_next_station' 
from Travel;