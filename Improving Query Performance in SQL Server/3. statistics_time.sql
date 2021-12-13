SET STATISTICS TIME ON -- Turn the time command on

-- Query 1
SELECT * 
FROM Teams
-- Sub-query 1
WHERE City IN -- Sub-query filter operator
      (SELECT CityName 
       FROM Cities) -- Table from Earthquakes database
-- Sub-query 2
   AND City IN -- Sub-query filter operator
	   (SELECT CityName 
	    FROM Cities
		WHERE CountryCode IN ('US','CA'))
-- Sub-query 3
    AND City IN -- Sub-query filter operator
        (SELECT CityName 
         FROM Cities
	     WHERE Pop2017 >2000000);


SET STATISTICS TIME OFF -- Turn the time command off


SET STATISTICS IO ON -- Turn the IO command on

-- Example 1
SELECT CustomerID,
       CompanyName,
       (SELECT COUNT(*) 
	    FROM Orders AS o -- Add table
		WHERE c.CustomerID = o.CustomerID) CountOrders
FROM Customers AS c
WHERE CustomerID IN -- Add filter operator
       (SELECT CustomerID 
	    FROM Orders 
		WHERE ShipCity IN
            ('Berlin','Bern','Bruxelles','Helsinki',
			'Lisboa','Madrid','Paris','London'));

-- Example 2
SELECT c.CustomerID,
       c.CompanyName,
       COUNT(o.CustomerID)
FROM Customers AS c
INNER JOIN Orders AS o -- Join operator
    ON c.CustomerID = o.CustomerID
WHERE o.ShipCity IN -- Shipping destination column
     ('Berlin','Bern','Bruxelles','Helsinki',
	 'Lisboa','Madrid','Paris','London')
GROUP BY c.CustomerID,
         c.CompanyName;

SET STATISTICS IO OFF -- Turn the IO command off