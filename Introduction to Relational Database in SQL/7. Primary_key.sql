-- Rename the organization column to id
ALTER table organizations
Rename column organization TO id;
-- Make id a primary key
ALTER TABLE organizations
ADD constraint organization_pk primary KEY (id);


-- Rename the university_shortname column to id
Alter table universities
Rename column university_shortname to id;
-- Make id a primary key
alter table universities
Add constraint university_pk primary key (id);