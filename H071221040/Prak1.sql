#1
CREATE DATABASE IF NOT EXISTS library;

USE library;

CREATE TABLE IF NOT EXISTS books(
	id INT AUTO_INCREMENT,
	isbn VARCHAR(50) UNIQUE,
	tittle VARCHAR(50) NOT NULL,
	pages INT,
	summary TEXT,
	genre VARCHAR(50) NOT NULL,
	PRIMARY KEY(`id`)
);

ALTER TABLE books
MODIFY isbn CHAR(13) UNIQUE;

ALTER TABLE books
DROP COLUMN summary;

DESCRIBE books;

#2
CREATE DATABASE IF NOT EXISTS db_praktikum;

USE db_praktikum;

DROP TABLE IF EXISTS students;

CREATE TABLE IF NOT EXISTS students (
	student_id INT AUTO_INCREMENT,
	`name` VARCHAR(50),
	email VARCHAR(255) UNIQUE,
	gender CHAR(1),
	PRIMARY KEY (`student_id`)
);

CREATE TABLE IF NOT EXISTS classes (
	class_id INT AUTO_INCREMENT,
	class_name VARCHAR(50),
	PRIMARY KEY (`class_id`)
);

CREATE TABLE IF NOT EXISTS class_student (
	enrollment_id INT AUTO_INCREMENT,
	grade CHAR(1) DEFAULT 'E',
	student_id INT,
	class_id INT,
	PRIMARY KEY (`enrollment_id`),
	FOREIGN KEY (`student_id`) REFERENCES students (`student_id`),
	FOREIGN KEY (`class_id`) REFERENCES classes (`class_id`)
);
