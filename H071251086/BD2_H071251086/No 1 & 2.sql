CREATE DATABASE praktikum_db;

CREATE TABLE prodi (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nama_prodi VARCHAR(100) NOT NULL
);

CREATE TABLE mahasiswa (
	nim VARCHAR(10) PRIMARY KEY,
	nama VARCHAR(100) NOT NULL,
	ipk NUMERIC(3, 2) DEFAULT 0.00,
	email VARCHAR(150) UNIQUE,
	id_prodi INT,
	CONSTRAINT fk_mahasiswa_prodi
		FOREIGN KEY (id_prodi)
		REFERENCES prodi(id)
);

INSERT INTO prodi (nama_prodi)
VALUES 
	('Aktuaria'),
	('Statistika'),
	('Sistem Informasi');

SELECT * FROM prodi;

INSERT INTO mahasiswa (nim, nama, email, id_prodi)
VALUES 
	('H071251007', 'Ayu Cihuy', 'ayucan@gmail.com', 7),
	('H021251008', 'Shafa Arab', NULL, 8),
	('H071251086', 'Kia Cihuy', 'kiac@gmail.com', 9);

SELECT * FROM mahasiswa;

SELECT * FROM prodi;

INSERT INTO prodi (nama_prodi)
VALUES 
	('Matematika'),
	('Fisika'),
	('Geofisika');

INSERT INTO mahasiswa (nim, nama, ipk, email, id_prodi)
VALUES
	('H071251077', 'Nitacan', 3.50, 'nita@gmail.com', 10),
	('H071251055', 'Caca', 3.55, 'caca@gmail.com', 11),
	('H071251034', 'Cici', 3.50, 'cici@gmail.com', 12);

UPDATE mahasiswa 
SET ipk = 3.75
WHERE ipk = 3.50;

