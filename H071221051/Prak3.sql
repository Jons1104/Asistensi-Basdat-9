#Mmembuat database 
CREATE DATABASE praktikum3;
USE praktikum3;

#Membuat Table
CREATE TABLE mahasiswa(
		NIM VARCHAR(10)PRIMARY KEY,
		Nama VARCHAR(50)NOT NULL,
		Kelas CHAR(1)NOT NULL,
		`Status` VARCHAR(50)NOT NULL,
		Nilai INT(11)NULL
);

DESC mahasiswa;

#Memasukkan Nilai pada data
INSERT INTO mahasiswa(NIM, Nama, Kelas, `Status`, Nilai)
VALUE ('H071241056', 'Kotlina', 'A', 'Hadir', 100);
SELECT* FROM mahasiswa

INSERT INTO mahasiswa(NIM, Nama, Kelas, `Status`, Nilai)
VALUE ('H071241060', 'Pitonia', 'A', 'Alfa', 85),
		('H071241063', 'Javano', 'A', 'Hadir', 50),
		('H071241065', 'Ciplus Kuadra', 'B', 'Hadir', 65),
		('H071241066', 'Pihap E', 'B', 'Hadir', 85),
		('H071241079', 'Ruby', 'B', 'Alfa', 90);
SELECT* FROM mahasiswa

#No2
UPDATE mahasiswa
SET Nilai = 0, Kelas = 'C'
WHERE `Status` = 'Alfa';
SELECT*FROM mahasiswa

#No3
DELETE FROM mahasiswa
WHERE kelas = 'A' AND Nilai >90;
SELECT * FROM mahasiswa

#No4
INSERT INTO mahasiswa(NIM, Nama, Kelas, `Status`, Nilai)
VALUE ('H071221051', 'Fadel cuy', 'D', 'Pindahan', NULL);
SELECT*FROM mahasiswa

UPDATE mahasiswa
SET Nilai = 50
WHERE `Status` = 'Alfa';
SELECT*FROM mahasiswa

UPDATE mahasiswa
SET kelas = 'A';
SELECT*FROM mahasiswa

#No5
