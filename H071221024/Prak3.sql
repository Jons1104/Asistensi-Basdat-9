#1
CREATE DATABASE praktikum3;
USE praktikum3;
CREATE TABLE mahasiswa (
	NIM VARCHAR(10) PRIMARY KEY,
	Nama VARCHAR(50) NOT NULL,
	Kelas CHAR(1) NOT NULL,
	status VARCHAR(50) NOT NULL,
	Nilai INT(11)
)

INSERT INTO mahasiswa 
VALUES ("H071241056", "Kotlina", "A", "Hadir", 100),
		 ("H071241060", "Pitonia", "A", "Alfa", 85), 
		 ("H071241063", "Javano", "A", "Hadir", 50),
		 ("H071241065", "Ciplus Kuadra", "B", "Hadir", 65),
	  	 ("H071241066", "Pihap E", "B", "Hadir", 85),
		 ("H071241079", "Ruby", "B", "Alfa", 90);

#2
UPDATE mahasiswa
SET Nilai = 0, Kelas = "C" 
WHERE status = "Alfa";

#3
DELETE FROM mahasiswa
WHERE kelas = "A" AND Nilai > 90; 

#4
INSERT INTO mahasiswa (NIM, Nama, Kelas, STATUS)
VALUES ("H071221024", "Rasyad", "A", "");

UPDATE mahasiswa
SET Nilai = 50
WHERE STATUS = "Alfa"

UPDATE mahasiswa
SET kelas = "A"
  
#5
INSERT INTO offices
VALUES(10, "Makassar", "+628871293167", "Haji Kalla", "Tamalanrea", NULL, "Indonesia", "942701", "APAC");

UPDATE employees
SET officeCode = 10
WHERE officeCode = 4 AND jobTitle = 'Sale Manager (EMEA)';
