# Izzata Clarissa Salsabila
# H071221065
# Praktikum 6


DROP DATABASE classicmodels;

USE classicmodels;

# NO1
SELECT CONCAT(e.firstName, ' ', e.lastName) AS 'Nama Employee', 
		GROUP_CONCAT(o.orderNumber) AS 'Nomor Orderan', 
		COUNT(c.customerNumber) AS 'Jumlah Pesanan'

FROM employees e
JOIN customers c
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN orders o
ON c.customerNumber = o.customerNumber
GROUP BY employeeNumber
HAVING COUNT(c.customerNumber) > 10;


# NO2
SELECT p.productCode, p.productName, p.quantityInStock, 
		MIN(o.orderDate) AS orderDate
FROM products p
JOIN orderdetails od USING(productCode)
JOIN orders o USING(orderNumber)
WHERE p.quantityInStock > 5000
GROUP BY p.productCode, p.productName, p.quantityInStock
ORDER BY orderDate;


# NO3
SELECT * FROM offices;

SELECT oc.addressLine1 AS 'Alamat',
		CONCAT(LEFT(oc.phone,6),'* **') AS 'Nomor Telp', 
		COUNT(DISTINCT e.employeeNumber) AS 'Jumlah Karyawan',
		COUNT(DISTINCT c.customerNumber) AS 'Jumlah Pelanggan',
		-- round u/ ambil angka dibelakang ,
		-- avg hitung rerata nilai pd kolom
		ROUND(AVG(py.amount),2) AS 'Rata-rata Penghasilan'
FROM offices oc
LEFT JOIN employees e 
USING(officeCode)
LEFT JOIN customers c 
ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN payments py 
USING(customerNumber)
GROUP BY oc.addressLine1
ORDER BY oc.phone


# NO4
SELECT c.customerName AS CustomerName,
	YEAR(o.orderDate) AS TahunOrder,
	MONTHNAME(o.orderDate) AS BulanOrder,
	COUNT(o.orderNumber) AS JumlahPesanan,
	-- sum pemjumlahan
	SUM(od.quantityOrdered * od.priceEach) AS TotalPenjualan
FROM customers c
JOIN orders o USING (customerNumber)
JOIN orderdetails od USING (orderNumber)
WHERE YEAR(o.orderDate) = 2003
GROUP BY CustomerName, BulanOrder;


# NO5 (tambahan)
USE classicmodels;

SELECT c.customerName AS NamaPelanggan, 
		SUM(amount) AS TotalBelanja,
		creditLimit AS BatasKredit,
		SUM(amount) - creditLimit AS Selisih
		
FROM customers c
JOIN payments p
ON c.customerNumber = p.customerNumber
GROUP BY c.customerName
HAVING SUM(amount) > creditLimit
ORDER BY selisih DESC 
LIMIT 5;
		
