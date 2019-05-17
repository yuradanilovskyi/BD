use `Schedule`;

insert into `Group` (`id`, `name`, `yearEntry`) values
	(1, '207', 2017),
    (2, '208', 2017),
    (3, '209', 2017),
    (4, '210', 2017);

create table `Student1`
	as select `id`, `name`, `surname`, `age`, `telephone`, `email`, `idGroup` from `student`
    where id < 3;

create table `Student2`
	as select `id`, `name`, `surname`, `age`, `telephone`, `email`, `idGroup` from `student`
    where id > 2;
    
select * from `Group`;
select * from `Student1`;
select * from `Student2`;

insert into `Student` (`id`, `name`, `surname`, `age`, `telephone`, `email`, `idGroup`) values
	(1, 'Ольга', 'Кулик', 18, '+380687829092', '22olya22@gmail.com', 1),
    (2, 'Марко', 'Голяк', 20, '+380689093991', 'marlo@gmail.com', 1),
    (3, 'Святослав', 'Шильков', 18, '+380968240912', 'svyat@gmail.com', 3),
    (4, 'Владислав', 'Шалавило', 20, '+3809611876630', '14vlados14@gmail.com', 2),
    (5, 'Юра', 'Даніловський', 19, '+380962990023', 'yura19@gmail.com', 1),
    (6, 'Северин', 'Цяпка', 19, '+380962281488', 'cyapik@gmail.com', 4);
    
select * from `Student`;

select * from `Student1`
	union select * from `Student2`;
    
select * from `Student1`
	where idGroup in (select idGroup from `student2`);

select * from `Student2`
	where idGroup not in (select idGroup from `student1`);
    
select * from `Student1`,`Student2`;

