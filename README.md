# Excel and SQL - Cleaning and Analysis Project
### Overview: Working in Excel to clean sales data and using SQL to derive insights. 
Note - All data in this public respository has been redacted to ensure confidentiality. 

### Steps taken to clean the data in Excel:
* The CSV contained NULLS for non distinct entries aside from 'order number' and 'user i.d'. NULL data needed to be replaced.
* Removal of unnessary columns before importing into SQL.
* Use of the Proper function to ensure unifrom casing for all columns.
* Replacement of diacritics to standard English characters.
* Removal of £ symbol in currency columns - changing the format to general.

![Excel data cleaning blur](https://user-images.githubusercontent.com/99413257/158142532-2c4e3b0a-33b1-43ce-9bd1-fcafd699dab1.jpg)

----

### Steps taken to derive insights in SQL:
A commented SQL script can be found in this repository.

It displays the uses cases for -

SELECT, WHERE, Aliases, SUM, MIN, MAX, AVG, HAVING, COUNT, GROUP BY, ORDER BY, TempTables, DISTINCT, NOT NULL, LIKE and Wildcards.  
