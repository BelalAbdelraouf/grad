use DB_product;
#1. Find the Total Number of Products for Each Category

SELECT category, COUNT(*) AS total_products
FROM products
GROUP BY category
ORDER BY total_products DESC;

#2. Calculate the Average Price of Products in Each Category

SELECT category, AVG(price) AS average_price
FROM products
GROUP BY category
ORDER BY average_price DESC;

#3. List Products that Will Expire Within the Next 6 Months
SELECT product_name, expiration_date
FROM products
WHERE expiration_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 6 MONTH)
ORDER BY expiration_date ASC;

#4. Find the Top 5 Most Expensive Products
SELECT product_name, price, brand
FROM products
ORDER BY price DESC
LIMIT 5;

#5. Calculate the Total Value of Stock for Each Product
 

SELECT product_name, price, quantity_in_stock, (price * quantity_in_stock) AS total_stock_value
FROM products
ORDER BY total_stock_value DESC;

#6. Identify the Products with the Lowest Stock Quantity
 
SELECT product_name, quantity_in_stock
FROM products
ORDER BY quantity_in_stock ASC
LIMIT 10;

#7. Get the Average Weight of Products by Dimension Type

SELECT dimensions, AVG(weight) AS average_weight
FROM products
GROUP BY dimensions
ORDER BY average_weight DESC;

#8. Find Products Released Before a Specific Date (e.g., 2010)
SELECT product_name, release_date
FROM products
WHERE release_date < '2010-01-01'
ORDER BY release_date;

#9. Identify the Top 5 Brands with the Highest Total Stock Value
SELECT brand, SUM(price * quantity_in_stock) AS total_stock_value
FROM products
GROUP BY brand
ORDER BY total_stock_value DESC
LIMIT 5;

#10. Find Categories with More Than 1000 Total Products in Stock
SELECT category, SUM(quantity_in_stock) AS total_quantity
FROM products
GROUP BY category
HAVING total_quantity > 1000
ORDER BY total_quantity DESC;