SELECT
	ir.IncidentDate,
	ir.IncidentTypeID,
    -- Get the prior day's number of incidents
	LAG(ir.NumberOfIncidents, 1) OVER (
      	-- Partition by incident type ID
		PARTITION BY ir.IncidentTypeID
      	-- Order by incident date
		ORDER BY ir.IncidentDate
	) AS PriorDayIncidents,
	ir.NumberOfIncidents AS CurrentDayIncidents,
    -- Get the next day's number of incidents
	LEAD(ir.NumberOfIncidents, 1) OVER (
      	-- Partition by incident type ID
		PARTITION BY ir.IncidentTypeID
      	-- Order by incident date
		ORDER BY ir.IncidentDate
	) AS NextDayIncidents
FROM dbo.IncidentRollup ir
WHERE
	ir.IncidentDate >= '2019-07-02'
	AND ir.IncidentDate <= '2019-07-31'
	AND ir.IncidentTypeID IN (1, 2)
ORDER BY
	ir.IncidentTypeID,
	ir.IncidentDate;


SELECT
	ir.IncidentDate,
	ir.IncidentTypeID,
    -- Fill in two periods ago
	LAG(ir.NumberOfIncidents, 2) OVER (
		PARTITION BY ir.IncidentTypeID
		ORDER BY ir.IncidentDate
	) AS Trailing2Day,
    -- Fill in one period ago
	LAG(ir.NumberOfIncidents, 1) OVER (
		PARTITION BY ir.IncidentTypeID
		ORDER BY ir.IncidentDate
	) AS Trailing1Day,
	ir.NumberOfIncidents AS CurrentDayIncidents,
    -- Fill in next period
	LEAD(ir.NumberOfIncidents, 1) OVER (
		PARTITION BY ir.IncidentTypeID
		ORDER BY ir.IncidentDate
	) AS NextDay
FROM dbo.IncidentRollup ir
WHERE
	ir.IncidentDate >= '2019-07-01'
	AND ir.IncidentDate <= '2019-07-31'
	AND ir.IncidentTypeID IN (1, 2)
ORDER BY
	ir.IncidentTypeID,
	ir.IncidentDate;


SELECT
	ir.IncidentDate,
	ir.IncidentTypeID,
    -- Fill in the days since last incident
	DateDIFF(DAY, LAG(ir.IncidentDate, 1) OVER (
		PARTITION BY ir.IncidentTypeID
		ORDER BY ir.IncidentDate
	), ir.IncidentDate) AS DaysSinceLastIncident,
    -- Fill in the days until next incident
	DateDIFF(DAY, ir.IncidentDate, LEAD(ir.IncidentDate, 1) OVER (
		PARTITION BY ir.IncidentTypeID
		ORDER BY ir.IncidentDate
	)) AS DaysUntilNextIncident
FROM dbo.IncidentRollup ir
WHERE
	ir.IncidentDate >= '2019-07-02'
	AND ir.IncidentDate <= '2019-07-31'
	AND ir.IncidentTypeID IN (1, 2)
ORDER BY
	ir.IncidentTypeID,
	ir.IncidentDate;