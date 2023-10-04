USE classicmodels;

-- NO 1 mendapatkan data yang memenuhi kriteria(yang dimaui)
SELECT customerName, city, country 
FROM customers
WHERE country = 'USA';

-- NO 2 menampilkan data unik/tidak ada data yang diambil double 
SELECT DISTINCT productVendor
FROM products ;

-- NO 3 
SELECT* FROM payments
WHERE customernumber = 124
ORDER BY customernumber DESC;

-- NO 4 
SELECT productname 'Nama produk', buyprice 'Harga beli', quantityinstock 'Jumlah dalam stok'
FROM products
WHERE quantityinstock <= '3000' AND quantityinstock >= '1000'
ORDER BY buyprice ASC 
LIMIT 5,10;

-- Tugas tambahan
SELECT* FROM customers 
WHERE country = 'Germany' AND creditLimit = 0
ORDER BY addressLine1 DESC 
LIMIT 3,5;
