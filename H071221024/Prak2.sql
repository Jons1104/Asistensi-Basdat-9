#1
SELECT customerName, city, country FROM customers WHERE country = 'USA';

#2
SELECT DISTINCT productVendor FROM products;

#3
SELECT customerNumber, checkNumber, paymentDate, amount FROM payments WHERE customerNumber = 124 ORDER BY paymentDate DESC

#4
SELECT productName 'Nama produk', buyPrice 'Harga beli', quantityInStock 'Jumlah dalam stok' FROM products WHERE quantityInStock >= 1000 AND quantityInStock <= 3000 ORDER BY buyPrice ASC LIMIT 5, 10;

#5
SELECT * FROM customers WHERE customerName = "Rovelli Gifts";
SELECT * FROM orders WHERE customerNumber = 278;
