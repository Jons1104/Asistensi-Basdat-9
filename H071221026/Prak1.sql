#1
CREATE DATABASE db_praktikum;

USE db_praktikum;

CREATE TABLE students(
	nama VARCHAR(50) NOT NULL,
	email VARCHAR(255) UNIQUE,
	gender CHAR(1),
	student_id INT(11) PRIMARY KEY
);

CREATE TABLE classes(
	class_name VARCHAR(50),
	class_id INT(11) PRIMARY KEY AUTO_INCREMENT
);

USE db_praktikum;
CREATE TABLE class_student(
	grade CHAR(1) DEFAULT 'E',
	enrollment_id INT(11) PRIMARY KEY AUTO_INCREMENT,
	student_id INT,
	
	FOREIGN KEY(student_id) REFERENCES students(student_id),
	
	class_id INT,
	FOREIGN KEY(class_id) REFERENCES classes(class_id)
);


SHOW TABLES;

DESCRIBE class_student;
DESCRIBE classes;
DESCRIBE students;

#2
CREATE DATABASE library;

USE library;
CREATE TABLE books(
	id INT PRIMARY KEY,
	isbn VARCHAR(50) UNIQUE,
	title VARCHAR(50) NOT NULL,
	pages INT,
	summary TEXT,
	genre VARCHAR(50) NOT NULL
)

SHOW TABLES;

ALTER TABLE books
MODIFY isbn CHAR(13);

ALTER TABLE books
DROP summary;

DESCRIBE books;
