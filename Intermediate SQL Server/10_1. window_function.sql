-- Write a T-SQL query that returns the sum of OrderPrice by creating partitions for each TerritoryName.
SELECT OrderID, TerritoryName, 
       -- Total price for each partition
       Sum(OrderPrice) 
       -- Create the window and partitions
       Over(Partition by TerritoryName) AS TotalPrice
FROM Orders

SELECT OrderID, TerritoryName, 
       -- Number of rows per partition
       Count(*)
       -- Create the window and partitions
       OVER(partition by TerritoryName) AS TotalOrders
FROM Orders



