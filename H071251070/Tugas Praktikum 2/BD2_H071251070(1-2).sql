-- soal 1
INSERT  INTO mahasiswa(nim, nama, email, id_prodi)
VALUES
	('H071251070', 'Ayu', 'ayugmail.com', 1 ),
	('T928931', 'haza', 'haza@gmail.com', 2),
	('K24961', 'astro', NULL, 3)
RETURNING *;

-- soal 2
UPDATE mahasiswa
SET ipk = 3.75
WHERE ipk = 3.50
RETURNING *;








