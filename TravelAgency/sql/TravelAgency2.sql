--Query1: Retrieve all customers who have booked a package and order them by name.
SELECT * 
FROM Customers 
WHERE CustomerID IN (SELECT DISTINCT CustomerID FROM Bookings)
ORDER BY Name;

--Query2: Count the total number of bookings made by each customer.
SELECT CustomerID, COUNT(BookingID) AS TotalBookings
FROM Bookings
GROUP BY CustomerID;

--Query3: Calculate the total revenue generated from all bookings.
SELECT SUM(Amount) AS TotalRevenue
FROM Payments;

--Query4: Find the average rating of packages.
SELECT PackageID, AVG(Rating) AS AverageRating
FROM Reviews
GROUP BY PackageID;

--Query5: List customers who have made more than 2 bookings.
SELECT CustomerID, COUNT(BookingID) AS TotalBookings
FROM Bookings
GROUP BY CustomerID
HAVING COUNT(BookingID) > 2;

--Query6: Get a list of bookings along with customer names and package names.
SELECT b.BookingID, c.Name AS CustomerName, p.Name AS PackageName
FROM Bookings b
INNER JOIN Customers c ON b.CustomerID = c.CustomerID
INNER JOIN Packages p ON b.PackageID = p.PackageID;

--Query7: List all customers and their bookings, including customers who have not made any bookings.
SELECT c.Name AS CustomerName, b.BookingID
FROM Customers c
LEFT JOIN Bookings b ON c.CustomerID = b.CustomerID;

--Query8: List all bookings and the corresponding agent names, including bookings without assigned agents
SELECT b.BookingID, a.Name AS AgentName
FROM Bookings b
RIGHT JOIN Agents a ON b.AgentID = a.AgentID;

--Query9: Find customers who have made more bookings than the average number of bookings per customer.
SELECT CustomerID, COUNT(BookingID) AS TotalBookings
FROM Bookings
GROUP BY CustomerID
HAVING COUNT(BookingID) > (
    SELECT AVG(Total) 
    FROM (
        SELECT COUNT(BookingID) AS Total 
        FROM Bookings 
        GROUP BY CustomerID
    ) AS subquery
);

--Query10: List packages that have more reviews than the average number of reviews per package.
SELECT PackageID, COUNT(ReviewID) AS ReviewCount
FROM Reviews
GROUP BY PackageID
HAVING COUNT(ReviewID) > (
    SELECT AVG(ReviewCount) 
    FROM (
        SELECT COUNT(ReviewID) AS ReviewCount 
        FROM Reviews 
        GROUP BY PackageID
    ) AS subquery
);

--Query11: Classify customers based on their total spending into categories: Low, Medium, High.
SELECT CustomerID, 
       SUM(Amount) AS TotalSpent,
       CASE 
           WHEN SUM(Amount) < 500 THEN 'Low'
           WHEN SUM(Amount) BETWEEN 500 AND 1500 THEN 'Medium'
           ELSE 'High'
       END AS SpendingCategory
FROM Payments
GROUP BY CustomerID;

--Query12: Find bookings made in the last 30 days.
SELECT *
FROM Bookings
WHERE BookingDate >= CURRENT_DATE - INTERVAL '30 days';

--Query13: Retrieve customer names with their email addresses formatted in uppercase.
SELECT Name, UPPER(Email) AS UppercaseEmail
FROM Customers;

--Query14: Use a window function to rank customers based on their total spending.
SELECT CustomerID, 
       SUM(Amount) AS TotalSpent,
       RANK() OVER (ORDER BY SUM(Amount) DESC) AS SpendingRank
FROM Payments
GROUP BY CustomerID;

--Query15: Calculate the average price of all packages.
SELECT AVG(Price) AS AveragePackagePrice
FROM Packages;

--Query16: Find packages that have not received any reviews.
SELECT p.PackageID, p.Name
FROM Packages p
LEFT JOIN Reviews r ON p.PackageID = r.PackageID
WHERE r.ReviewID IS NULL;

--Query17: Find customers who have not made any bookings in the last 6 months.
SELECT c.CustomerID, c.Name
FROM Customers c
WHERE c.CustomerID NOT IN (
    SELECT b.CustomerID 
    FROM Bookings b 
    WHERE b.BookingDate >= CURRENT_DATE - INTERVAL '6 months'
);






