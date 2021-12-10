-- Return the difference in OrderDate and ShipDate
SELECT OrderDate, ShipDate, 
       DateDIFF(day, OrderDate, ShipDate) AS Duration
FROM Shipments


-- Return the DeliveryDate as 5 days after the ShipDate
SELECT OrderDate, 
       DATEADD(DD, 5, ShipDate ) AS DeliveryDate
FROM Shipments

SELECT YEAR('2017/08/25') AS Year;

-- Return the current database system date and time:
SELECT GETDATE();


