
-- Select the first 5 rows from the specified columns
SELECT top (5) description, event_date 
FROM grid 
 -- Order your results by the event_date column
order by event_date;

-- Select the top 20 rows from description, nerc_region and event_date
SELECT TOP (20) description, nerc_region, event_date
FROM grid 
-- Order by nerc_region, affected_customers & event_date
-- Event_date should be in descending order
ORDER BY nerc_region, affected_customers, event_date desc;