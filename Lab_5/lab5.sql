use `Schedule`;

insert into `Group` (`id`, `name`, `yearEntry`) values
	(1, '207', 2017),
    (2, '208', 2017),
    (3, '209', 2017),
    (4, '210', 2017);

insert into `Student` (`id`, `name`, `surname`, `age`, `telephone`, `email`, `idGroup`) values
	(1, 'Olha', 'Kulyk', 18, '+380687829092', '22olya22@gmail.com', 1),
    (2, 'Marko', 'Golak', 20, '+380689093991', 'marlo@gmail.com', 1),
    (3, 'Svaytoslav', 'Shilckov', 18, '+380968240912', 'svyat@gmail.com', 3),
    (4, 'Vladislav', 'Shalavilo', 20, '+3809611876630', '14vlados14@gmail.com', 2),
    (5, 'Yura', 'Danilovskyi', 19, '+380962990023', 'yura19@gmail.com', 1),
    (6, 'Severin', 'Capka', 19, '+380962281488', 'cyapik@gmail.com', 4);
    

insert into `Schedule` (`id`, `SubCurDepBlock`, `Day`, `cabinet`, `timeStart`, `timeEnd`, `numeratorDenominator`, `teacher`, `OccupationType`) values
	(1, 'Olha', 'Kulyk', 18, '+380687829092', '22olya22@gmail.com', 1),
    (2, 'Marko', 'Golak', 20, '+380689093991', 'marlo@gmail.com', 1),
    (3, 'Svaytoslav', 'Shilckov', 18, '+380968240912', 'svyat@gmail.com', 3),
    (4, 'Vladislav', 'Shalavilo', 20, '+3809611876630', '14vlados14@gmail.com', 2),
    (5, 'Yura', 'Danilovskyi', 19, '+380962990023', 'yura19@gmail.com', 1),
    (6, 'Severin', 'Capka', 19, '+380962281488', 'cyapik@gmail.com', 4);
    


create table `Student1`
	as select `id`, `name`, `surname`, `age`, `telephone`, `email`, `idGroup` from `Student`
    where id < 3;

create table `Student2`
	as select `id`, `name`, `surname`, `age`, `telephone`, `email`, `idGroup` from `Student`
    where id > 2;
    
select * from `Group`;
select * from `Student1`;
select * from `Student2`;


    
select * from `Student`;

select * from `Student1`
	union select * from `Student2`;
    
select * from `Student1`
	where idGroup in (select idGroup from `Student2`);

select * from `Student2`
	where idGroup not in (select idGroup from `Student1`);
    
select * from `Student1`,`Student2`;

