-- NO 1
CREATE DATABASE praktikum3;

CREATE TABLE mahasiswa(
    NIM VARCHAR(10) NOT NULL PRIMARY KEY,
    Nama VARCHAR(50) NOT NULL,
    Kelas CHAR(1) NOT NULL,
    Status VARCHAR(50) NOT NULL,
    Nilai INT
);
DESCRIBE 
INSERT INTO mahasiswa
VALUE ('H071241056','Kotina','A','Hadir',100),
	('H071241060','Pitonia', 'A','Alfa',85),
	('H071241063','Javano','A', 'Hadir',50),
	('H071241065','Ciplus kuadra','B','Hadir',65),
	('H071241066','Pihap E', 'B', 'Hadir', 85),
	('H071241067','Ruby', 'B','Alfa',90);
	
-- N0 2
UPDATE mahasiswa
SET Nilai = 0,Kelas = 'C'
WHERE STATUS = 'Alfa';

-- N0 3
DELETE FROM mahasiswa
WHERE Kelas = 'A' AND Nilai > 90;

-- N0 4 
INSERT INTO mahasiswa
	(NIM, Nama, Kelas, STATUS)
VALUE 
	('H071221050', 'Ayu widianti','B ','Pindahan');

UPDATE mahasiswa
SET Nilai = 50
WHERE STATUS = 'Alfa';

UPDATE mahasiswa
SET Kelas = 'A';

-- soal tambahan
INSERT INTO employees
VALUES 
	(1987, 'ayu', 'widianti', 'x892', 'ayu3@yahoo.com',6, 1102, 'Security'),
	(1989, 'izza', 'clarisa', 'x899', 'izza3@yahoo.com',20, 1102, 'Security'),
	(1982, 'fail', 'fudail', 'x891', 'fail3@yahoo.com',6, 1102, 'Security');



-- 
SELECT * FROM mahasiswa;
	

SHOW TABLES ;
DESC mahasiswa;

