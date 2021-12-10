
-- Calculate the length of the description column
SELECT 
  len (description) AS description_length 
FROM 
  grid;

-- Select the first 25 characters from the left of the description column
SELECT 
  left(description, 25) AS first_25_left 
FROM 
  grid;

-- Amend the query to select 25 characters from the  right of the description column
SELECT 
  right(description, 25) AS last_25_right 
FROM 
  grid;

-- Complete the query to find `Weather` within the description column
SELECT 
  description, 
  CHARINDEX('Weather', description) 
FROM 
  grid
WHERE description LIKE '%Weather%';

-- Complete the query to find the length of `Weather'
SELECT 
  description, 
  CHARINDEX('Weather', description) AS start_of_string,
  len('Weather') AS length_of_string 
FROM 
  grid
WHERE description LIKE '%Weather%'; 

-- Complete the substring function to begin extracting from the correct character in the description column
SELECT TOP (10)
  description, 
  CHARINDEX('Weather', description) AS start_of_string, 
  LEN ('Weather') AS length_of_string, 
  SUBSTRING(
    description, 
    15,  -- start from the index of 15 to the total length
    LEN(description)
  ) AS additional_description 
FROM 
  grid
WHERE description LIKE '%Weather%';