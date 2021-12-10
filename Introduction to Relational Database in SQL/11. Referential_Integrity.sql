/*Foreign keys join tables and establish dependencies between tables.
Tables can form a hierarchy of dependencies in such a way that if you
change or delete a row in one table, you destroy the meaning of rows in other tables. */

/* For instance, a typical foreign key constraint might state that every employee in the EMPLOYEE table 
must be a member of an existing department, as defined in the DEPARTMENT table.*/

/*By default, the database server does not allow you to violate referential integrity and gives 
you an error message if you attempt to delete rows from the parent table before you delete rows 
from the child table.*/

/* Unless you use the  ON DELETE CASCADE option to cause deletes from a parent table to trip deletes on child tables.*/

-- Identify the correct constraint name
SELECT constraint_name, table_name, constraint_type
FROM information_schema.table_constraints
WHERE constraint_type = 'FOREIGN KEY';

-- Drop the right foreign key constraint
ALTER TABLE affiliations
DROP CONSTRAINT affiliations_organization_id_fkey;

-- Add a new foreign key constraint from affiliations to organizations which cascades deletion
ALTER TABLE affiliations
ADD CONSTRAINT affiliations_organization_id_fkey foreign KEY (organization_id) REFERENCES organizations (id) ON DELETE CASCADE;

-- Delete an organization 
DELETE FROM organizations 
WHERE id = 'CUREM';

-- Check that no more affiliations with this organization exist
SELECT * FROM affiliations
WHERE organization_id = 'CUREM';

-- result: None