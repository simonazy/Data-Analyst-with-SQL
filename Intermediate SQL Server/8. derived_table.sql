SELECT a.RecordId, a.Age, a.BloodGlucoseRandom, 
-- Select maximum glucose value (use colname from derived table)    
       b.MaxGlucose
FROM Kidney a
-- Join to derived table
Join (SELECT Age, MAX(BloodGlucoseRandom) AS MaxGlucose FROM Kidney GROUP BY Age) b
-- Join on Age
ON a.Age = b.Age

SELECT *
FROM Kidney a
-- Create derived table: select age, max blood pressure from kidney grouped by age
JOIN (SELECT Age, MAX(BloodPressure) as MaxBloodPressure from kidney group by Age) b
-- JOIN on BloodPressure equal to MaxBloodPressure
ON a.BloodPressure=b.MaxBloodPressure
-- Join on Age
AND a.Age=b.Age;

