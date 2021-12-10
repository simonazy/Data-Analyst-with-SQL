-- Round Cost to the nearest dollar
SELECT Cost, 
       Round(Cost,0) AS RoundedCost
FROM Shipments

-- Truncate cost to whole number
SELECT Cost, 
       ROUND(Cost,0,1) AS TruncateCost
FROM Shipments


-- Return the absolute value of DeliveryWeight
SELECT DeliveryWeight,
       ABS(DeliveryWeight) AS AbsoluteValue
FROM Shipments

-- Return the square and square root of WeightValue
SELECT WeightValue, 
       SQUARE(WeightValue) AS WeightSquare, 
       SQRT(WeightValue) AS WeightSqrt
FROM Shipments
