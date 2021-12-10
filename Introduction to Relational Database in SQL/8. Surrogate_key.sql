ALTER TABLE table_name 
ADD COLUMN column_name type;

-- Natural
-- Add the new column to the table
ALTER TABLE professors 
ADD column id serial;  -- a spcial data type: serial


-- Add the new column to the table
ALTER TABLE professors 
ADD COLUMN id serial;
-- Make id a primary key
ALTER TABLE professors 
ADD CONSTRAINT professors_pkey  primary key (id);


-- Human Made
-- Count the number of distinct rows with columns make, model
SELECT COUNT(DISTINCT(make, model)) 
FROM cars;
-- Add the id column
ALTER TABLE cars
ADD COLUMN id varchar(128);
-- Update id with make + model
UPDATE cars
SET id = concat(make, model);
-- Make id a primary key
ALTER TABLE cars
add constraint id_pk primary key (id);
-- Have a look at the table
SELECT * FROM cars;


-- Create the table
Create table students (
  last_name varchar(128) NOT null,
  ssn integer primary key,  --integer!!!
  phone_no char(12)
);




