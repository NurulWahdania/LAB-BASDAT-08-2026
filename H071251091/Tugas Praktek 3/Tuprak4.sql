SET search_path TO ClassicModels, public;

--Soal1--
SELECT orderNumber, 
	UPPER (productCode) AS "Kode Produk",
	quantityOrdered, 
	priceEach
FROM orderdetails
WHERE (quantityOrdered BETWEEN 20 AND 50 OR priceEach < 30)
AND LEFT (productCode, 3) LIKE 'S18'
ORDER BY quantityOrdered DESC;

--Soal2--
SELECT customerNumber, 
	customerName, 
	country, 
	creditLimit,
	CONCAT (contactFirstName, ' ' ,contactLastName) AS "Nama Kontak",
	creditLimit - 10000 AS "Selisih Kredit"
FROM customers
WHERE country IN ('USA', 'Canada', 'France')
AND creditLimit > 30000
ORDER BY creditLimit DESC;

--Soal3--
SELECT productCode, 
	productName, 
	buyPrice, 
	MSRP,
	GREATEST (buyPrice, MSRP) AS hargaTertinggi,
	LEAST (buyPrice, MSRP) AS hargaTerendah
FROM products
WHERE productName ILIKE '%car%';

--Soal4--

SELECT orderNumber, 
	orderDate, --pemesanan
	shippedDate, --sampai
	EXTRACT (YEAR FROM orderDate) AS Tahun,
	EXTRACT (MONTH FROM orderDate) AS Bulan,
	shippedDate - orderDate AS lamaPengiriman,
	AGE(shippedDate, orderDate) AS intervalPegiriman,
	CURRENT_DATE AS TanggalLaporan,
	CURRENT_TIME AS WaktuLaporan
FROM orders;


--Soal5--
SELECT orderNumber, 
	orderDate, 
	shippedDate,
	orderDate + INTERVAL '10 days' AS EstimasiKirim,
	COALESCE (shippedDate ,(orderDate + INTERVAL '10 days')) AS TanggalAktual,
	AGE (COALESCE (shippedDate, orderDate + INTERVAL '10 days' ),orderDate) AS SelisihWaktu
FROM orders
WHERE comments ILIKE '%customer%'
AND EXTRACT(MONTH FROM orderDate ) BETWEEN 10 AND 12
AND orderNumber %2 != 0
ORDER BY orderDate DESC;











	