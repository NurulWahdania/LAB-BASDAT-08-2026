--Soal 1
SELECT 
	productCode, 
	productName, 
	msrp, 
	quantityInStock,
CASE
	WHEN msrp < 50 AND quantityInStock  > 500 THEN 'Ekonomis - Stok Tinggi'
	WHEN msrp < 50 AND quantityInStock <= 500 THEN 'Ekonomis - Stok Rendah'
	WHEN msrp BETWEEN 50 AND 100 THEN 'Harga Menengah'
	WHEN msrp > 100 THEN 'Harga Premium'
END kategori
FROM products
ORDER BY msrp DESC;

--Soal 2
SELECT
	p.productcode,
	SUM(od.quantityordered) AS total_unit_terjual,
	COUNT(DISTINCT od.ordernumber) AS jumlah_pemesanan
FROM products p
JOIN orderdetails od ON od.productcode = p.productcode
GROUP BY p.productcode
HAVING  SUM(od.quantityordered) > (
			SELECT AVG(od.quantityordered)
			FROM orderdetails od
		)
		AND COUNT(DISTINCT od.ordernumber) > 10
ORDER BY total_unit_terjual DESC;

--Soal 3
SELECT 
	productcode AS kode_produk,
	productname AS nama_produk, 
	quantityinstock  AS jumlah_stok,
	msrp 
FROM products
	WHERE quantityinstock > (
		SELECT AVG (quantityinstock)
		FROM products
	) AND msrp > (
		SELECT AVG (msrp)
		FROM products
	)
ORDER BY jumlah_stok DESC ;

--Soal 4
BEGIN;

UPDATE orders
SET status = 'Pengiriman'
WHERE ordernumber = 10100;

SAVEPOINT status_pengiriman;

UPDATE orders
SET status = 'Batal'
WHERE ordernumber = 10100;

ROLLBACK TO status_pengiriman;

COMMIT;

--Soal 5
CREATE TABLE anggota (
	id SERIAL PRIMARY KEY,
	nama_anggota VARCHAR(50) NOT NULL,
	kota_domisili VARCHAR(20) NOT NULL
	
);

CREATE TABLE buku (
	id SERIAL PRIMARY KEY,
	judul_buku VARCHAR(100) NOT NULL,
	gendre VARCHAR(20) NOT NULL,
	stok INTEGER DEFAULT 1
);

CREATE TABLE piminjaman (
	id SERIAL PRIMARY KEY,
	id_anggota INTEGER REFERENCES anggota(id),
	id_buku INTEGER REFERENCES buku(id),
	tanggal_pinjam DATE NOT NULL,
	tanggal_kembali DATE,
	denda INTEGER DEFAULT 0
);

CREATE INDEX idx_buku_genre ON buku(gendre);
CREATE INDEX idx_anggota_kota_domisili ON anggota(kota_domisili);


SELECT * FROM anggota;
SELECT * FROM buku;
SELECT * FROM peminjaman;





