-- Let's add a record to the table
INSERT INTO transactions (transaction_date, amount, fee) 
VALUES ('2018-09-24', 5454, '30');

-- Doublecheck the contents
SELECT *
FROM transactions;

-- Calculate the net amount as amount + fee
SELECT transaction_date, (amount + CAST(fee as int)) AS net_amount 
FROM transactions;


-- Specify the correct fixed-length character type
ALTER TABLE professors
ALTER COLUMN university_shortname TYPE CHAR(3);

-- Change the type of firstname
ALTER TABLE professors
ALTER column firstname type varchar(64);

-- Convert the values in firstname to a max. of 16 characters
ALTER TABLE professors 
ALTER COLUMN firstname TYPE varchar(16)
using substring(firstname from 1 for 16) -- Truncate the values before converting its type

-- Disallow NULL values in firstname
ALTER TABLE professors 
ALTER COLUMN firstname SET NOT NULL;

-- Disallow NULL values in lastname
ALTER TABLE professors
ALTER COLUMN lastname set not null