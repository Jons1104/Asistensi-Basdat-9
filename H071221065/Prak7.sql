# Izzata Clarissa Salsabila
# H071221065
# Tugas Praktikum 7


# NO1
USE classicmodels;

SELECT 
	CONCAT('Jalan ', o.addressLine1) AS addressLine1,
	CONCAT('Jalan ', o.addressLine2) AS addressLine2,
	o.city, o.country 
FROM offices o
JOIN employees e 
USING (officeCode)
JOIN customers c
ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN payments p
ON p.customerNumber = c.customerNumber
GROUP BY c.customerNumber
HAVING COUNT(p.amount) = 
	(SELECT COUNT(p.amount)
	FROM payments p
	GROUP BY p.customerNumber
	ORDER BY COUNT(p.amount) ASC
	LIMIT 1);
	

# NO2
-- Pendapatan Terbesar
SELECT CONCAT(e.firstname, ' ', e.lastname) as Nama_Karyawan,
    SUM(p.amount) AS totalPendapatan
FROM employees e
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN payments p USING(customerNumber)
GROUP BY e.employeeNumber
HAVING SUM(p.amount) = (
    SELECT MAX(totalPendapatan)
    FROM (SELECT SUM(p.amount) AS totalPendapatan
          FROM customers c
          JOIN payments p
          USING (customerNumber)
          GROUP BY c.salesRepEmployeeNumber) AS max_pendapatan
)
OR SUM(p.amount) = (
	SELECT MIN(totalPendapatan)
    FROM (SELECT SUM(p.amount) AS totalPendapatan
          FROM customers c
          JOIN payments p
          USING (customerNumber)
          GROUP BY c.salesRepEmployeeNumber) AS min_pendapatan
);
	
# NO3 
SELECT
    c.Name 'Negara',
    c.Population*cl.Percentage/100 AS 'Pengguna Bahasa'
FROM country c
JOIN countrylanguage cl
ON c.Code = cl.CountryCode
WHERE cl.language = 
	(SELECT countrylanguage.language
	FROM countrylanguage
		JOIN country
		ON country.Code = countrylanguage.CountryCode
		WHERE country.Continent = 'Asia'
		GROUP BY countrylanguage.language
		ORDER BY COUNT(countrylanguage.language) DESC
		LIMIT 1)
ORDER BY c.Population*cl.Percentage/100 DESC;


# NO4		
SELECT c.customerName AS customerName,
	SUM(p.amount) AS Total_Pembayaran,
	SUM(od.quantityOrdered) AS Banyak_Barang,
	GROUP_CONCAT(pr.productName) AS Produk_Yang_Dibeli
FROM customers c
JOIN orders o USING(customerNumber)
JOIN orderdetails od USING(orderNumber)
JOIN products pr USING(productCode)
JOIN payments p USING(customerNumber)
GROUP BY c.customerNumber
HAVING Total_Pembayaran >
	(SELECT AVG(subTotal)
	FROM (SELECT SUM(od.quantityOrdered * od.priceEach) AS subTotal
		FROM customers c 
		JOIN orders o USING(customerNumber)
		JOIN orderdetails od USING (orderNumber)
		GROUP BY c.customerNumber) AS avgTotal)
ORDER BY SUM(p.amount) DESC;


# NO5 (Tambahan)
SELECT e.employeeNumber,e.lastName, e.firstName, city, o.officeCode
FROM offices o
JOIN employees e
USING (officeCode)
WHERE o.officeCode =
	(SELECT o.officeCode FROM offices o
	JOIN employees e USING (officeCode)
	GROUP BY e.officeCode
	ORDER BY COUNT(e.officeCode) DESC 
	LIMIT 1 );
