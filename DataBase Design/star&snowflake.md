# Star Schema
![image](https://user-images.githubusercontent.com/56880104/145864710-6b0b32d4-749a-4a30-bbd6-9bea0b3388d3.png)

![image](https://user-images.githubusercontent.com/56880104/145864904-550a3f5b-d404-4bfd-b599-a39702cd8be3.png)

# Normalization

Identify repeating groups of data and create new tables for them

+ Database design technique
+ Divide tables into smaller tables and connects them via relationships
+ Goal: reduce redundancy and increase data integrity 

 ## Why normalization?
 + save spaces
 + better data integrity

### 1NF rules
+ Each record must be unique - no duplicate rows 
+ Each cell must hold one value 

### 2NF 
+ Must satisfy 1NF
+ If primary key is one column, then automatically satisfies 2NF
+ If there is a composite primary key, then each non-key column must be dependent on all the keys

### 3NF
+ Must satisfy 2NF 
+ No transitive dependencies: non-key columns cannot depend on other non-key columns 
