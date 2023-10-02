USE classicmodels ;

/*NO 1*/
SELECT customerNumber, city, country FROM customers WHERE country = 'USA';

/*NO 2*/
SELECT DISTINCT productVendor FROM products;

/*NO 3*/
SELECT * FROM payments WHERE customerNumber = '124' ORDER BY paymentDate DESC;

/*NO 4*/
SELECT productName 'Nama produk', buyPrice 'Harga beli', quantityInStock 'Jumlah dalam stok'
FROM products
WHERE quantityInStock >=1000 AND quantityInStock <=3000
ORDER BY buyPrice ASC 
LIMIT 5, 10;

/*NO 5*/
SELECT productCode 'kode produk', productName 'nama produk', MSRP 'harga eceran', productLine 'lini product'
FROM products
WHERE productName = '2002 Suzuki XREO' ;
