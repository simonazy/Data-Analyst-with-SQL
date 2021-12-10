/*A Common Table Expression (CTE) is the result set of a query which 
exists temporarily and for use only within the context of a larger query. */

-- Specify the keyowrds to create the CTE
WITH BloodGlucoseRandom (MaxGlucose) 
AS (SELECT MAX(BloodGlucoseRandom) AS MaxGlucose FROM Kidney)

SELECT a.Age, b.MaxGlucose
FROM Kidney a
-- Join the CTE on blood glucose equal to max blood glucose
JOIN BloodGlucoseRandom b
on a.BloodGlucoseRandom = b.MaxGlucose;


-- Create the CTE
WITH BloodPressure 
AS (SELECT max(BloodPressure) as MaxBloodPressure from Kidney)

SELECT *
FROM Kidney a
-- Join the CTE  
join BloodPressure b
on a.BloodPressure = b.MaxBloodPressure