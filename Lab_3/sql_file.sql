use `Schedule`;
show tables;

describe Student;

-- 1) Видалення зв’язку між таблицями шляхом видалення обмеження для таблиці:
alter table Schedule.Student
	drop foreign key Student_Group,
    drop index Student_Group;

show index from Student;
show create table Student;

alter table `Student`
	add constraint `Student_Group`
		foreign key (`idGroup`) references `Group`(`id`);
        
-- 2) Видалення поля і зміна розмірності поля в таблиці Student
alter table `Student`
	drop column idGroup,
    modify column age int(22) NULL;

describe `Student`;

alter table `Student`
	add column idGroup INT NOT NULL,
    add constraint `Student_Group`
		foreign key (`idGroup`) references `Group`(`id`);

-- 3) Зробимо поле name в таблиці Cabinet необов’язковим, і змінимо його розмірність:
alter table `Cabinet`
	modify column name varchar(50) NULL;

describe `Cabinet`;

alter table `Cabinet`
	modify column name varchar(255) NOT NULL;
    
-- 4) Додамо обмеження унікальності для поля name таблиці Department
alter table `Department`
	add constraint unique `Department_UQ_Name` (`name`);

describe Department;

alter table `Department`
    drop index Department_UQ_Name;
    
-- 5) Змінимо обмеження цілістності curriculum так, щоб при видаленні спеціальності, видалявся і навчальний план для неї.
alter table `Curriculum`
	drop foreign key Curriculum_Specialty,
    drop index Curriculum_Specialty;

describe `Curriculum`;

alter table `Curriculum`
    add constraint `Curriculum_Specialty` foreign key (`idSpecialty`)
		references `Specialty`(`id`) on delete cascade;


describe `Curriculum`;