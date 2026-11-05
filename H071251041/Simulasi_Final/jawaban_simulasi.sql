
-- SOAL 1 EASY
CREATE TABLE kategori (
	id_kategori INT PRIMARY KEY,
	nama_kategori VARCHAR(30) NOT NULL
);

CREATE TABLE buku (
	id_buku INT PRIMARY KEY,
	judul VARCHAR (40) NOT NULL,
	id_kategori INT,
	CONSTRAINT fk_buku_kategori
		FOREIGN KEY (id_kategori)
		REFERENCES kategori(id_kategori)
);

CREATE TABLE peminjaman (
	id_pinjam INT PRIMARY KEY,
	id_buku INT,
	CONSTRAINT fk_peminjaman_buku
		FOREIGN KEY (id_buku)
		REFERENCES buku(id_buku)		
);


-- soal 2 easy

INSERT INTO kategori (id_kategori, nama_kategori)
VALUES (10, 'Sains & Teknologi');

INSERT INTO kategori (id_kategori, nama_kategori)
VALUES (20, 'Sastra & Fiksi');


INSERT INTO buku (id_buku, judul, id_kategori)
VALUES (101, 'Pemrograman SQL', 10),
	(102, 'Struktur DAta', 10),
	(103, 'Algoritma Pemrograman', 10),
	(201, 'Novel Laskan Pelangi', 20),
	(202, 'Bumi Manusia', 20);

INSERT INTO peminjaman (id_pinjam, id_buku)
VALUES (5001, 101);

SELECT * FROM peminjaman;


-- soal 3 easy

SELECT * FROM buku
where id_kategori <= 10
ORDER BY judul;

DROP TABLE peminjaman;
DROP TABLE buku;
DROP TABLE kategori;



-- SOAL 4 MEDIUM
SELECT 
	UPPER(c.city) AS "Nama Kota",
	COUNT(cs.customer_id) AS "Jumlah Pelanggan" 
FROM city c
JOIN address ad
ON c.city_id = ad.city_id
JOIN customer cs
ON ad.address_id = cs.address_id
GROUP BY c.city
HAVING COUNT(cs.customer_id) >= 2
ORDER BY "Jumlah Pelanggan" DESC, "Nama Kota";



-- SOAL 5 MEDIUM
SELECT
	rating AS "Rating Usia",
	COUNT (title) AS "Total Judul Film",
	ROUND(AVG(rental_rate), 2) AS "Rata-Rata Biaya Sewa"
FROM film
WHERE length > 100
GROUP BY rating
ORDER BY "Rata-Rata Biaya Sewa" DESC;



-- SOAL 6 MEDIUM
SELECT
	UPPER(cs.first_name ||' '|| cs.last_name) AS "Nama Lengkap Pelanggan",
	c.city AS "Nama Kota",
	COUNT(p.payment_id) AS "Jumlah Transaksi",
	ROUND(SUM(p.amount), 2) AS "Total Pembayaran"
FROM customer cs
JOIN address ad
ON cs.address_id = ad.address_id
JOIN city c
ON c.city_id = ad.city_id
JOIN payment p
ON p.customer_id = cs.customer_id
WHERE c.city ILIKE 'A%'
GROUP BY cs.first_name, cs.last_name, c.city
HAVING ROUND(SUM(p.amount), 2) >= 100.00
ORDER BY "Total Pembayaran" DESC;



-- SOAL 7 HARD
SELECT
	cs.customer_id AS "ID Pelanggan",
	UPPER(cs.first_name || ' '|| cs.last_name) AS "Nama Lengkap Pelanggan",
	c.city AS "Nama Kota",
	ROUND(SUM(p.amount), 2) AS "Total Pembayaran"
FROM customer cs
JOIN address ad
ON cs.address_id = ad.address_id
JOIN city c
ON c.city_id = ad.city_id
JOIN payment p
ON p.customer_id = cs.customer_id
WHERE c.city IN ('Aden', 'Batman', 'Ciomas')
GROUP BY cs.customer_id, cs.first_name, cs.last_name, c.city
HAVING ROUND(SUM(p.amount), 2) > (
	SELECT ROUND(AVG(amount), 2)
	FROM payment
)
ORDER BY "Total Pembayaran" DESC;


-- SOAL 8 HARD

SELECT
    UPPER(ac.first_name || ' ' || ac.last_name) AS "Nama Lengkap Actor",
    STRING_AGG(f.title, ', ') AS "Daftar Film Action"
FROM actor ac
JOIN film_actor fa
    ON ac.actor_id = fa.actor_id
JOIN film f
    ON f.film_id = fa.film_id
JOIN film_category fc
    ON f.film_id = fc.film_id
JOIN category c
    ON c.category_id = fc.category_id
WHERE c.name = 'Action' 
  AND f.rental_rate > 3.00 
  AND ac.actor_id NOT IN (
      SELECT fa2.actor_id
      FROM film_actor fa2
      JOIN film_category fc2 
          ON fa2.film_id = fc2.film_id
      JOIN category c2 
          ON fc2.category_id = c2.category_id
      WHERE c2.name = 'Horror'
  )
GROUP BY ac.actor_id, ac.first_name, ac.last_name
ORDER BY "Nama Lengkap Actor" ASC;

