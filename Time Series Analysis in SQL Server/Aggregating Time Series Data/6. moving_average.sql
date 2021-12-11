-- we need to use the AVG() function to calculate the mean
-- Moving average requires the ROWS clause and ranges from 6 preceding until the current row.
SELECT
	ir.IncidentDate,
	ir.IncidentTypeID,
	ir.NumberOfIncidents,
    -- Fill in the correct window function
	AVG(ir.NumberOfIncidents) OVER (
		PARTITION BY ir.IncidentTypeID
		ORDER BY ir.IncidentDate
      	-- Fill in the three parts of the window frame
		ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
	) AS MeanNumberOfIncidents
FROM dbo.IncidentRollup ir
	INNER JOIN dbo.Calendar c
		ON ir.IncidentDate = c.Date
WHERE
	c.CalendarYear = 2019
	AND c.CalendarMonth IN (7, 8)
	AND ir.IncidentTypeID = 1
ORDER BY
	ir.IncidentTypeID,
	ir.IncidentDate;