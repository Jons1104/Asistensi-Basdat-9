USE classicmodels;

DESCRIBE customers;
#1
SELECT customerName, city, country FROM customers WHERE country = 'USA';

#2
SELECT DISTINCT productVendor FROM products;

#3
SELECT customerNumber, checkNumber, paymentDate, amount FROM payments WHERE customerNumber = 124 ORDER BY paymentDate DESC;

#4
SELECT productName AS 'Nama produk', buyPrice AS 'Harga beli', quantityInStock AS 'Jumlah dalam stok' FROM products WHERE quantityInStock >=1000 AND quantityInStock <=3000 
ORDER BY buyPrice ASC 
LIMIT 5,10;

#5
SELECT orderNumber AS 'no_order', quantityOrdered AS 'kuantitas order', priceEach AS 'harga', orderLineNumber AS 'nomor baris pesanan' FROM orderdetails
WHERE orderNumber = 10106
ORDER BY priceEach DESC
LIMIT 14,3;


DESCRIBE orderdetails;
