-- 1.1) Внесення нових значень в таблицю Role в режимі одиничного доповнення
insert into `teacher` (`id`, `name`, `surname`, `email`) values (1, 'Fania', 'Kapelhof', 'fkapelhof0@newyorker.com');
select * from `teacher` where id = 1;

-- 1.2) Внесення нових значень в таблицю Role в режимі групового доповнення
insert into `Teacher` (`id`, `name`, `surname`, `email`) values
	(2, 'Merola', 'Sowrah', 'msowrah1@tamu.edu'),
    (3, 'Grover', 'Steptow', 'gsteptow2@intel.com'),
    (4, 'Cheri', 'McTerlagh', 'cmcterlagh3@chron.com'),
    (5, 'Wilbur', 'Gaspard', 'wgaspard4@gnu.org');

select * from `Teacher`;
SHOW VARIABLES LIKE "secure_file_priv";

-- 2) Заповнимо таблицю `Specialty` даними з файлу. Файл MOCK_DATA.csv знаходиться в корневій попці БД
load data infile 'MOCK_DATA.csv'
into table `Specialty`
character set utf8mb4
fields terminated by ','
lines terminated by '\n';

select * from `Specialty`;

-- 3)  Внесення змін в записи таблиці. Змінимо пошту викладача Wilbur Gaspard і збільшимо значення
-- ключового поля на одиницю. Для зміни значень ключа потрібно змінити порядок
-- сортування рядків, щоб уникнути суперечності.
update `Teacher`
set email = '11wilburgaspard@gmail.com'
where id = 5;

update `Teacher` set id = id + 1
	order by id desc;

-- 4) Запит для вилучення викладачів з таблиці Teacher
delete from `teacher`
	where id between 1 and 10;

select * from `Specialty`;