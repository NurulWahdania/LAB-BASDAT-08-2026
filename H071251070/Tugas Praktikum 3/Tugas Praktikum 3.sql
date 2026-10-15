SET search_path TO classicmodels, public;

-- soal 1
SELECT ordernumber, UPPER(productcode) AS "kode produk", quantityordered, priceeach FROM orderdetails
WHERE (quantityordered BETWEEN 20 AND 50 OR priceeach < 30) AND productcode LIKE  'S18%'
ORDER BY quantityordered DESC;

-- soal 2
SELECT customernumber, customername, country, CONCAT(contactfirstname, ' ', contactlastname) AS "Nama Kontak", creditlimit, creditlimit - 10000 AS "Selisih Kredit" FROM customers
WHERE country IN ('USA', 'France', 'Canada') AND creditlimit > 30000
ORDER BY creditlimit DESC;

-- soal 3
SELECT productcode, productname, buyprice, msrp, GREATEST(buyprice, msrp) AS "Harga tertinggi", LEAST(buyprice, msrp) AS "Harga terendah" FROM products
WHERE productname ILIKE '%car%';

-- soal 4
SELECT ordernumber, orderdate, shippeddate, DATE_PART('year', orderdate) AS Tahun, DATE_PART('month', orderdate) AS Bulan, AGE(shippeddate, orderdate) AS "Lama Pengiriman", AGE(shippeddate, orderdate) AS "Interval Pengiriman", CURRENT_DATE AS "Tanggal laporan", CURRENT_TIME AS "Waktu Laporan" FROM orders 
WHERE shippeddate IS NOT NULL;

-- soal 5
SELECT ordernumber, orderdate, shippeddate, orderdate + INTERVAL '10 days' AS "Estimasi Kirim", COALESCE(shippedDate, orderDate + INTERVAL '10 days') AS "Tanggal Aktual",AGE(shippedDate, orderDate) AS "Selisih Waktu" FROM orders
WHERE comments ILIKE '%customer%'
AND EXTRACT(MONTH FROM orderDate) BETWEEN 10 AND 12
AND orderNumber % 2 = 1
ORDER BY orderDate DESC;
