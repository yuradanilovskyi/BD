use `schedule`;

-- 1.	Виберемо усіх студентів з ім'ям Марко
select `surname`, `name` from `student`
	where `name` = 'Марко';

-- 2.	Виберемо усі групи та студентів у них, за допомогою left join
select `group`.`name`, `student`.`name`, `student`.`surname` 
	from `group` left join `student` on
    `student`.`idGroup` = `group`.`id`;
    
-- 3.	Зробимо те саме за допомогою inner join
select `group`.`name`, `student`.`name`, `student`.`surname` 
	from `group` inner join `student` on
    `student`.`idGroup` = `group`.`id`;
    
-- 4.	Дізнаємося які предмети викладають на кафедрах
select `department`.`name`, `subject`.`name`
	from (`department` inner join `subcurdepblock`) inner join `subject`
    on `department`.`id` = `subcurdepblock`.`idDepartment`
    and `subcurdepblock`.`idSubject` = `subject`.`id`;

-- 5.	Виведемо розклад для груп з назвою предметів
select `subject`.`name`, `schedule`.`day`, `schedule`.`timeStart`, `group`.`name` as `group`
	from (`subject` inner join `subcurdepblock`) inner join (`schedule` inner join `group`)
    on `subcurdepblock`.`idSubject` = `subject`.`id`
    and `schedule`.`groupID` = `group`.`id`
    and `schedule`.`SubCurDepBlock` = `subcurdepblock`.`id`;
    
-- 6.	Виведемо розклад для груп з назвою предметів за вівторок
select `subject`.`name`, `schedule`.`day`, `schedule`.`timeStart`, `group`.`name` as `group`
	from (`subject` inner join `subcurdepblock`) inner join (`schedule` inner join `group`)
    on `subcurdepblock`.`idSubject` = `subject`.`id`
    and `schedule`.`groupID` = `group`.`id`
    and `schedule`.`SubCurDepBlock` = `subcurdepblock`.`id`
    where `day` = 'Вівторок';
    
-- 7.	Виведемо всі дні, в які у викладача є пари і в якої групи
select t.`name`, t.`surname`, s.`day`, s.`timeStart`, g.`name` as `group`
	from (`teacher` as t inner join `schedule` as s) inner join `group` as g
    on t.`id` = s.teacher
	and s.groupID = g.id;