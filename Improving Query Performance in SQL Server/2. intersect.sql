SELECT Capital
FROM Nations -- Table with capital cities

INTERSECT -- Add the operator to compare the two queries

SELECT NearestPop -- Add the city name column
FROM Earthquakes;


SELECT Code2 -- Add the country code column
FROM Nations

EXCEPT -- Add the operator to compare the two queries

SELECT Country 
FROM Earthquakes; -- Table with capital cities


SELECT CountryName 
FROM Nations -- Table from Earthquakes database

INTERSECT -- Operator for the intersect between tables

SELECT Country
FROM Players; -- Table from NBA Season 2017-2018 database