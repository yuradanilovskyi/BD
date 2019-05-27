describe `student`;

select * from `student`;
insert into `group` (id, `name`, yearEntry) values (5, "загальна", 2019);
select * from `group`;
DELIMITER $$
create trigger zagal_group 
before insert on student
for each row set new.idGroup = 5;
end $$ 
 DELIMITER ;

alter table student modify idGroup int(11) null;
insert into student (id, `name`, surname, age) value (24, "Ivan", "Kvitka",17);
select * from `student`;
