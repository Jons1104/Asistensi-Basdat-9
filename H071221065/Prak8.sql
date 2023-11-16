# Izzata Clarissa Salsabila
# H071221065
# Tugas Praktikum 8


USE classicmodels

# NO1
-- Tampilkan 3 pelanggan dengan modal tertinggi dan 3 pelanggan dengan modal 
-- terendah beserta productName (Modal = harga beli x total pesanan)

-- Tertinggi
(SELECT
  c.customerName,
  p.productName,
  p.buyPrice * SUM(od.quantityOrdered) AS modal
FROM customers c
JOIN orders o USING(customerNumber)
JOIN orderdetails od USING(orderNumber)
JOIN products p USING(productCode)
GROUP BY c.customerNumber
ORDER BY modal DESC
LIMIT 3)
	
UNION

-- Terendah
(SELECT
  c.customerName,
  p.productName,
  p.buyPrice * SUM(od.quantityOrdered) AS modal
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN products p ON od.productCode = p.productCode
GROUP BY c.customerNumber
ORDER BY modal
LIMIT 3)


# NO2
-- Menampilkan kota apa yang paling banyak karyawan atau pelanggan yang namanya diawali huruf L
SELECT city, COUNT(*) AS total
FROM (
   SELECT o.city, e.firstName 
	FROM employees e
	JOIN offices o USING(officeCode)
	WHERE firstName LIKE 'L%'
	
   UNION 
   
	SELECT city, customerName FROM customers 
	WHERE customerName LIKE 'L%'
) AS ec_city
GROUP BY city
ORDER BY total DESC  
LIMIT 1;

# NO3
-- Tampilkan seluruh karyawan atau pelanggan yang dilayani dan statusnya (karyawan/pelanggan) 
-- yang berasal dari kantor yang memiliki employee (karyawan)
-- paling sedikit kemudian urutkan berdasarkan nama karyawan/pelanggan
SELECT CONCAT(e.firstName, ' ', e.lastName) AS NamaKaryawanPelanggan, 'Karyawan' AS Status
FROM employees e
WHERE e.officeCode IN (
	SELECT officeCode
	FROM employees
	GROUP BY officeCode
	HAVING COUNT(*) = (
		SELECT MIN(employee_count)
		FROM (
		   SELECT COUNT(*) AS employee_count
		   FROM employees
		   GROUP BY officeCode
		) AS OfficeEmployeeCounts
	)
)

UNION

SELECT c.customerName, 'Pelanggan'
FROM customers c
WHERE c.salesRepEmployeeNumber IN (
	SELECT employeeNumber
	FROM employees
	WHERE officeCode IN (
		SELECT officeCode
		FROM employees
		GROUP BY officeCode
		HAVING COUNT(*) = (
	      SELECT MIN(employee_count)
			FROM (
			   SELECT COUNT(*) AS employee_count
			   FROM employees
			   GROUP BY officeCode
			) AS OfficeEmployeeCounts
		)
   )
)
ORDER BY NamaKaryawanPelanggan;


# NO4
-- Tampilkan tanggal dan riwayat proses yang pernah dilakukan oleh customer 
-- (memesan barang atau membayar pesanan) pada bulan april 2003
SELECT tanggal, GROUP_CONCAT(statuspesanan SEPARATOR ' dan ') AS riwayat
FROM (
	SELECT orderDate AS tanggal, 'memesan barang' AS statuspesanan
	FROM orders
	WHERE MONTH(orderDate) = 4 AND YEAR(orderDate) = 2003
	
	UNION
	
	SELECT paymentDate, 'membayar pesanan'
	FROM payments
	WHERE MONTH(paymentDate) = 4 AND YEAR(paymentDate) = 2003
) AS datacustomers
GROUP BY tanggal
ORDER BY tanggal;


# NO5 (Soal Tambahan)
-- Tampilkan productline, nama produk, total penjualan, dan berikan status(terlaris/kurang laris) 
-- dari setiap produk yang paling laris dan kurang laris pada masing2 productline

SELECT productline, productName, quantityOrdered AS 'TotalPenjualan', 'Terlaris' as status
FROM products
JOIN orderdetails USING(productCode)
WHERE (productLine, quantityOrdered) IN 
	(SELECT productLine, MAX(quantityOrdered)
	FROM products
	JOIN orderdetails USING(productCode)
	GROUP BY productLine)
	
GROUP BY productLine	
UNION 
 
SELECT productLine, productName, quantityOrdered AS 'TotalPenjualan', 'Kurang Laris' as status
FROM products
JOIN orderdetails USING(productCode)
WHERE (productLine, quantityOrdered) IN 
	(SELECT productLine, MIN(quantityOrdered)
	FROM products
	JOIN orderdetails USING(productCode)
	GROUP BY productLine)

GROUP BY productLine
ORDER BY productLine, TotalPenjualan DESC;
