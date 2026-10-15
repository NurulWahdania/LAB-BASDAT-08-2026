SET search_path TO classicmodels, public;

SELECT * FROM  customers;

-- soal 1
SELECT customernumber,  SUM(amount) AS "Total dana", COUNT(DISTINCT(amount)) AS "Jumlah Frekuensi Unik" , MAX(amount) AS "Nilai Setoran Terbesar" FROM payments
GROUP BY customernumber
HAVING COUNT(amount) > 4 AND AVG(amount) > 20000;

-- soal 2
SELECT customernumber, SUM(amount) AS "Total Keseluruhan Setoran" FROM payments
GROUP BY customernumber
HAVING SUM(amount) > 80000
ORDER BY SUM(amount) DESC;

-- soal 3
SELECT productline, 
COUNT(DISTINCT productname) AS "Jumlah Ragam Produk", 
ROUND(AVG(msrp), 2) AS "Rata-rata harga jual",
STRING_AGG(productname, ', ') AS "Daftar Produk" FROM products
GROUP BY productline
HAVING COUNT(productcode) > 10;

-- soal 4
SELECT DISTINCT employees.employeeNumber
FROM employees
JOIN employees e ON employees.employeeNumber = e.reportsTo
WHERE employees.jobTitle NOT LIKE '%VP%' AND employees.jobTitle NOT LIKE '%President%';


-- soal 5
SELECT productcode, SUM(quantityordered) AS "unit terjual", ROUND(AVG(priceeach), 2) AS "rata-rata" FROM orderdetails
WHERE priceeach > 100
GROUP BY productcode
HAVING SUM(quantityordered) > 50
ORDER BY "unit terjual" DESC;

-- soal 6
SELECT productcode, SUM(quantityordered) AS "total yg dipesan",
SUM(quantityordered * priceeach) AS "pendapatan kotor",
ROUND(AVG(priceeach), 2) AS "ratarata", MAX(priceeach) - MIN(priceeach) AS "selisih" FROM orderdetails
WHERE quantityordered > 20
GROUP BY productcode
HAVING SUM(quantityordered * priceeach) > 50000
ORDER BY "pendapatan kotor" DESC;

-- soal 7
SELECT customernumber FROM customers
WHERE creditlimit > 80000
INTERSECT
SELECT DISTINCT customernumber FROM orders
WHERE status = 'Cancelled' OR status = 'On Hold'
EXCEPT
SELECT customernumber FROM payments
GROUP BY customernumber
HAVING SUM(amount) > 100000;

