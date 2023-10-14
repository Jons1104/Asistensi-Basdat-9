USE classicmodels

#No1
SELECT c.customerName AS 'Nama Customer', c.country AS 'Negara', p.paymentDate AS 'Tanggal'
FROM customers AS c
INNER JOIN payments AS p
ON c.customerNumber = p.customerNumber
WHERE p.paymentDate > '2004-12-31'
ORDER BY paymentDate;

#No2
SELECT DISTINCT c.customerName AS 'Nama Customer', p.productName, p.productDescription AS 'textDescription'
FROM customers AS c 
JOIN orders AS o 
ON c.customerNumber = o.customerNumber 
JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber 
JOIN products AS p
ON od.productCode = p.productCode
WHERE p.productName = 'The Titanic'

#No3
ALTER TABLE products
ADD `status` VARCHAR(20)

SELECT p.productCode, p.productName, od.quantityOrdered, p.`status`
FROM products AS p
JOIN orderdetails AS od
ON od.productCode = p.productCode
ORDER BY quantityOrdered DESC 
LIMIT 1

UPDATE products
SET `status` = 'best selling'
WHERE productCode = 'S12_4675'

#No4
ALTER TABLE orderdetails DROP FOREIGN KEY orderdetails_ibfk_1;
ALTER TABLE orders DROP FOREIGN KEY orders_ibfk_1;
ALTER TABLE payments DROP FOREIGN KEY payments_ibfk_1;

DELETE customers FROM customers
JOIN orders 
ON orders.customerNumber = customers.customerNumber
WHERE orders.`status`= 'cancelled';

SELECT * FROM orders

#No5
SELECT o.orderDate AS 'Tanggal pemesanan', p.productName
FROM orders AS o
JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
JOIN products AS p
ON p.productCode = od.productCode
WHERE productName = '1940 Ford Pickup Truck'
ORDER BY orderDate DESC;








