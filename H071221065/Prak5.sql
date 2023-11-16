USE classicmodels;

#NO 1
SELECT c.customerName, p.productName, py.paymentDate, o.status
FROM customers c
JOIN orders o USING (customerNumber)
JOIN orderdetails od USING (orderNumber)
JOIN products p USING (productCode)
JOIN payments py USING (customerNumber)
WHERE 
	p.productName LIKE '%Ferrari%' AND 
	o.status = 'Shipped' AND 
	c.customerName = 'Signal Gift Stores';
	
	

#NO 2
USE classicmodels;

# a. Data nama customer, tanggal pembayaran, dan nama karyawan
SELECT DISTINCT c.customerName AS 'Nama Customer', 
	py.paymentDate AS 'Tanggal Pembayaran', 
	CONCAT(ep.firstName, ' ', ep.lastName) AS 'Nama Karyawan', 
	py.amount
FROM customers c
JOIN orders o USING (customerNumber)
JOIN orderdetails od USING (orderNumber)
JOIN products p USING (productCode)
JOIN payments py USING (customerNumber)
JOIN employees ep
ON ep.employeeNumber = c.salesRepEmployeeNumber
WHERE MONTH(py.paymentDate) = '11';


# b. Pelanggan dengan transaksi terbesar pada bulan November
SELECT DISTINCT c.customerName AS 'Nama Customer', 
	py.paymentDate AS 'Tanggal Pembayaran', 
	CONCAT(ep.firstName, ' ', ep.lastName) AS 'Nama Karyawan', 
	py.amount AS 'Total Transaksi' 
FROM customers c
JOIN orders o USING (customerNumber)
JOIN orderdetails od USING (orderNumber)
JOIN products p USING (productCode)
JOIN payments py USING (customerNumber)
JOIN employees ep
ON ep.employeeNumber = c.salesRepEmployeeNumber
WHERE MONTH(py.paymentDate) = '11'
ORDER BY py.amount DESC
LIMIT 1;

# c. Data nama customer dan nama produk yang dibeli
SELECT c.customerName AS 'Nama Customer', p.productName AS 'Nama Produk'
FROM customers c
JOIN orders o USING (customerNumber)
JOIN orderdetails od USING (orderNumber)
JOIN products p USING (productCode)
WHERE c.customerNumber = 321;

# d. Produk yang dibeli oleh pelanggan dengan transaksi terbanyak
SELECT c.customerName AS 'Nama Customer', GROUP_CONCAT(p.productName) AS 'Nama Produk'
FROM customers c
JOIN orders o USING (customerNumber)
JOIN orderdetails od USING (orderNumber)
JOIN products p USING (productCode)
WHERE c.customerNumber = 321;


#NO 3
USE classicmodels
SELECT
	c.customerName AS 'Nama Customer',
	o.orderDate AS 'Tanggal Order',
	o.shippedDate AS 'Tanggal Pengiriman',
   DATEDIFF(o.shippedDate, o.orderDate) AS 'Waktu Menunggu'
FROM customers c
JOIN orders o USING (customerNumber)
WHERE c.customerName = 'GiftsForHim.com' AND (o.orderDate IS NOT NULL AND o.shippedDate IS NOT NULL);


#NO 4
USE world;

SELECT 
	ct.Code AS 'Kode', 
	ct.Name AS 'Nama Negara',
	c.Name AS 'Nama Kota',  
	ct.LifeExpectancy
FROM city c
JOIN country ct
ON ct.Code = c.CountryCode
WHERE c.CountryCode LIKE 'C%K' AND ct.LifeExpectancy IS NOT NULL;


# Saol Tambahan
USE classicmodels

SELECT 
	MAX(amount) AS 'Terbesar',
	MIN(amount) AS 'Terkecil',

MAX(amount) - MIN(amount) AS 'Selisih'
FROM payments p ;
