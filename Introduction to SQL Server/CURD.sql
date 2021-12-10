create Table results(
	track VARCHAR(200),
	artist VARCHAR(120),
	album VARCHAR(160)
);

-- CREATE
-- Create the table
CREATE TABLE results (
	-- Create track column
	track VARCHAR(200),
    -- Create artist column
	artist VARCHAR(120),
    -- Create album column
	album VARCHAR(160),
	-- Create track_length_mins
	track_length_mins INT,
	);

-- Create the table
CREATE TABLE results (
	-- Create track column
	track VARCHAR(200),
    -- Create artist column
	artist VARCHAR(120),
    -- Create album column
	album VARCHAR(160),
	-- Create track_length_mins
	track_length_mins INT,
	);

-- Select all columns from the table
SELECT 
  track, 
  artist, 
  album, 
  track_length_mins 
FROM 
  results;

-- Create the table
CREATE TABLE tracks(
	-- Create track column
	track varchar(200),
    -- Create album column
  	album varchar(160),
	-- Create track_length_mins column
	track_length_mins int
);



-- INSERT
-- Create the table
CREATE TABLE tracks(
  -- Create track column
  track VARCHAR(200), 
  -- Create album column
  album VARCHAR(160), 
  -- Create track_length_mins column
  track_length_mins INT
);
-- Complete the statement to enter the data to the table     
INSERT INTO tracks 
-- Specify the destination columns, optional
(track, album, track_length_mins) 
-- Insert the appropriate values for track, album and track length
VALUES 
  ('Basket Case', 'Dookie', 3);


--UPDATE
-- Run the query
SELECT 
  title 
FROM 
  album 
WHERE 
  album_id = 213;
-- UPDATE the album table
Update 
  album
-- SET the new title    
set 
  title = 'Pure Cult: The Best Of The Cult'
WHERE album_id = 213;

-- Delete
-- Run the query
SELECT 
  * 
FROM 
  album 
  -- DELETE the record
DELETE FROM 
  album 
WHERE 
  album_id = 1 
  -- Run the query again
SELECT 
  * 
FROM 
  album;