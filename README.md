# Excel and SQL Project
### Overview: Working in Excel to clean sales data and using SQL to derive insights from the data. 
Note - As this a a public repositorie, all data has had to be redacted to ensure confidentiality. 

### Steps taken to clean the data in Excel:
* NULLS for non distinct entries aside from 'order number' and 'user i.d'. NULL data needed to be replaced.
* Removal unnessary columns before importing into SQL.
* Use of the Proper function to ensure unifrom casing for all columns.
* Replacement of diacritics to standard English characters.
* Removal of £ symbol in currency columns - changing the format to a general.

![Excel data cleaning blur](https://user-images.githubusercontent.com/99413257/158142532-2c4e3b0a-33b1-43ce-9bd1-fcafd699dab1.jpg)

----

### Steps taken to derive insights in SQL:
A commented SQL script can be found in this repository.

It displays the uses cases for -

SELECT, WHERE, Aliases, SUM, MIN, MAX, AVG, HAVING, COUNT, GROUP BY, ORDER BY, TempTables, DISTINCT, NOT NULL, LIKE and Wildcards.  
