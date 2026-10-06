SET search_path TO classicmodels, public;

SELECT * FROM customers;

SELECT 
	customerNumber AS "Nama Pelanggan",
	customerName AS "Nama Pelanggan",
	phone AS "Telepon",
	country AS "Negara"
FROM customers;

SELECT productCode, productName, buyPrice FROM products
WHERE buyPrice > 50
ORDER by buyPrice DESC
LIMIT 7;

SELECT DISTINCT country AS "Negara"
FROM customers
ORDER by country ASC
LIMIT 5 OFFSET 5;