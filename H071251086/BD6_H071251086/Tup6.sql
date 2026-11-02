SET search_path TO classicmodels;

-- no 1
SELECT productcode, productname, MSRP, quantityinstock,
	CASE
		WHEN MSRP < 50 AND quantityinstock > 500 THEN 'Ekonomis - Stok Tinggi'
		WHEN MSRP < 50 AND quantityinstock <= 500 THEN 'Ekonomis - Stok Rendah'
		WHEN MSRP BETWEEN 50 AND 100 THEN 'Harga Menengah'
		WHEN MSRP > 100 THEN 'Harga Premium'
	END AS kategori_produk
FROM products
ORDER BY MSRP DESC;

-- no 2
SELECT 
	productcode as "Kode Produk",
	SUM(quantityordered) as "Total Unit Terjual",
	COUNT(DISTINCT ordernumber) as "Jumlah Pesanan"
FROM orderdetails
GROUP BY productcode
HAVING SUM(quantityordered) > (
	SELECT AVG(quantityordered)
	FROM orderdetails
)
AND COUNT(DISTINCT ordernumber) > 10
ORDER BY SUM(quantityordered) DESC

-- no 3
SELECT 
	productcode,
	productname,
	quantityinstock,
	MSRP
FROM products
WHERE quantityinstock > (
	SELECT AVG(quantityinstock)
	FROM products
)
AND MSRP > (
	SELECT AVG(MSRP)
	FROM products
)
ORDER BY quantityinstock DESC


-- no 4
SELECT ordernumber, status 
FROM orders
WHERE ordernumber = 10100

BEGIN

UPDATE orders
SET status = 'Shipped'
WHERE ordernumber = 10100

SAVEPOINT status_pengiriman;

SELECT ordernumber, status 
FROM orders
WHERE ordernumber = 10100

UPDATE orders
SET status = 'Batal'
WHERE ordernumber = 10100

SELECT ordernumber, status 
FROM orders
WHERE ordernumber = 10100

ROLLBACK TO SAVEPOINT status_pengiriman

COMMIT



-- no 5
CREATE TABLE anggota (
	id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nama_anggota VARCHAR(50) NOT NULL,
	kota_domisili VARCHAR(20) NOT NULL
);

CREATE TABLE buku (
	id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	judul_buku VARCHAR(100) NOT NULL,
	genre VARCHAR(20) NOT NULL,
	stok INT DEFAULT 1
);

CREATE TABLE peminjaman (
	id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
	id_anggota INTEGER,
	id_buku INTEGER,
	tanggal_pinjam DATE NOT NULL,
	tanggal_kembali DATE,
	denda INTEGER DEFAULT 0,
	
	CONSTRAINT fk_peminjaman_anggota
		FOREIGN KEY (id_anggota)
		REFERENCES anggota(id),

	CONSTRAINT fk_peminjaman_buku
		FOREIGN KEY (id_buku)
		REFERENCES buku(id)
);

CREATE INDEX index_genre_buku
ON buku(genre);
CREATE INDEX idex_kota_anggota
ON anggota(kota_domisili);





	