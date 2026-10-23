--Soal 1
SELECT c.contactfirstname AS "Nama depan kontak",
	c.customerName AS "Nama lengkap",
	o.city AS "Kota kantor cabang",
	CONCAT(e.firstName, ' ', e.lastName) AS "Sales_rep_name"
	FROM customers AS c
JOIN employees AS e ON c.salesrepemployeeNumber = e.employeeNumber
JOIN offices AS o ON e.officeCode = o.officeCode
WHERE LOWER(c.contactFirstName) LIKE 'a%' AND (c.city) != 'NYC'
ORDER BY c.customername ASC;

--Soal 2
SELECT c.customerName AS "Nama pelanggan",
	SUM(p.amount) AS "Total_payment",
	MAX(p.amount) AS "Max_single_payment"
	FROM customers AS c
JOIN payments AS p ON c.customerNumber = p.customerNumber
GROUP BY c.customerNumber, c.customerName
HAVING SUM (p.amount) > 50000
ORDER BY "Total_payment" DESC;

--Soal 3
SELECT c.customerName AS "Nama pelanggan",
	COUNT(DISTINCT o.orderNumber ) AS "Total_order",
	ROUND(AVG(od.quantityOrdered), 2) AS "Avg_quantity_per_order"
	FROM customers AS c
JOIN orders AS o ON c.customerNumber = o.customerNumber
JOIN orderdetails AS od ON o.orderNumber = od.orderNumber
GROUP BY c.customerNumber, c.customerName
HAVING COUNT(DISTINCT o.orderNumber) > 3 AND AVG(od.quantityOrdered) > 35
ORDER BY "Total_order" DESC,
		 "Avg_quantity_per_order" DESC;

--Soal 4
SELECT p.productLine AS "ProductLine",
	SUM(od.quantityOrdered) AS "Total_terjual",
	ROUND(AVG(od.priceEach),2) AS "Rata_rata_harga",
	ROUND(AVG(((p.MSRP - od.priceEach) / p.MSRP) * 100), 2) AS "Avg_discount_percentage"
	FROM products AS p
JOIN orderDetails AS od ON p.productCode = od.productCode
GROUP BY p.productLine
HAVING SUM (od.quantityOrdered) > 3000 AND AVG(od.priceEach) > 80
ORDER BY "Total_terjual" DESC;

--Soal 5
SELECT c.customerName AS "Nama pelanggan",
	SUM(od.quantityOrdered * od.priceEach) AS "Total transaksi",
	COUNT(DISTINCT o.orderNumber) AS "Total_shipped_orders",
	ROUND(SUM(od.quantityOrdered * od.priceEach) / COUNT(DISTINCT o.orderNumber), 2) AS "Avg_transaction_per_order"
	FROM customers AS c
JOIN orders AS o ON c.customerNumber = o.customerNumber
JOIN orderDetails AS od ON o.orderNumber = od.orderNumber
WHERE o.status = 'Shipped'
GROUP BY c.customerName, c.customerNumber
HAVING COUNT(DISTINCT EXTRACT(YEAR FROM o.orderDate)) > 1
ORDER BY "Total transaksi" DESC
LIMIT 5;

--Soal 6
SELECT c.customerName AS "Nama pelanggan",
	c.city AS "Customer_city",
	ofc.city AS "Office_city",
	SUM(od.quantityOrdered) AS "Total_unit_terjual",
	ROUND(SUM(od.quantityOrdered * od.priceEach) / COUNT(DISTINCT o.orderNumber), 2) AS avg_nilai_per_order
FROM customers AS c
JOIN employees AS e ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN offices AS ofc ON e.officeCode = ofc.officeCode
JOIN orders AS o ON c.customerNumber = o.customerNumber
JOIN orderDetails AS od ON o.orderNumber = od.orderNumber
WHERE ofc.territory = 'EMEA'
GROUP BY c.customerNumber, c.customerName, c.city, ofc.city
HAVING COUNT(DISTINCT EXTRACT(YEAR FROM o.orderDate)) > 2 AND SUM(od.quantityOrdered) > 1000 AND SUM(od.quantityOrdered * od.priceEach) / COUNT(DISTINCT o.orderNumber) > 10000
ORDER BY avg_nilai_per_order DESC;
	
	
	
	
	
	
	
	


	
	
	
	
	
	
	