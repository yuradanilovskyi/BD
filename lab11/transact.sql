
set autocommit = 0;

-- Вдала транзакція
start transaction;
insert into department (`name`,idCampus) value ("prykladna lingvistyka", 5);
commit;

select * from department;

-- Невдала транзакція в використанням точки збереження
start transaction;
insert into department (`name`,idCampus) value ("pravo", 11);
update department set idCampus = 4 where id = 6;
savepoint s1;
insert into department (`name`,idCampus) value ("geodeziya", 9);
delete from department where id = 10;
rollback to savepoint s1;

select * from department;




