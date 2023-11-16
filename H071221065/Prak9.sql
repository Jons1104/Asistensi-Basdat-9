# IZZATA CLARISSA SALSABILA
# H071221065
# Praktikum 9


# NO1
-- Tampilkan jumlah pesanan tiap tahun dan kategorikan jumlah pesanan tersebut
-- (Kategori pesanan: banyak = di atas 150, sedikit = di bawah 75 dan yang lain dikategorikan sedang)
USE classicmodels;

SELECT YEAR(orderDate) AS 'tahun', COUNT(orderNumber) AS 'jumlah pesanan', 
CASE
	WHEN COUNT(orderNumber) > 150 THEN 'Banyak'
	WHEN COUNT(orderNumber) < 75 THEN 'Sedikit'
	ELSE 'Sedang' 
	END 'kategori pesanan'
FROM orders
GROUP BY YEAR(orderDate) 
ORDER BY COUNT(orderNumber) DESC ;


# NO2
-- Tampilkan total gaji karyawan dan kategorikan berdasarkan gaji karyawan
-- (Kategori karyawan: di atas rata-rata total gaji karyawan dan di bawah rata-rata total gaji karyawan)
USE classicmodels;

SELECT CONCAT(e.firstName, ' ', e.lastName) AS 'nama karyawan', SUM(p.amount) AS 'gaji', 
CASE
	WHEN SUM(p.amount) > (SELECT AVG(total) 
								FROM (SELECT SUM(payments.amount) AS 'total' 
								FROM customers
 								JOIN payments USING (customerNumber)
 								JOIN employees ON employeeNumber = salesRepEmployeeNumber
 								GROUP BY employeeNumber) AS a) THEN 'di atas rata-rata gaji'
	ELSE 'di bawah rata-rata gaji' 
	END 'kategori gaji'
FROM employees e
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN payments p USING (customerNumber)
GROUP BY e.employeeNumber
ORDER BY SUM(p.amount) DESC;


# NO3
-- Tampilkan nama pelanggan, tahun pembuatan produk, jumlah produk,
-- total durasi pengiriman(tgl pengiriman - tanggal pemesanan) dan keterangan target...
USE classicmodels;

(SELECT c.customerName AS 'Nama Pelanggan', 
	GROUP_CONCAT(LEFT(p.productName, 4)) AS 'Tahun Pembuatan', 
	COUNT(p.productCode) AS 'Jumlah Produk', 
	SUM(DATEDIFF(o.shippedDate, o.orderDate)) AS 'Total Durasi Pengiriman',
	CASE 
	WHEN MONTH(o.orderDate) % 2 = 1 AND 
		SUM(DATEDIFF(o.shippedDate, o.orderDate)) > (SELECT AVG(total) FROM (
																	SELECT SUM(DATEDIFF(shippedDate, orderDate)) AS total
																	FROM orders GROUP BY customerNumber) AS a) THEN 'Target 1'
	WHEN MONTH(o.orderDate) % 2 = 0 AND 
		SUM(DATEDIFF(o.shippedDate, o.orderDate)) > (SELECT AVG(total) FROM (
																	SELECT SUM(DATEDIFF(shippedDate, orderDate)) AS total 
																	FROM orders GROUP BY customerNumber) AS a) THEN 'Target 2'
	END 'Keterangan'
	FROM customers AS c
	JOIN orders AS o USING (customerNumber)
	JOIN orderdetails AS od USING (orderNumber)
	JOIN products AS p USING (productCode)
	WHERE p.productName LIKE '18%'
	GROUP BY c.customerNumber
	HAVING keterangan IS NOT NULL)
	
UNION

(SELECT c.customerName,
	GROUP_CONCAT(LEFT(p.productName, 4)), 
	COUNT(p.productCode),
	SUM(DATEDIFF(o.shippedDate, o.orderDate)),
	CASE 
	WHEN MONTH(o.orderDate) % 2 = 1 AND 
		COUNT(p.productCode) > (SELECT AVG(total) * 10 FROM (	
										SELECT COUNT(productCode) AS total 
										FROM products GROUP BY productCode) AS a) THEN 'Target 3'
	WHEN MONTH(o.orderDate) % 2 = 0 AND 
		COUNT(p.productCode) > (SELECT AVG(total) * 10 FROM (	
										SELECT COUNT(productCode) AS total 
										FROM products GROUP BY productCode) AS a) THEN 'Target 4'
	END 'Keterangan'
	FROM customers AS c
	JOIN orders AS o USING (customerNumber)
	JOIN orderdetails AS od USING (orderNumber)
	JOIN products AS p USING (productCode)
	WHERE p.productName LIKE '19%'
	GROUP BY c.customerNumber
	HAVING keterangan IS NOT NULL)
	
UNION

(SELECT c.customerName,
		GROUP_CONCAT(LEFT(p.productName, 4)), 
		COUNT(p.productCode),
		SUM(DATEDIFF(o.shippedDate, o.orderDate)),
		CASE 
		WHEN MONTH(o.orderDate) % 2 = 1 AND 
			COUNT(p.productCode) > (SELECT MIN(total) * 3 FROM (
											SELECT COUNT(productCode) AS total 
											FROM products GROUP BY productCode) AS a) THEN 'Target 5'
		WHEN MONTH(o.orderDate) % 2 = 0 AND 
			COUNT(p.productCode) > (SELECT MIN(total) * 3 FROM (
											SELECT COUNT(productCode) AS total 
											FROM products GROUP BY productCode) AS a) THEN 'Target 6'
	END 'keterangan'
	FROM customers AS c
	JOIN orders AS o USING (customerNumber)
	JOIN orderdetails AS od USING (orderNumber)
	JOIN products AS p USING (productCode)
	WHERE p.productName LIKE '20%'
	GROUP BY c.customerNumber
	HAVING keterangan IS NOT NULL);
