CREATE TABLE prodi (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
	nama_prodi VARCHAR(100) NOT NULL
);


CREATE TABLE mahasiswa (
	nim VARCHAR(10) PRIMARY KEY,
	nama VARCHAR(100) NOT NULL,
	ipk NUMERIC(3,2) DEFAULT 0.00,
	email VARCHAR(150) UNIQUE,
	id_prodi INT,
	CONSTRAINT fk_mahasiswa_prodi
		FOREIGN KEY (id_prodi)
		REFERENCES prodi(id)
);



SELECT * FROM prodi;
SELECT * FROM mahasiswa;

INSERT INTO prodi (nama_prodi)
VALUES ('Sistem Informasi'),
	   ('Biologi'),
	   ('Ilmu Komunikasi'),
	   ('Matematika');
			

INSERT INTO mahasiswa (nim, nama ,email, id_prodi)
VALUES ('H071251091', 'Aidil', 'aidil@gmail.com', 1),
	   ('H071251090', 'Syarif', 'syrif@gmail.com', 1),
	   ('H071201025', 'Tifli', NULL, 1);

UPDATE mahasiswa 
SET ipk = 3.75
WHERE ipk = 0.00;

DELETE FROM mahasiswa 
WHERE email IS NULL;