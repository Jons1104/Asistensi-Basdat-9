CREATE DATABASE praktikum3;
USE praktikum3;

#1
CREATE TABLE mahasiswa(
	NIM VARCHAR(10) PRIMARY KEY,
	Nama VARCHAR(50) NOT NULL,
	Kelas CHAR(1) NOT NULL,
	stattus VARCHAR(50) NOT NULL,
	Nilai INT(11)
);

DESCRIBE mahasiswa;

INSERT INTO mahasiswa(NIM, Nama, Kelas, stattus, Nilai)
VALUES('H071241056', 'Kotlina', 'A', 'Hadir', 100), ('H071241060', 'Pitonia', 'A', 'Alfa', 85) ;
INSERT INTO mahasiswa
VALUES('H071241063', 'Javano', 'A', 'Hadir', 50), ('H071241065', 'Ciplus Kuadra', 'B', 'Hadir', 65), ('H071241066', 'Pihap E', 'B', 'Hadir', 85), ('H071241079', 'Ruby', 'B', 'Alfa', 90);

SELECT * FROM mahasiswa;

#2
UPDATE mahasiswa
SET Kelas='C', Nilai=0
WHERE stattus='Alfa';

#3
DELETE FROM mahasiswa
WHERE Nilai>=90 AND Kelas='A';

#4
INSERT INTO mahasiswa(NIM, Nama, Kelas, stattus, Nilai)
VALUES('H071221026', 'Fudhayl', 'C', 'Pindahan', NULL);

UPDATE mahasiswa
SET Nilai=50
WHERE stattus='Alfa';

UPDATE mahasiswa
SET Kelas='A';

#5
DELETE FROM payments
WHERE amount<10000;
