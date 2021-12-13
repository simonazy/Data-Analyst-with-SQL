SELECT
	-- PickupDate is after today
	COUNT (CASE WHEN PickupDate > GetDate() THEN 1 END) AS 'FuturePickup',
    -- DropOffDate is after today
	COUNT (CASE WHEN DropOffDate > GetDate() THEN 1 END) AS 'FutureDropOff',
    -- PickupDate is after DropOffDate
	COUNT (CASE WHEN PickupDate > DropOffDate THEN 1 END) AS 'PickupBeforeDropoff',
    -- TripDistance is 0
	COUNT (CASE WHEN TripDistance = 0 THEN 1 END) AS 'ZeroTripDistance'  
FROM YellowTripData;