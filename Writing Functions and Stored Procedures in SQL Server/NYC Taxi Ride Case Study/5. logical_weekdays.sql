SELECT
    -- Select the pickup day of week
	DATENAME(weekday, PickupDate) as DayofWeek,
    -- Calculate TotalAmount per TripDistance
	CAST(AVG(TotalAmount/
            -- Select TripDistance if it's more than 0
			CASE WHEN TripDistance > 0 THEN TripDistance
                 -- Use GetTripDistanceHotDeck()
     			 ELSE dbo.GetTripDistanceHotDeck() END) as decimal(10,2)) as 'AvgFare'
FROM YellowTripData
GROUP BY DATENAME(weekday, PickupDate)
-- Order by the PickupDate day of week
ORDER BY
     CASE WHEN DATENAME(weekday, PickupDate) = 'Monday' THEN 1
          WHEN DATENAME(weekday, PickupDate) = 'Tuesday' THEN 2
          WHEN DATENAME(weekday, PickupDate) = 'Wednesday' THEN 3
          WHEN DATENAME(weekday, PickupDate) = 'Thursday' THEN 4
          WHEN DATENAME(weekday, PickupDate) = 'Friday' THEN 5
          WHEN DATENAME(weekday, PickupDate) = 'Saturday' THEN 6
          WHEN DATENAME(weekday, PickupDate) = 'Sunday' THEN 7
END ASC;