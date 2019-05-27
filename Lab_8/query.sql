use `schedule`;

-- 1.	Усі студенти посортовані за прізвищем
select `id`, `name`, `surname`
	from student
	order by `student`.`surname` asc;
 
-- 2.	Усі групи посортовані у зворотному порядку
select `id`, `name` from `group`
	order by `name` desc;
    
-- 3.	Виберемо розклад посортований за днями тижня
select 
`subject`.`name` as `subject`, 
`schedule`.`day`, 
`cabinet`.`name` as `cabinet`,
`schedule`.`timeStart`, 
`schedule`.`timeEnd`,
`teacher`.`surname` as `teacher`,
`group`.`name` as `group`
	from (`subject` inner join `subcurdepblock`) inner join (`schedule` inner join `group`)
    inner join `teacher` inner join `cabinet`
    on `subcurdepblock`.`idSubject` = `subject`.`id`
    and `schedule`.`groupID` = `group`.`id`
    and `schedule`.`SubCurDepBlock` = `subcurdepblock`.`id`
    and `schedule`.`teacher` = `teacher`.`id`
    and `schedule`.`cabinet` = `cabinet`.`id`
	where `group`.`name` = '207'
    order by `schedule`.`day`;

-- 4.	Усі предмети згруповані за полем name
select * from `subject`
	group by `name`
