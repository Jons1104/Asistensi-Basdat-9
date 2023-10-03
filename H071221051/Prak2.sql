#NO1
SELECT customername, city, country FROM customers
WHERE country = 'usa';

#NO2
SELECT DISTINCT productvendor 
FROM products;

#NO3
SELECT customernumber, checknumber, paymentdate,amount FROM payments
WHERE customernumber = 124
ORDER BY customernumber DESC;

#NO4
SELECT productname AS 'Nama Produk', buyprice AS 'Harga beli', quantityinstock AS 'Jumlah dalam stok' 
FROM products
WHERE quantityinstock >1000 AND quantityinstock <3000
ORDER BY buyprice  
LIMIT 5,10;

#NO5
SELECT customernumber, checknumber, paymentdate, amount 
FROM payments 
ORDER BY amount DESC 
LIMIT 1,1;
