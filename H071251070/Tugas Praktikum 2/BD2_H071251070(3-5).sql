SET search_path TO classicmodels, public;

--  soal 3
SELECT (customernumber) AS "Nomor Pelanggan", 
		(customername) AS "Nama Pelanggan",
		(phone) AS "Telepon" ,
		(country) AS "Negara" FROM customers;

-- soal 4
SELECT  productcode, productname, buyprice FROM products
WHERE buyprice > 50
ORDER BY buyprice ASC
LIMIT 7;

-- soal 5
SELECT  DISTINCT (country) AS "Negara Pelanggan" FROM customers
ORDER BY  country ASC
LIMIT 5  OFFSET 5;

SELECT * FROM  customers;





