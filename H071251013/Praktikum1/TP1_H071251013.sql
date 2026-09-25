CREATE TABLE poloklinik(
	id_poli SERIAL PRIMARY KEY,
	nama_poli VARCHAR(50) NOT NULL UNIQUE,
	gedung VARCHAR(50) NOT NULL
);

CREATE TABLE pasien(
	id_pasien SERIAL PRIMARY KEY,
	nik VARCHAR(16) NOT NULL UNIQUE,
	nama_pasien VARCHAR(150) NOT NULL,
	jenis_kelamin CHAR(1) NOT NULL
		CHECK (jenis_kelamin IN ('L','P'))
);

CREATE TABLE dokter(
  id_dokter SERIAL PRIMARY KEY,
    nama_dokter VARCHAR(150) NOT NULL,
    no_izin_praktek VARCHAR(30) NOT NULL UNIQUE,
    pengalaman_tahun INTEGER DEFAULT 0
        CHECK (pengalaman_tahun >= 0),
    id_poli INTEGER NOT NULL,

    CONSTRAINT fk_dokter_poliklinik
        FOREIGN KEY (id_poli)
        REFERENCES poloklinik(id_poli)
);

CREATE TABLE rekam_medis (
    id_rm SERIAL PRIMARY KEY,
    keluhan TEXT NOT NULL,
    biaya_pemeriksaan NUMERIC DEFAULT 150000,
    id_pasien INTEGER NOT NULL,
    id_dokter INTEGER NOT NULL,

    CONSTRAINT fk_rekam_medis_pasien
        FOREIGN KEY (id_pasien)
        REFERENCES pasien(id_pasien),

    CONSTRAINT fk_rekam_medis_dokter
        FOREIGN KEY (id_dokter)
        REFERENCES dokter(id_dokter)
);

CREATE TABLE resep_obat (
    id_resep SERIAL PRIMARY KEY,
    nama_obat VARCHAR(100) NOT NULL,
    jumlah INTEGER NOT NULL CHECK (jumlah > 0),
    id_rm INTEGER NOT NULL,

    CONSTRAINT fk_resep_rekam_medis
        FOREIGN KEY (id_rm)
        REFERENCES rekam_medis(id_rm)
);

ALTER TABLE pasien
ADD COLUMN golongan_darah CHAR (2);

ALTER TABLE resep_obat
ALTER COLUMN nama_obat TYPE VARCHAR;

ALTER TABLE poloklinik
DROP COLUMN  gedung;

DROP TABLE rekam_medis;
DROP TABLE resep_obat;