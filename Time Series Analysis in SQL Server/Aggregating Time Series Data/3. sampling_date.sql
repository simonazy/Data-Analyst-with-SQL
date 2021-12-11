SELECT
	-- Downsample to a daily grain
    -- Cast CustomerVisitStart as a date
	CAST(dsv.CustomerVisitStart AS DATE) AS Day,
	SUM(dsv.AmenityUseInMinutes) AS AmenityUseInMinutes,
	COUNT(1) AS NumberOfAttendees
FROM dbo.DaySpaVisit dsv
WHERE
	dsv.CustomerVisitStart >= '2020-06-11'
	AND dsv.CustomerVisitStart < '2020-06-23'
GROUP BY
	-- When we use aggregation functions like SUM or COUNT,
    -- we need to GROUP BY the non-aggregated columns
	CAST(dsv.CustomerVisitStart AS DATE)
ORDER BY
	Day;


SELECT
	-- Downsample to a weekly grain
	DATEPART(Week, dsv.CustomerVisitStart) AS Week,
	SUM(dsv.AmenityUseInMinutes) AS AmenityUseInMinutes,
	-- Find the customer with the largest customer ID for that week
	MAX(dsv.CustomerID) AS HighestCustomerID,
	COUNT(1) AS NumberOfAttendees
FROM dbo.DaySpaVisit dsv
WHERE
	dsv.CustomerVisitStart >= '2020-01-01'
	AND dsv.CustomerVisitStart < '2021-01-01'
GROUP BY
	-- When we use aggregation functions like SUM or COUNT,
    -- we need to GROUP BY the non-aggregated columns
	DATEPART(Week, dsv.CustomerVisitStart)
ORDER BY
	Week;

SELECT
	-- Determine the week of the calendar year
	c.CalendarWeekOfYear,
	-- Determine the earliest DATE in this group
    -- This is NOT the DayOfWeek column
	MIN(c.Date) AS FirstDateOfWeek,
	ISNULL(SUM(dsv.AmenityUseInMinutes), 0) AS AmenityUseInMinutes,
	ISNULL(MAX(dsv.CustomerID), 0) AS HighestCustomerID,
	COUNT(dsv.CustomerID) AS NumberOfAttendees
FROM dbo.Calendar c
	LEFT OUTER JOIN dbo.DaySpaVisit dsv
		-- Connect dbo.Calendar with dbo.DaySpaVisit
		-- To join on CustomerVisitStart, we need to turn 
        -- it into a DATE type
		ON c.Date = CAST(dsv.CustomerVisitStart AS DATE)
WHERE
	c.CalendarYear = 2020
GROUP BY
	-- When we use aggregation functions like SUM or COUNT,
    -- we need to GROUP BY the non-aggregated columns
	c.CalendarWeekOfYear
ORDER BY
	c.CalendarWeekOfYear;