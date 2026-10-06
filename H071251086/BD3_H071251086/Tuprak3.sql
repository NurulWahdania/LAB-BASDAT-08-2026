-- nomor 1
SELECT 
	orderNumber, 
	UPPER(productCode) AS "Kode Produk",
	quantityOrdered,
	priceEach
FROM classicmodels.orderdetails
WHERE 
	LEFT(productCode, 3) = 'S18'
	AND (quantityOrdered BETWEEN 20 AND 50 OR priceEach < 30)
ORDER BY quantityOrdered DESC;

-- nomor 2
SELECT 
	customerNumber,
	customerName,
	country,
	CONCAT(contactFirstName, ' ', contactLastName) AS "Nama Kontak", 
	creditLimit,
	creditLimit - 10000 AS "Selisih Kredit"
FROM classicmodels.customers
WHERE (country = 'USA' OR country = 'Canada' OR country = 'France') AND (creditLimit > 30000)
ORDER BY creditLimit DESC;

-- nomor 3
SELECT 
	productCode,
	productName,
	buyPrice,
	MSRP,
	GREATEST(buyPrice) AS "Harga Tertinggi", 
	LEAST(buyPrice) AS "Harga Terendah"
FROM classicmodels.products
WHERE productName ILIKE '%car%';

-- nomor 4
SELECT
	orderNumber,
	orderDate, 
	shippedDate,
	EXTRACT(YEAR FROM orderDate) AS "Tahun",
	EXTRACT(MONTH FROM orderDate) AS "Bulan",
	shippedDate - orderDate AS "Lama Pengiriman",
	shippedDate - orderDate AS "Interval Pengiriman",
	CURRENT_DATE AS "Tanggal Laporan",
	CURRENT_TIME AS "Waktu Laporan"
FROM classicmodels.orders
WHERE shippedDate IS NOT NULL;

-- nomor 5
SELECT 
	orderNumber,
	orderDate,
	shippedDate,
	orderDate + INTERVAL '10 days' AS "Estimasi Kirim",
	COALESCE(shippedDate, orderDate + INTERVAL '10 days') AS "Tanggal Aktual",
	shippedDate - orderDate AS "Selisih Waktu"
FROM classicmodels.orders
WHERE comments ILIKE '%customer%' AND (EXTRACT(MONTH FROM orderDate) BETWEEN 10 AND 12) AND (orderNumber % 2 = 1)
ORDER BY orderDate DESC;
 

	
	
	
	
	





	