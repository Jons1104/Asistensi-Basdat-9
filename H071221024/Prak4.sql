-- 1
USE classicmodels;
SELECT c.customerName "Nama Customer", c.country "Negara", p.paymentDate "tanggal"
FROM customers c
INNER JOIN payments p
ON c.customerNumber = p.customerNumber
WHERE p.paymentDate >= "2005-01-01" ORDER BY p.paymentDate;

--2
SELECT DISTINCT c.customerName "Nama customer", p.productName, pl.textDescription
FROM customers c
INNER JOIN orders o
ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails od
ON o.orderNumber = od.orderNumber
INNER JOIN products p
ON od.productCode = p.productCode
INNER JOIN productlines pl
ON pl.productLine = p.productLine
WHERE p.productName = "The Titanic";

--3
USE classicmodels;

ALTER TABLE products
ADD status VARCHAR(20);

UPDATE products
SET `status` = 'best selling'
WHERE productCode = "S12_4675";

SELECT p.productCode, p.productName, od.quantityOrdered, p.status
FROM products p
INNER JOIN orderdetails od
ON p.productCode = od.productCode
ORDER BY od.quantityOrdered DESC LIMIT 1;

SELECT * from products WHERE STATUS = 'best selling';

--4
SHOW CREATE TABLE orders;
SHOW CREATE TABLE orderdetails;
SHOW CREATE TABLE payments;

ALTER TABLE orderdetails
DROP CONSTRAINT orderdetails_ibfk_1;

ALTER TABLE orderdetails	
ADD CONSTRAINT orderdetails_ibfk_1 FOREIGN KEY(OrderNumber) REFERENCES orders(orderNumber)
ON DELETE CASCADE;

ALTER TABLE orders
DROP CONSTRAINT orders_ibfk_1;

ALTER TABLE orders
ADD CONSTRAINT orders_ibfk_1 FOREIGN KEY(customerNumber) REFERENCES customers(customerNumber)
ON DELETE CASCADE;

ALTER TABLE payments
DROP CONSTRAINT payments_ibfk_1;

ALTER TABLE Payments
ADD CONSTRAINT payments_ibfk_1 FOREIGN KEY(customerNumber) REFERENCES customers(customerNumber)
ON DELETE CASCADE;

DELETE customers
FROM customers
INNER JOIN orders
ON customers.customerNumber = orders.customerNumber
INNER JOIN payments
ON payments.customerNumber = orders.customerNumber
WHERE orders.status = 'Cancelled';

SELECT customers.customerNumber, orders.status FROM customers
INNER JOIN orders
ON customers.customerNumber = orders.customerNumber
WHERE orders.`status` = 'Cancelled';

--5
ALTER TABLE customers
ADD STATUS VARCHAR(255);

UPDATE customers
INNER JOIN orders
ON customers.customerNumber = orders.customerNumber
INNER JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
INNER JOIN payments
ON customers.customerNumber = payments.customerNumber
SET customers.status = "VIP"
WHERE orderdetails.quantityOrdered >= 50 OR payments.amount > 100000;

SELECT distinct c.customerNumber, c.customerName, c.status
FROM customers c
INNER JOIN orders o
ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails od
ON o.orderNumber = od.orderNumber
INNER JOIN payments p
ON c.customerNumber = c.customerNumber
