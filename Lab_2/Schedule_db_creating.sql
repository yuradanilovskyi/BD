create database `Schedule`;
use `Schedule`;
CREATE TABLE `Student` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`surname` varchar(255) NOT NULL,
	`age` INT NOT NULL,
	`telephone` varchar(255),
	`email` varchar(255),
	`idGroup` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Group` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`idCurriculum` INT,
	`headman` INT,
	`yearEntry` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Specialty` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Department` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`idCampus` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Curriculum` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`year` INT NOT NULL,
	`semester` INT NOT NULL,
	`idSpecialty` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Block` (
	`id` INT NOT NULL,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Subject` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`credits` INT NOT NULL,
	`hours` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Teacher` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`surname` varchar(255) NOT NULL,
	`email` varchar(255),
	`department` INT,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Schedule` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`SubCurDepBlock` INT NOT NULL,
	`Day` varchar(255) NOT NULL,
	`cabinet` INT NOT NULL,
	`timeStart` DATETIME NOT NULL,
	`timeEnd` DATETIME NOT NULL,
	`numeratorDenominator` BOOLEAN NOT NULL,
	`teacher` INT NOT NULL,
	`OccupationType` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Campus` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Cabinet` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`idCampus` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `SubCurDepBlock` (
	`id` INT NOT NULL,
	`idSubject` INT NOT NULL,
	`idCurriculum` INT NOT NULL,
	`idBlock` INT NOT NULL,
	`idDepartment` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `GroupSchedule` (
	`groupID` INT NOT NULL,
	`scheduleID` INT NOT NULL,
	`semester` INT NOT NULL,
	PRIMARY KEY (`groupID`,`scheduleID`)
);

ALTER TABLE `Student` ADD CONSTRAINT `Student_Group` FOREIGN KEY (`idGroup`) REFERENCES `Group`(`id`);

ALTER TABLE `Group` ADD CONSTRAINT `Group_Curriculum` FOREIGN KEY (`idCurriculum`) REFERENCES `Curriculum`(`id`);

ALTER TABLE `Group` ADD CONSTRAINT `Group_Headman` FOREIGN KEY (`headman`) REFERENCES `Student`(`id`);

ALTER TABLE `Department` ADD CONSTRAINT `Department_Campus` FOREIGN KEY (`idCampus`) REFERENCES `Campus`(`id`);

ALTER TABLE `Curriculum` ADD CONSTRAINT `Curriculum_Specialty` FOREIGN KEY (`idSpecialty`) REFERENCES `Specialty`(`id`);

ALTER TABLE `Teacher` ADD CONSTRAINT `Teacher_Department` FOREIGN KEY (`department`) REFERENCES `Department`(`id`);

ALTER TABLE `Schedule` ADD CONSTRAINT `Schedule_SubCurDepBlock` FOREIGN KEY (`SubCurDepBlock`) REFERENCES `SubCurDepBlock`(`id`);

ALTER TABLE `Schedule` ADD CONSTRAINT `Schedule_Cabinet` FOREIGN KEY (`cabinet`) REFERENCES `Cabinet`(`id`);

ALTER TABLE `Schedule` ADD CONSTRAINT `Schedule_Teacher` FOREIGN KEY (`teacher`) REFERENCES `Teacher`(`id`);

ALTER TABLE `Cabinet` ADD CONSTRAINT `Cabinet_Campus` FOREIGN KEY (`idCampus`) REFERENCES `Campus`(`id`);

ALTER TABLE `SubCurDepBlock` ADD CONSTRAINT `SubCurDepBlock_Subject` FOREIGN KEY (`idSubject`) REFERENCES `Subject`(`id`);

ALTER TABLE `SubCurDepBlock` ADD CONSTRAINT `SubCurDepBlock_Curriculum` FOREIGN KEY (`idCurriculum`) REFERENCES `Curriculum`(`id`);

ALTER TABLE `SubCurDepBlock` ADD CONSTRAINT `SubCurDepBlock_Block` FOREIGN KEY (`idBlock`) REFERENCES `Block`(`id`);

ALTER TABLE `SubCurDepBlock` ADD CONSTRAINT `SubCurDepBlock_Department` FOREIGN KEY (`idDepartment`) REFERENCES `Department`(`id`);

ALTER TABLE `GroupSchedule` ADD CONSTRAINT `GroupSchedule_Group` FOREIGN KEY (`groupID`) REFERENCES `Group`(`id`);

ALTER TABLE `GroupSchedule` ADD CONSTRAINT `GroupSchedule_Schedule` FOREIGN KEY (`scheduleID`) REFERENCES `Schedule`(`id`);