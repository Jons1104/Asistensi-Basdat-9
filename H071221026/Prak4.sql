USE classicmodels;
DROP DATABASE classicmodels;
-- no.1
SELECT c.customerName AS "Nama Customer", c.country AS "Negara", p.paymentDate AS "Tanggal"
FROM customers c
JOIN payments p ON c.customerNumber = p.customerNumber
WHERE paymentDate>='2005-01-01'
ORDER BY paymentDate ASC;

-- no.2
SELECT DISTINCT c.customerName AS "Nama Customer" , p.productName, l.textDescription
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails d ON o.orderNumber = d.orderNumber
JOIN products p ON d.productCode = p.productCode
JOIN productlines l ON p.productLine = l.productLine
WHERE p.productName = "The Titanic";

-- no.3
ALTER TABLE products 
ADD status VARCHAR(20);

SELECT * FROM orderdetails ORDER BY quantityOrdered DESC;
SELECT * FROM orderdetails;

UPDATE products
SET status = 'best selling'
WHERE productCode = 'S12_4675';

SELECT o.productCode, p.productName, o.quantityOrdered, p.status 
FROM orderdetails o
JOIN products p ON o.productCode = p.productCode
WHERE status = 'best selling' ORDER BY quantityOrdered DESC LIMIT 1;

DESCRIBE orderdetails;
SELECT * FROM orderdetails ORDER BY quantityOrdered DESC;


--- no.4
SELECT o.status, o.customerNumber, c.customerNumber, c.customerName
FROM orders o
JOIN customers c ON o.customerNumber = c.customerNumber
WHERE o.status = 'cancelled';

ALTER TABLE payments DROP FOREIGN KEY payments_ibfk_1;
ALTER TABLE payments ADD FOREIGN KEY (customerNumber) REFERENCES customers (customerNumber) ON DELETE CASCADE;

ALTER TABLE orders DROP FOREIGN KEY orders_ibfk_1;
ALTER TABLE orders ADD FOREIGN KEY (customerNumber) REFERENCES customers (customerNumber) ON DELETE CASCADE;

ALTER TABLE orderdetails DROP FOREIGN KEY orderdetails_ibfk_1;
ALTER TABLE orderdetails ADD FOREIGN KEY (orderNumber) REFERENCES orders (orderNumber) ON DELETE CASCADE;

DELETE c
FROM orders o
JOIN customers c ON o.customerNumber = c.customerNumber
WHERE o.status = 'cancelled';

SELECT c.customerName, o.status
FROM customers c
LEFT JOIN orders o ON c.customerNumber= o.customerNumber

SELECT * FROM products;

--- soal tambahan
SELECT DISTINCT p.productName, o.priceEach, p.MSRP
FROM products p 
JOIN orderdetails o ON p.productCode= o.productCode
WHERE o.priceEach<0.8*p.MSRP;
