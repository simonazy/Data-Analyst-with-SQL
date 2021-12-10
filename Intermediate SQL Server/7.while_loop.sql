-- Declare the variable (a SQL Command, the var name, the datatype)
DECLARE @counter INT 

-- Set the counter to 20
SET @counter = 20

-- Select and increment the counter by one 
Set @counter += 1

-- Print the variable
SELECT @counter



DECLARE @counter INT 
SET @counter = 20
-- Create a loop
while @counter<30

-- Loop code starting point
Begin
	SET @counter = @counter + 1
-- Loop finish
End

-- Check the value of the variable
SELECT @counter