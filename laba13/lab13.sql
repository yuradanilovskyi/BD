use schedule;

explain select 
`subject`.`name` as `subject`, 
`schedule`.`day`, 
`cabinet`.`name` as `cabinet`,
`schedule`.`timeStart`, 
`schedule`.`timeEnd`,
`teacher`.`surname` as `teacher`,
`group`.`name` as `group`
	from (`subject` inner join `subcurdepblock`) inner join `schedule`inner join groupschedule inner join `group`
    inner join `teacher` inner join `cabinet`
    on `subcurdepblock`.`idSubject` = `subject`.`id`
    and `schedule`.`SubCurDepBlock` = `subcurdepblock`.`id`
    and `schedule`.`teacher` = `teacher`.`id`
    and `schedule`.`cabinet` = `cabinet`.`id`
    and `schedule`.id = groupschedule.scheduleID
    and groupschedule.groupID = `group`.id
	where `group`.`name` = '207'
    order by `schedule`.`day`;

explain select straight_join `subject`.`name` as `subject`, 
`schedule`.`day`, 
`cabinet`.`name` as `cabinet`,
`schedule`.`timeStart`, 
`schedule`.`timeEnd`,
`teacher`.`surname` as `teacher`,
`group`.`name` as `group`
	from (`subject` inner join `subcurdepblock`) inner join `schedule`inner join groupschedule inner join `group`
    inner join `teacher` inner join `cabinet`
    on `subcurdepblock`.`idSubject` = `subject`.`id`
    and `schedule`.`SubCurDepBlock` = `subcurdepblock`.`id`
    and `schedule`.`teacher` = `teacher`.`id`
    and `schedule`.`cabinet` = `cabinet`.`id`
    and `schedule`.id = groupschedule.scheduleID
    and groupschedule.groupID = `group`.id
	where `group`.`name` = '207'
    order by `schedule`.`day`;
    
    analyze table `group`;
    create index teacher_lastname on teacher(id, surname);
    show index from teacher;