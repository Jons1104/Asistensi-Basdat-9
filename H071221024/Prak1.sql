#1
CREATE DATABASE library

USE library

CREATE TABLE books (
	id INT PRIMARY KEY,
	isbn VARCHAR(50) UNIQUE,
	title VARCHAR(50) NOT NULL,
	pages INT,
	summary TEXT,
	genre VARCHAR(50) NOT NULL
);

ALTER TABLE books
MODIFY isbn CHAR(13)

ALTER TABLE books DROP genre

DESCRIBE books

#2
CREATE DATABASE db_praktikum

USE db_praktikum

CREATE TABLE students (class_student
	student_id INT(11) PRIMARY KEY UNIQUE NOT NULL,
	name VARCHAR(255) UNIQUE NOT NULL,
	email VARCHAR(255) UNIQUE,
	gender CHAR(1)
);

CREATE TABLE classes (
	class_id INT(11) PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
	class_name VARCHAR(50)
);

CREATE TABLE class_student (
	enrollment_id INT(11) PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
	grade CHAR(1) DEFAULT "E",
	student_id INT,
	class_id INT,
	
	FOREIGN KEY(student_id) REFERENCES students(student_id),
	FOREIGN KEY(class_id) REFERENCES classes(class_id)
)
