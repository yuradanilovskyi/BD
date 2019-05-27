use `schedule`;

--  1.	Виведемо загальну кількість студентів
select count(`id`) as students
	from `student`;

-- 2.	Предмет, з найбільшою кількістю годин
select `name` as `subject`, max(`hours`) as `hours` from `subject`;

-- 3.	Загальна кількість годин навчання для групи 207
select sum(`hours`)
	from `schedule` inner join `subcurdepblock` inner join `subject`
    inner join `group`
    on `schedule`.`SubCurDepBlock` = `subcurdepblock`.`id`
    and `subcurdepblock`.`idSubject` = `subject`.`id`
    and `schedule`.`groupID` = `group`.`id`
    where `group`.`name` = 207;

-- 4.	Середня кількість годин навчання для групи 207
select avg(`hours`)
	from `schedule` inner join `subcurdepblock` inner join `subject`
    inner join `group`
    on `schedule`.`SubCurDepBlock` = `subcurdepblock`.`id`
    and `subcurdepblock`.`idSubject` = `subject`.`id`
    and `schedule`.`groupID` = `group`.`id`
    where `group`.`name` = 207;
