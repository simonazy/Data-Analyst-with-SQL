-- Select description and event_year
SELECT 
  description, 
  event_year 
FROM 
  grid 
  -- Filter the results
where description = 'Vandalism'; 

-- Select nerc_region and demand_loss_mw
SELECT 
nerc_region, 
demand_loss_mw 
FROM 
  grid 
-- Retrieve rows where affected_customers is >= 500000  (500,000)
where 
affected_customers >= 500000;


-- Select description and affected customers
SELECT 
  description, 
  affected_customers,
  event_date 
FROM 
  grid 
  -- Retrieve rows where the event_date was the 22nd December, 2013    
WHERE 
  event_date = '2013-12-22';


-- Select description, affected_customers and event date
SELECT 
  description, 
  affected_customers,
  event_date
FROM 
  grid 
  -- The affected_customers column should be >= 50000 and <=150000   
WHERE 
  affected_customers BETWEEN 50000 AND 150000 
   -- Define the order   
order by 
  event_date desc;


-- Retrieve all columns
SELECT * 
FROM 
  grid 
  -- Return only rows where demand_loss_mw is missing or unknown  
WHERE 
  demand_loss_mw is NULL;


-- Retrieve all columns
SELECT 
  * 
FROM 
  grid 
  -- Return rows where demand_loss_mw is not missing or unknown   
WHERE 
  demand_loss_mw IS NOT NULL;


SELECT 
  song, 
  artist, 
  release_year
FROM 
  songlist 
WHERE 
  -- Retrieve records greater than and including 1980 -- Also retrieve records up to and including 1990
  release_year >= 1980 and release_year <= 1990
ORDER BY 
  artist, 
  release_year;

SELECT 
  song, 
  artist, 
  release_year
FROM 
  songlist 
WHERE 
  -- Retrieve records greater than and including 1980
  release_year >= 1980 
  -- Replace AND with OR
  OR release_year <= 1990 
ORDER BY 
  artist, 
  release_year;

SELECT artist, release_year, song 
FROM 
songlist 
  -- Choose the correct artist and specify the release year
WHERE 
  (
    artist LIKE 'B%' and release_year = 1986
  ) 
  -- Or return all songs released after 1990
  or release_year > 1990 
  -- Order the results
ORDER BY 
  release_year, 
  artist, 
  song;