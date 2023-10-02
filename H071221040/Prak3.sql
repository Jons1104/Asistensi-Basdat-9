CREATE DATABASE praktikum3;
USE praktikum3;

## NO 1
CREATE TABLE mahasiswa (
	NIM VARCHAR(10) PRIMARY KEY,
	Nama VARCHAR(50) NOT NULL,
	Kelas CHAR(1) NOT NULL,
	`status` VARCHAR(50) NOT NULL,
	Nilai INT
);

DESCRIBE mahasiswa;
SHOW tables;

INSERT INTO mahasiswa
VALUE ('H071241056', 'Kotlina', 'A', 'Hadir', 100),
		('H071241060', 'Pitonia', 'A', 'Alfa', 85),
		('H071241063', 'Javano', 'A', 'Hadir', 50),
		('H071241065', 'Ciplus Kuadra', 'B', 'Hadir', 65),
		('H071241066', 'Pihap E', 'B', 'Hadir', 85),
		('H071241079', 'Ruby', 'B', 'Alfa', 90);
		
## NO 2
UPDATE mahasiswa 
SET Nilai = 0, Kelas = 'C'
WHERE `status` = 'Alfa';

## NO 3
DELETE FROM mahasiswa 
WHERE Kelas = 'A' AND Nilai >90;
	
## NO 4
INSERT INTO mahasiswa
VALUES ('H071221040', 'Nakits', 'A', 'Pindahan', NULL);

UPDATE mahasiswa 
SET Nilai = 50 
WHERE `status` = 'Alfa';

UPDATE mahasiswa 
SET Kelas = 'A';

## NO 5

USE classicmodels;


INSERT INTO employees
VALUES (1992, 'Munsi', 'Nakita', 'x100', 'nakitmunsi03@gmail.com', '5', 1143, 'Sales Rep'),
		(1982,'Widianti', 'Ayu','x100', 'ayucans@gmail.com', '5', 1143, 'Sales Rep' ),
		(1972, 'Clarissa', 'Izzata', 'x100', 'izzatacute@gmail.com', '5', 1972, 'Sales Rep');
		
