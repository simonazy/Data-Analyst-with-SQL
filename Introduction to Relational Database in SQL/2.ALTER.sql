-- Add the university_shortname column
ALTER table professors 
ADD COLUMN university_shortname text;
-- Print the contents of this table
SELECT * 
FROM professors

-- Rename the organisation column
ALTER TABLE affiliations
RENAME column organisation TO organization;

-- Rename the organisation column
ALTER TABLE affiliations
RENAME COLUMN organisation TO organization;

-- Delete the university_shortname column
ALTER TABLE affiliations
Drop column university_shortname;


-- Drop the firstname column
ALter table affiliations
DROP column firstname;

-- Drop the lastname column
ALter table affiliations
DROP column lastname;