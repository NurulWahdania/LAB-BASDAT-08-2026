SET search_path TO "praktikum1", public;

-- no 1
INSERT INTO mahasiswa (nim, nama, email, id_prodi) 
VALUES 
	('H071251106', 'Nyoman Ayu Carmenita', 'ayucarmenita@gmail.com', 1),
	('H071251107', 'Choi Jiwoo', 'choij@gmail.com', 1),
	('H071251108', 'Yu Halal', NULL, 1)
RETURNING *;

-- no 2
INSERT INTO mahasiswa (nim, nama, ipk, email, id_prodi) 
VALUES 
	('H071251109', 'Yu Haram', 3.50, 'yuhalal@gmail.com', 1),
	('H071251110', 'Kim Dahyun', 3.50, 'kimstella@gmail.com', 1),
	('H071251111', 'Kim Jueun', 3.50, 'kimjuun@gmail.com', 1),
	('H071251112', 'Roh Yuna', 3.50, 'einaa@gmail.com', 1),
	('H071251113', 'Jeong Leean', 3.50, 'iansopian@gmail.com', 1),
	('H071251114', 'Kim Nayeon', 3.50, 'yeonaa@gmail.com', 1)
RETURNING *;

UPDATE mahasiswa
SET ipk = 3.75
WHERE ipk = 3.50;

DELETE FROM mahasiswa
WHERE email IS NULL
RETURNING *;



SELECT * FROM mahasiswa;

