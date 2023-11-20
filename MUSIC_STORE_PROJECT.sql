--Senior Most Employee

SELECT title , levels 
FROM employee
ORDER BY levels desc 


--Country with the most Invoices -

SELECT billing_country , COUNT(total) AS Total_Invoice  
FROM invoice
GROUP BY billing_country
ORDER BY Total_Invoice DESC 
LIMIT 3


--Top 3 Valiues of Total Invoices -

SELECT total 
FROM invoice
ORDER BY total DESC
LIMIT 3


--City with the Best Customers -

SELECT billing_city , SUM(total) AS Total_Invoices 
FROM invoice
GROUP BY billing_city
ORDER BY Total_Invoices DESC
LIMIT 1


--Best Customer by Revenue 

SELECT c.customer_id , CONCAT(c.first_name,c.last_name) AS Name , c.country , 
SUM(i.total) AS Total_Revenue
FROM customer c
JOIN invoice i ON
c.customer_id = i.customer_id
GROUP BY c.customer_id
ORDER BY Total_Revenue DESC
LIMIT 1


#

SELECT DISTINCT c.email , c.first_name , c.last_name 
FROM customer c
INNER JOIN invoice inv ON c.customer_id = inv.customer_id
INNER JOIN invoice_line iline ON inv.invoice_id = iline.invoice_id
INNER JOIN track t ON t.track_id = iline.track_id
INNER JOIN genre g ON g.genre_id = t.genre_id
WHERE g.name = 'Rock'
ORDER BY email


--

SELECT ar.name AS Artist_Name , COUNT(t.track_id) AS Total_Count
FROM artist ar
JOIN album al ON al.artist_id = ar.artist_id
JOIN track t ON t.album_id = al.album_id
JOIN genre g ON g.genre_id = t.genre_id
WHERE g.name = 'Rock'
GROUP BY Artist_Name
ORDER BY Total_Count DESC
LIMIT 10 


--

SELECT name , milliseconds 
FROM track
WHERE milliseconds > 
 (SELECT AVG(milliseconds) AS Avg_song_length
 FROM track)
ORDER BY milliseconds DESC 




	

























