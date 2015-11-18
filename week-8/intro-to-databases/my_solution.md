# Introduction to Databases

#### I worked on this challenge by myself.
#### This challenge took me 1 hours.

## SQL Queries

Paste the correct SQL queries for each of the following:

1. Select all data for all states:  SELECT * FROM states;
2. Select all data for the regions: SELECT * FROM regions;
3. Select the `state_name` and `population` for all states: SELECT state_name, population FROM states;
4. Select the `state_name` and `population` for all states ordered by population. The most populous state should be at the top: SELECT state_name, population FROM states ORDER BY population DESC;
5. Select the 'state_name's for the states in region 7: SELECT state_name FROM states WHERE region_id = 7;
6. Select the 'state_names' and 'population_density' with a population density over 50 ordered from least to most dense: SELECT state_name, population_density FROM states where population_density >50 ORDER BY population_density ASC;
7. Select all state_names for states with a population between 1 million and 1.5 million people: SELECT state_name FROM states WHERE population BETWEEN 1000000 AND 1500000;
8. Select all state_names and region_id ordered by region in ascending order: SELECT state_name, region_id FROM states ORDER BY region_id ASC; 
9. Select the 'region_name' for the regions with "Central" in the name: SELECT region_name FROM regions WHERE region_name LIKE '%Central%';
10. Select all of the region names and the state names in ascending order by regional id: SELECT region_name, state_name FROM states JOIN regions ON states.region_id=regions.id ORDER BY region_id;

## `persons` and `outfits` Schema
![Here's my schema](https://github.com/JonClayton/phase-0/blob/master/week-8/intro-to-databases/Schema.png "Jon's first schema")

## Reflection
####What are databases for?
Databases store data in a format that makes it convenient to do the typical CRUD actions with respect to the data (Create, Read, Update, Delete).  Relational databases can be quite powerful and efficient by reducing repetitiveness within the data and allowing access to the data with various tools.

####What is a one-to-many relationship?
A situation where many items in a database share the same characteristic  Putting aside unusual cases, gender is a one-to-many relationship among mammals.

####What is a primary key? What is a foreign key? How can you determine which is which?
The primary key for a table is a field that has a unique value for each line of data. It is often an arbitrary "ID" field in the first column, but it need not be. For example SSN, drivers license number, or passport number might serve as a unigue identifier for some lists of people, as long as every person on the list has one or there is an alternative to use if the person does not have that form of identification.

####How can you select information out of a SQL database? What are some general guidelines for that? 
The command SELECT [data name(s)] FROM [tables] is pretty handy. You can specify which data fields you want, which tables you want to pull it from and with other commands, how those tables are joined, how the data is aggregated, filtered, sorted, grouped, etc.
