use `Schedule`;

select * from `Student`;
select * from `Group`;

create view `StudentsView` as select distinct `id`, `name`, `surname`, `idGroup`
	from `Student`;

select * from `StudentsView`;

select * from `StudentsView`
	where idGroup = 1;

select 
	v.id as StudentID,
	v.name as StudentName,
	v.surname as StudentSurName,
    g.name as GroupName
    from `Group` as g, `StudentsView` as v
    where g.id = v.idGroup;
    
select
	v.id as StudentID,
	v.name as StudentName,
	v.surname as StudentSurName,
    g.name as GroupName
    from `Group` as g, `StudentsView` as v
    where g.id = v.idGroup and g.name > 207;

