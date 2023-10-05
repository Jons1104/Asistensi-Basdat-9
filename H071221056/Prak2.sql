USE classicmodels;

-- NO1
SELECT customername ,  
		city , 
		country 
FROM customers
WHERE country = 'USA'

-- NO2
SELECT DISTINCT  productVendor
FROM products;

-- NO3
SELECT customernumber ,  
		checknumber , 
		paymentdate,
		amount
FROM payments
WHERE customernumber = '124'
ORDER BY  customernumber DESC ;

-- n04
SELECT 
 		productname AS 'Nama produk', 
		buyprice AS ' Harga beli', 
		quantityinstock AS 'Jumlah dalam stok'
FROM products
WHERE quantityinstock >=1000 AND quantityinstock<=3000
ORDER BY buyprice ASC 
LIMIT 5,10;

-- tugas tambahan
SELECT *
FROM orders
WHERE status = 'cancelled' AND orderdate = '2003-11-11';


SELECT *
FROM customers
WHERE customernumber = '496';








	


