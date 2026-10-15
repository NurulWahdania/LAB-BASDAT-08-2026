SET search_path TO "classicmodels", public;

-- no 3
SELECT
	customernumber AS "Nomor Pelanggan",
	customername AS "Nama Pelanggan",
	phone AS "Telepon",
	country AS "Negara"
FROM customers;

-- no 4
SELECT
	productcode,
	productname,
	buyprice
FROM products
WHERE buyprice > 50
ORDER BY buyprice DESC
LIMIT 7;

-- no 5
SELECT 	DISTINCT
	country AS "Negara Pelanggan"
FROM customers
ORDER BY country
LIMIT 5
OFFSET 5;


