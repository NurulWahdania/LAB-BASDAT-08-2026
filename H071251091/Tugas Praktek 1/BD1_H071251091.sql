
--soal1--
CREATE TABLE poliklinik (
	id_poli SERIAL PRIMARY KEY,
	nama_poli VARCHAR(50) NOT NULL UNIQUE,
	gedung VARCHAR(50) NOT NULL
);

CREATE TABLE pasien (
	id_pasien SERIAL PRIMARY KEY,
	nik VARCHAR(16) NOT NULL UNIQUE,
	nama_pasien VARCHAR(150) NOT NULL,
	jenis_kelamin VARCHAR(1) CHECK (jenis_kelamin in ('L', 'P'))
);

CREATE TABLE doktor (
	id_dokter SERIAL PRIMARY KEY,
	nama_dokter VARCHAR(150) NOT NULL,
	no_izin_praktek VARCHAR(30) UNIQUE,
	pengalaman_tahun INTEGER DEFAULT 0 CHECK (pengalaman_tahun >= 0),
	id_poli INTEGER,
	CONSTRAINT fk_doktor_poliklinik
		FOREIGN KEY (id_poli)
		REFERENCES poliklinik (id_poli)
);

CREATE TABLE rekam_medis (
	id_rm SERIAL PRIMARY KEY,
	keluhan TEXT NOT NULL,
	biaya_pemeriksaan NUMERIC DEFAULT 150000,
	id_pasien INTEGER,
	
	CONSTRAINT fk_idmedis_pasien
	FOREIGN KEY (id_pasien)
	REFERENCES pasien(id_pasien),
	id_dokter INTEGER,
	
	CONSTRAINT fk_iddokter_doktor
		FOREIGN KEY (id_dokter)
		REFERENCES doktor(id_dokter)
);

CREATE TABLE resep_obat (
	id_resep SERIAL PRIMARY KEY,
	nama_obat VARCHAR(100) NOT NULL,
	jumlah INTEGER CHECK (jumlah > 0),
	id_rm INTEGER,
	
	CONSTRAINT fk_idrm_remammedis
		FOREIGN KEY (id_rm)
		REFERENCES rekam_medis(id_rm)
);

--soal2--
ALTER TABLE pasien
ADD COLUMN gol_darah VARCHAR(2);

ALTER TABLE resep_obat
ALTER COLUMN nama_obat TYPE TEXT;

ALTER TABLE poliklinik
DROP COLUMN gedung;

--soal3--
DROP TABLE resep_obat;
DROP TABLE rekam_medis;







