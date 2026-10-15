SET search_path TO classicmodels, public;

--soal3--
SELECT customerNumber AS "Nomor Pelanggan", 
	customerName AS "Nama Pelanggan", 
	phone AS "Telepon", 
	country AS "Negara" 
	FROM customers;

--soal4-- 
SELECT productCode, productName, buyPrice FROM products
ORDER BY buyPrice DESC
LIMIT 7;

--soal5--

SELECT DISTINCT country AS "Negara Pelanggan" FROM customers
ORDER BY country ASC
OFFSET 5
LIMIT 5;