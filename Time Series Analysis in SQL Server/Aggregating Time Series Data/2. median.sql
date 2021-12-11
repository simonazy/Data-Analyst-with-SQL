SELECT DISTINCT
	it.IncidentType,
	AVG(CAST(ir.NumberOfIncidents AS DECIMAL(4,2)))
	    OVER(PARTITION BY it.IncidentType) AS MeanNumberOfIncidents,
    --- Fill in the missing value
	PERCENTILE_CONT(0.5)
    	-- Inside our group, order by number of incidents DESC
    	WITHIN GROUP (ORDER BY ir.NumberOfIncidents DESC)
        -- Do this for each IncidentType value
        OVER (PARTITION BY it.IncidentType) AS MedianNumberOfIncidents,
	COUNT(1) OVER (PARTITION BY it.IncidentType) AS NumberOfRows
FROM dbo.IncidentRollup ir
	INNER JOIN dbo.IncidentType it
		ON ir.IncidentTypeID = it.IncidentTypeID
	INNER JOIN dbo.Calendar c
		ON ir.IncidentDate = c.Date
WHERE
	c.CalendarQuarter = 2
	AND c.CalendarYear = 2020;