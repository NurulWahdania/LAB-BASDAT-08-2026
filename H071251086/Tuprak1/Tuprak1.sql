CREATE TABLE poliklinik (
	id_poli SERIAL PRIMARY KEY,
	nama_poli VARCHAR(50) UNIQUE NOT NULL,
	gedung VARCHAR(50) NOT NULL
);

CREATE TABLE pasien (
	id_pasien SERIAL PRIMARY KEY,
	nik VARCHAR(16) NOT NULL UNIQUE,
	nama_pasien VARCHAR(150) NOT NULL,
	jenis_kelamin CHAR CHECK (jenis_kelamin IN ('L', 'P'))
);

CREATE TABLE dokter (
	id_dokter SERIAL PRIMARY KEY,
	nama_dokter VARCHAR(150) NOT NULL,
	no_izin_praktek VARCHAR(30) UNIQUE,
	pengalaman_tahun INT DEFAULT 0 CHECK (pengalaman_tahun >= 0),
	id_poli INT,
	CONSTRAINT fk_doktor_poliklinik
		FOREIGN KEY(id_poli)
		REFERENCES poliklinik(id_poli)
);

CREATE TABLE rekam_medis (
	id_rm SERIAL PRIMARY KEY,
	keluhan TEXT,
	biaya_pemeriksaan NUMERIC DEFAULT 150000,
	id_pasien INT,
	
	CONSTRAINT fk_rm_pasien
		FOREIGN KEY(id_pasien)
		REFERENCES pasien(id_pasien),
		
	id_dokter INT,
	
	CONSTRAINT fk_rm_dokter
		FOREIGN KEY(id_dokter)
		REFERENCES dokter(id_dokter)
);

CREATE TABLE resep_obat (
	id_resep SERIAL PRIMARY KEY,
	nama_obat VARCHAR(100) NOT NULL,
	jumlah INT CHECK (jumlah > 0),
	id_rm INT,
	CONSTRAINT fk_ro_rm
		FOREIGN KEY(id_rm)
		REFERENCES rekam_medis(id_rm)
);

ALTER TABLE pasien
ADD COLUMN gol_darah VARCHAR(2);

ALTER TABLE resep_obat
ALTER COLUMN nama_obat TYPE TEXT;

ALTER TABLE poliklinik
DROP COLUMN gedung;

DROP TABLE resep_obat;
DROP TABLE rekam_medis;




