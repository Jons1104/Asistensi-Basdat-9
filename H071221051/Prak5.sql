USE classicmodels
#No1
SELECT c.customerName, p.productName, py.paymentDate, o.`status`
FROM customers AS c
JOIN payments AS py
ON c.customerNumber = py.customerNumber
JOIN orders AS o
ON c.customerNumber = o.customerNumber
JOIN orderDetails AS od
ON o.orderNumber = od.orderNumber
JOIN products AS p
ON od.productCode = p.productCode
WHERE p.productName LIKE '%Ferrari 360%' AND o.`status` = 'shipped'
LIMIT 3;

#No2
-- A & B
SELECT DISTINCT c.customerName, p.paymentDate, CONCAT(firstName,' ', lastName) AS employeeName, p.amount 
FROM employees AS e
JOIN customers AS c
ON e.employeeNumber = c.salesrepemployeeNumber
JOIN payments AS p
ON c.customerNumber = p.customerNumber
WHERE MONTH (p.paymentdate) = 11

ORDER BY amount DESC 
LIMIT 1;

-- c
SELECT c.customerName AS 'Nama customer', p.productName AS 'Nama produk'
FROM customers AS c
JOIN orders AS o
ON c.customerNumber = o.customerNumber
JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
JOIN products AS p
ON od.productCode = p.productcode
WHERE customerName = 'Corporate Gift Ideas Co.'; 

-- d
SELECT c.customerName, GROUP_CONCAT(p.productName) AS productName
FROM customers AS c
JOIN orders AS o
ON c.customerNumber = o.customerNumber
JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
JOIN products AS p
ON od.productCode = p.productcode
WHERE customerName = 'Corporate Gift Ideas Co.'; 

#No3
SELECT c.customerName, o.orderDate,o.shippedDate, o.shippedDate - o.orderDate AS 'Menunggu'
FROM customers AS c
JOIN orders AS o
ON c.customerNumber = o.customerNumber
WHERE c.customerName = 'GiftsForHim.com';

#No4
USE world
-- a & B
SELECT `Code`, `name` 
FROM country
WHERE `code` LIKE 'C%K' AND lifeExpectancy IS NOT NULL;







