USE classicmodels;


# NO1
SELECT c.customerName AS 'Nama Customer', c.country AS 'Negara', p.paymentDate AS 'Tanggal'
FROM customers c
INNER JOIN payments p
ON c.customerNumber = p.customerNumber
WHERE p.paymentDate > '2004-12-31'
ORDER BY p.paymentDate DESC;



# NO2
SELECT DISTINCT c.customerName AS 'Nama Customer', p.productName, pl.textDescription
FROM customers c
INNER JOIN orders o
ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails od
ON o.orderNumber = od.orderNumber
INNER JOIN products p
ON od.productCode = p.productCode
INNER JOIN productlines pl
ON p.productLine = pl.productLine
WHERE p.productName = 'The Titanic'



# NO3 
SELECT orderdetails;

DESCRIBE products;
SELECT * FROM products;

ALTER TABLE products 
ADD COLUMN status VARCHAR(20);

UPDATE products
SET STATUS = 'best selling'
WHERE productCode = 'S12_4675';

SELECT pr.productCode, pr.productName, od.quantityOrdered, pr.STATUS
FROM products AS pr
JOIN orderdetails AS od
ON pr.productCode = od.productCode
ORDER BY od.quantityOrdered DESC
LIMIT 1



# NO4 
SELECT * FROM  orders;
ALTER TABLE orders
	DROP FOREIGN KEY orders_ibfk_1;
ALTER TABLE orders
	ADD CONSTRAINT order_ibfk_1 FOREIGN KEY (customerNumber) REFERENCES customers (customerNumber)ON UPDATE CASCADE ON DELETE CASCADE;
	
ALTER TABLE orderdetails 
	DROP FOREIGN KEY orderdetails_ibfk_1;
ALTER TABLE orderdetails
	ADD CONSTRAINT orderdetails_ibfk_1 FOREIGN KEY (orderNumber) REFERENCES orders (orderNumber) ON UPDATE CASCADE ON DELETE CASCADE;

SELECT * FROM orders
WHERE STATUS = 'Cancelled';

DELETE customers
SELECT c.customerName, o.`status` FROM customers c
INNER JOIN orders o
ON c.customerNumber = o.customerNumber
WHERE o.`status` = 'Cancelled';


DROP DATABASE classicmodels;


# Soal Tambahan
USE classicmodels  

DESCRIBE customers
SELECT * FROM customers;

ALTER TABLE customers
ADD COLUMN status VARCHAR(255);

UPDATE customers c
JOIN orders o
ON c.customerNumber = o.customerNumber
JOIN orderdetails od
ON od.orderNumber = o.orderNumber
JOIN payments p
ON p.customerNumber = c.customerNumber
SET c.status = 'VIP'
WHERE od.quantityOrdered >= 50 OR p.amount > 100000;

SELECT DISTINCT c.customerNumber, c.customerName, c.`status`
FROM customers c
JOIN orders o
ON c.customerNumber = o.customerNumber
JOIN orderdetails od
ON od.orderNumber = o.orderNumber
JOIN payments p
ON p.customerNumber = c.customerNumber;
