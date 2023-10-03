CREATE DATABASE library;
USE library;

CREATE TABLE books(
		id INT PRIMARY KEY,
		isbn VARCHAR(50)UNIQUE,
		title VARCHAR(50) NOT NULL,
		pages INT,
		summary TEXT,
		genre VARCHAR(50)NOT NULL
);

SHOW TABLES;

DESCRIBE books;

ALTER TABLE books
MODIFY isbn CHAR(13);
DESCRIBE books;

ALTER TABLE books DROP summary;
DESCRIBE books;

CREATE DATABASE db_praktikum;
USE db_praktikum;

CREATE TABLE student(
		nama VARCHAR(50)NOT NULL,
		email VARCHAR(255)UNIQUE,
		gender CHAR(1),
		student_id INT(11)PRIMARY KEY 
);

CREATE TABLE classes(
		class_name VARCHAR(50),
		class_id INT(11)PRIMARY KEY 
);

CREATE TABLE class_student(
		grade CHAR(1),
		student_id INT(11)UNIQUE,
		class_id  INT(11) UNIQUE,
		enrollment_id INT(11)PRIMARY KEY, 

		FOREIGN KEY(enrollment_id)REFERENCES classes(class_id),
		FOREIGN KEY(enrollment_id)REFERENCES student(student_id)
);
