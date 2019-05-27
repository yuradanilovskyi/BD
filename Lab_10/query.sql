use `schedule`;

delimiter |
drop function if exists get_age |
create function get_age (f_min int, f_max int) returns int deterministic
begin
	return FLOOR( RAND() * (f_max - f_min) + f_min );
end;
|
delimiter ;

delimiter |
drop procedure if exists create_groups |
create procedure create_groups(in group_count int, in yearEntry int)
begin
	declare group_curr int unsigned default 0;
	
    start transaction;
    while group_curr < group_count do
		insert into `group`(`name`, `yearEntry`) values (concat('group', group_curr + 1), yearEntry);
        set group_curr = group_curr + 1;
	end while;
    commit;
end;
|
delimiter ;

call create_groups(10, 2017);

delimiter |
drop procedure if exists create_students |
create procedure create_students(in student_count int, in to_group int)
begin
	declare student_curr int unsigned default 0;
	
    start transaction;
    while student_curr < student_count do
		insert into `student`(`name`, `surname`, `age`, `idGroup`) 
			values (concat('name', student_curr + 1), concat('surname', student_curr + 1), get_age(17, 20), to_group);
        set student_curr = student_curr + 1;
	end while;
    commit;
end;
|
delimiter ;

call create_students(30, 1);

select * from `group`;
select * from `student`;

SET FOREIGN_KEY_CHECKS = 0; 
truncate table `group`;
truncate table `student`;
SET FOREIGN_KEY_CHECKS = 1; 
