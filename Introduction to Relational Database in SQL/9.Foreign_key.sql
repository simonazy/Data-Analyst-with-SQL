
-- REFERENCE a table with a FOREIGN KEY
ALTER TABLE a 
ADD CONSTRAINT a_fkey FOREIGN KEY (b_id) REFERENCES b (id);

-- Rename the university_shortname column
ALTER TABLE professors
Rename column university_shortname to university_id;
-- Add a foreign key on professors referencing universities
ALTER TABLE professors
ADD CONSTRAINT professors_fkey FOREIGN KEY (university_id) REFERENCES universities (id);


-- Select all professors working for universities in the city of Zurich
SELECT professors.lastname, universities.id, universities.university_city
from professors
join universities
ON professors.university_id = universities.id
where universities.university_city = 'Zurich';


-- Add foreign keys to the "affiliations" table
-- Add a professor_id column
ALTER table affiliations
Add COLUMN professor_id integer REFERENCES professors (id);

-- Rename the organization column to organization_id
ALTER TABLE affiliations
Rename organization TO organization_id;
-- Add a foreign key on organization_id
ALTER TABLE affiliations
ADD CONSTRAINT affiliations_organization_fkey foreign key (organization_id) REFERENCES organizations (id);