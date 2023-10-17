--1
USE classicmodels

SELECT c.customerName, p.productName, py.paymentDate, STATUS FROM payments py 
JOIN customers c USING(customerNumber) 
JOIN orders o USING(customerNumber) 
JOIN orderdetails od USING(orderNumber) 
JOIN products p USING(productCode) 
WHERE p.productName LIKE '%Ferrari%' AND od.STATUS = 'Shipped';

--2
-- A
SELECT customerName, paymentDate, CONCAT (firstName, ' ', lastName) AS nama FROM customers INNER JOIN employees
ON employees.employeeNumber = customers.salesRepEmployeeNumber 
INNER JOIN payments USING(customerNumber) WHERE MONTH(paymentDate) = '11';
-- B
SELECT DISTINCT checkNumber, customerName, amount, paymentDate FROM payments
JOIN customers USING(customerNumber)
JOIN orders USING(customerNumber) 
JOIN orderdetails USING(orderNumber)
WHERE MONTH(paymentDate) = '11' ORDER BY amount DESC LIMIT 1;

#SELECT * FROM payments WHERE MONTH(paymentDate) = '11' ORDER BY amount DESC

-- C
SELECT customerName, productName, amount, paymentDate FROM payments
JOIN customers USING (customerNumber)
JOIN orders USING(customerNumber)
JOIN orderdetails USING(orderNumber)
JOIN products USING(productCode) 
WHERE customerName = 'Corporate Gift Ideas Co.' AND MONTH(paymentDate) = '11';

--3
SELECT customerName, orderDate, shippedDate, DATEDIFF(shippeddate, orderdate) AS 'Waktu menunggu' FROM customers
JOIN orders USING(customerNumber)
WHERE customerName LIKE '%GiftsForHim%';

--4
-- A & B
#SELECT * FROM country
SELECT code,NAME, lifeExpectancy FROM country WHERE code LIKE 'C%K' AND lifeExpectancy IS NOT NULL;
