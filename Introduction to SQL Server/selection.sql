-- SELECT the country column FROM the eurovision table
SELECT country from eurovision;

-- Select the points column
SELECT points FROM eurovision;

-- Limit the number of rows returned
SELECT top (50) points FROM eurovision;

-- Return unique countries and use an alias
SELECT distinct country as unique_country FROM eurovision;

-- Select country and event_year from eurovision
Select country, event_year from eurovision;

-- Amend the code to select all columns
SELECT * FROM eurovision;

-- Return all columns, restricting the percent of rows returned
SELECT top (50) PERCENT * FROM eurovision;


