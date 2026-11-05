CREATE TABLE kategori (
	id_kategori INT PRIMARY KEY,
	nama_kategori VARCHAR(30) NOT NULL
);

CREATE TABLE buku (
	id_buku INT PRIMARY KEY,
	judul VARCHAR(40) NOT NULL,
	id_kategori INT,
	FOREIGN KEY(id_kategori) REFERENCES kategori(id_kategori)
);

CREATE TABLE peminjaman (
	id_pinjam INT PRIMARY KEY,
	id_buku INT,
	FOREIGN KEY(id_buku) REFERENCES buku(id_buku)
);

--Soal 2 (Easy)

INSERT INTO kategori (nama_kategori, id_kategori) 
VALUES ('Sains & Teknologi', 10),
	   ('Sastra & Fiksi ', 20);

INSERT INTO buku (id_buku, judul, id_kategori)
VALUES (101, 'Pemrograman SQL', 10),
	   (102, 'Struktur Data', 10),
	   (103, 'Algoritma Pemrograman', 10),
	   (201, 'Novel Laskar Pelangi', 20),
	   (202, 'Bumi Manusia', 20);

INSERT INTO peminjaman (id_pinjam, id_buku)
VALUES   (5001, 101);

SELECT * FROM kategori;
SELECT * FROM buku;
SELECT * FROM peminjaman;

--Soal 3 (Easy)

SELECT id_buku, judul FROM buku
WHERE id_kategori = 10
ORDER BY judul DESC;

DROP TABLE kategori;
DROP TABLE buku;
DROP TABLE peminjaman;

--Soal 4 (Medium)

SELECT ct.city UPPER, 
	COUNT(c.customer_id)
	FROM city ct
	JOIN customer c ON ct.city_id = c.customer_id
	GROUP BY ct.city
	
