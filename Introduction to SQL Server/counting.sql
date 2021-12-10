-- Sum the demand_loss_mw column
SELECT 
  sum(demand_loss_mw) AS MRO_demand_loss 
FROM 
  grid 
WHERE
  -- demand_loss_mw should not contain NULL values
  demand_loss_mw is NOT NULL 
  -- and nerc_region should be 'MRO';
  and nerc_region = 'MRO';

-- Obtain a count of 'grid_id'
SELECT 
  count(grid_id) as grid_total
FROM 
  grid;

-- Obtain a count of 'grid_id'
SELECT 
  COUNT(grid_id) AS RFC_count
FROM 
  grid
-- Restrict to rows where the nerc_region is 'RFC'
where
  nerc_region = 'RFC';

-- Find the minimum number of affected customers
SELECT 
  min(affected_customers) AS  min_affected_customers
FROM 
  grid
-- Only retrieve rows where demand_loss_mw has a value
WHERE
  demand_loss_mw is not NULL;


-- Find the maximum number of affected customers
SELECT 
  MAX(affected_customers) AS max_affected_customers 
FROM 
  grid
-- Only retrieve rows where demand_loss_mw has a value
WHERE 
  demand_loss_mw IS NOT NULL;

