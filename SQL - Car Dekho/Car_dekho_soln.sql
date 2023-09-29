-- Car Dekho Challanges
-- 1
select * from cars;

-- 2
select count(*) as total_cars from cars;

-- 3
select count(*) as total_cars from cars
where year = 2023;

-- 4
select count(*) as total_cars, year from cars
where year in (2020,2021,2022)
group by year;

-- 5
select count(*) as total_cars, year from cars
group by year;

-- 6
select count(*) as total_cars, year, fuel from cars
where fuel = 'diesel'
group by year;

-- 7
select count(*) as total_cars, seats as seating_occupancy from cars
group by seating_occupancy;

-- 8
select * from cars
where transmission = 'automatic'
and owner = 'first owner'
and year = 2020;

-- 9
select fuel, year, count(*)  as total_cars
from cars
where fuel = 'petrol'
and year = 2020;

-- 10
select fuel, count(*) as total_cars
from cars
group by fuel;

-- 11
select year, count(*) as total_cars
from cars
group by year
having total_cars >= 100;

-- 12
select count(*) as total_cars from cars
where year between 2015 and 2023;
select * from cars
where year between 2015 and 2023;