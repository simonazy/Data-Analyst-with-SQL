-- Create the stored procedure
CREATE PROCEDURE dbo.cuspImputeTripDistanceMean
AS
BEGIN
-- Specify @AvgTripDistance variable
DECLARE @AvgTripDistance AS numeric (18,4)

-- Calculate the average trip distance
SELECT @AvgTripDistance = AVG(TripDistance) 
FROM YellowTripData
-- Only include trip distances greater than 0
WHERE TripDistance > 0

-- Update the records where trip distance is 0
UPDATE YellowTripData
SET TripDistance =  @AvgTripDistance
WHERE TripDistance = 0
END;

-- Create the function
CREATE FUNCTION dbo.GetTripDistanceHotDeck()
-- Specify return data type
RETURNS numeric(18,4)
AS 
BEGIN
RETURN
	-- Select the first TripDistance value
	(SELECT TOP 1 TripDistance
	FROM YellowTripData
    -- Sample 1000 records
	TABLESAMPLE(1000 rows)
    -- Only include records where TripDistance is > 0
	WHERE TripDistance > 0)
END;