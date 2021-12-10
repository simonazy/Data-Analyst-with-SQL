-- Select the region column
SELECT 
  nerc_region,
  -- Sum the demand_loss_mw column
  SUM(demand_loss_mw) AS demand_loss
FROM 
  grid
  -- Exclude NULL values of demand_loss
WHERE 
  demand_loss_mw is not null
  -- Group the results by nerc_region
group by 
  nerc_region
  -- Order the results in descending order of demand_loss
ORDER BY 
  demand_loss desc;

SELECT 
  nerc_region, 
  SUM (demand_loss_mw) AS demand_loss 
FROM 
  grid 
  -- Remove the WHERE clause
WHERE demand_loss_mw  IS NOT NULL
GROUP BY 
  nerc_region 
  -- Enter a new HAVING clause so that the sum of demand_loss_mw is greater than 10000
having 
  SUM(demand_loss_mw) > 10000  -- An aggregate may not appear in the WHERE clause unless it is in a subquery contained in a HAVING clause or a select list
ORDER BY 
  demand_loss DESC;


-- Retrieve the minimum and maximum place values
SELECT 
  -- the lower the value the higher the place, so MIN = the highest placing
  MIN(place) AS hi_place, 
  MAX(place) AS lo_place,  
  -- Retrieve the minimum and maximum points values
  MIN(points) AS min_points, 
  MAX(points) AS max_points 
FROM 
  eurovision
  -- Group by country
group by
  country;

-- Obtain a count for each country
SELECT 
  count(country) AS country_count, 
  -- Retrieve the country column
  country, 
  -- Return the average of the Place column 
  avg(place) AS average_place, 
  AVG(points) AS avg_points, 
  MIN(points) AS min_points, 
  MAX(points) AS max_points 
FROM 
  eurovision 
GROUP BY 
  country;

SELECT 
  country, 
  COUNT (country) AS country_count, 
  AVG (place) AS avg_place, 
  AVG (points) AS avg_points, 
  MIN (points) AS min_points, 
  MAX (points) AS max_points 
FROM 
  eurovision 
GROUP BY 
  country 
  -- The country column should only contain those with a count greater than 5
having
  count(country) > 5 
  -- Arrange columns in the correct order
ORDER BY 
  avg_place, 
  avg_points desc;