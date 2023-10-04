# Izzata Clarissa Salsabila
# H071221065
# Praktikum 3

# NO1
CREATE DATABASE praktikum3;

CREATE TABLE mahasiswa (
	NIM VARCHAR(10) PRIMARY KEY ,
	Nama VARCHAR(50) NOT NULL ,
	Kelas CHAR(1) NOT NULL ,
	STATUS VARCHAR(50) NOT NULL ,
	Nilai INT(11)
)
DESCRIBE mahasiswa;

SELECT * FROM mahasiswa;
INSERT INTO mahasiswa 
VALUES 
		('H071241056', 'Kotlina', 'A', 'Hadir', 100),
		('H071241060', ' Pitonia', 'A', 'Alfa', 85),
		('H071241063', 'Javano', 'A', 'Hadir', 50),
		('H071241065', 'Ciplus Kuadra', 'B', 'Hadir', 65),
		('H071241066', 'Pihap E', 'B', 'Hadir', 85),
		('H071241079', 'Ruby', 'B', 'Alfa', 90);

# No2
UPDATE mahasiswa
SET Nilai = 0, Kelas = 'C'
WHERE STATUS = 'Alfa';

# No3
DELETE FROM mahasiswa
WHERE Kelas = 'A' AND Nilai > 90;

# No4
INSERT INTO mahasiswa 
VALUES ('H071221065', 'Izzata Clarissa Salsabila', 'B', 'Pindahan');

UPDATE mahasiswa
SET Nilai = 50
WHERE STATUS = 'Alfa';

UPDATE mahasiswa
SET Kelas = 'A'

# Tugas Tambahan

SELECT * FROM payments
ORDER BY amount

DELETE FROM payments 
WHERE amount <= 10000
