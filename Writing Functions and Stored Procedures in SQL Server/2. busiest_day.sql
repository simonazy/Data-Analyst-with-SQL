SELECT
        DATENAME(weekday, StartDate) as DayofWeek,
        SUM(DATEDIFF(second, StartDate, EndDate))/3600 as TotalTripHours
FROM CapitalBikeShare
-- Group by the day of week
GROUP BY DATENAME(weekday, StartDate)
-- Order TotalTripHours in descending order
ORDER BY TotalTripHours DESC