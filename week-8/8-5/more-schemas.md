###One-to-one relationship
![Here's my schema](https://github.com/JonClayton/phase-0/blob/master/week-8/8-5/imgs/One-to-one.png "Jon's 1-to-1 schema")
This is a one-to-one relationship if we assume the legal regime does not permit polygamy or polyandry.  One might want to hold it in two tables so there aren't lots of null values in the table for people without spouses.

###Grocery list
![Here's my schema](https://github.com/JonClayton/phase-0/blob/master/week-8/8-5/imgs/Grocery_lists.png "Jon's grocery list schema")

###Reflection
####What is a one-to-one database?
Honestly a one-to-one database is when a single table is split into two tables, since they can be connected by the same primary key, since each line item is connected to only one (or zero!) on the other table.

####When would you use a one-to-one database? (Think generally, not in terms of the example you created).
You would use it when there is a field that has other fields that will be empty if it is empty.  Rather than have all the repeated empty values in the main table, the main table contains only one of the fields and then the secondary table has the additional fields for each line of data for which the set of fields are not all empty.

####What is a many-to-many database?
A mess! Just kidding.  A many-to-many database is one that allows us to connect together two data tables.  Each line of data in the first table can be associated with more than one line of data in the second table, and each line of data in the second table can be associated with more the one line of data in the first table.  The connection is made through a complicated intermediary page that tracks every combination of primary keys of the other tables where there is an association.

####When would you use a many-to-many database? (Think generally, not in terms of the example you created).
I would use a many-to-many database to track information separately from our primary data table because the information involves characteristics that each line of the main table can have more than one of and each characteristic can be associated with more than one line of the main table.  This is better done my examples.  It could be people and states they have visited.  It could be pets and vaccinations they have had.  It could be car models and tires they can use.  And so on.....

####What is confusing about database schemas? What makes sense?
It's all fine. I've seen them before in Access, though with a different name. I recall that sometime it got messy understanding which connections are which type, though it seems simple now.
