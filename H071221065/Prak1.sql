-- NO 1
CREATE DATABASE library;

CREATE TABLE books(
	id_book INT PRIMARY KEY,
	isbn_book VARCHAR(50) UNIQUE,
	title_book VARCHAR(50) NOT NULL,
	pages INT,
	summary TEXT,
	genre_book VARCHAR(50) NOT NULL 
);

-- NO 2
ALTER TABLE books
MODIFY isbn_book VARCHAR(13);

-- NO 3
ALTER TABLE books DROP summary;

-- NO 4
DESCRIBE books;
SHOW TABLES;

-- NO 5
CREATE DATABASE db_praktikum;

CREATE TABLE students(
	student_id INT(11) PRIMARY KEY,
	name_student VARCHAR(50) NOT NULL,
	email_student VARCHAR(255)UNIQUE,
	gender CHAR(1)
);

CREATE TABLE classes(
	class_id INT PRIMARY KEY AUTO_INCREMENT,
	class_name VARCHAR(50)
);

CREATE TABLE class_student(
	enrollment_id INT(11) PRIMARY KEY AUTO_INCREMENT,
	grade CHAR(1) DEFAULT 'E',
	student_id INT(11),
	class_id INT(11),
	
	FOREIGN KEY (student_id) REFERENCES students(student_id),
