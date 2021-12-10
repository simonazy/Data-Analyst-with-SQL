-- Declare the variable @region, and specify the data type of the variable
Declare @region as Varchar(10)

-- Declare the variable @region
DECLARE @region as VARCHAR(10)
-- Update the variable value
set @region='RFC'

-- Declare the variable @region
DECLARE @region VARCHAR(10)

-- Update the variable value
SET @region = 'RFC'

SELECT description,
       nerc_region,
       demand_loss_mw,
       affected_customers
FROM grid
WHERE nerc_region = @region;


-- Declare @start
Declare @start DATE
-- SET @start to '2014-01-24'
Set @start = '2014-01-24'

-- Declare @start
DECLARE @start DATE
-- Declare @stop
Declare @stop DATE

-- SET @start to '2014-01-24'
SET @start = '2014-01-24'
-- SET @stop to '2014-07-02'
Set @stop ='2014-07-02'


-- Declare your variables
DECLARE @start DATE
DECLARE @stop DATE
DECLARE @affected INT;
-- SET the relevant values for each variable
SET @start = '2014-01-24'
SET @stop  = '2014-07-02'
SET @affected =  5000 ;

SELECT 
  description,
  nerc_region,
  demand_loss_mw,
  affected_customers
FROM 
  grid
-- Specify the date range of the event_date and the value for @affected
WHERE event_date BETWEEN @start AND @stop
AND affected_customers >= @affected;
