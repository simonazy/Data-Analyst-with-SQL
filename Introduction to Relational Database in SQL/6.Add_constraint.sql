-- Add a unique constraint to an existing table
ALTER TABLE table_name
ADD CONSTRAINT some_name UNIQUE(column_name);

-- Make universities.university_shortname unique
ALTER table universities
ADD constraint university_shortname_unq UNIQUE(university_shortname);

-- Make organizations.organization unique
ALTER table organizations 
add constraint organization_unq unique(organization)

-- Try out different combinations
select COUNT(distinct(firstname, lastname)) 
FROM professors;