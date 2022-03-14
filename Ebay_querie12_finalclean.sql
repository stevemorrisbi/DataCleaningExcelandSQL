-- Cleansed SalesData --
-- Commenting out columns that will not be needed in querying. Assigning aliases to some columns to simplify column headers.
-- Neccesary columns placed into a temporary table to query off. 
-- Row where item_title = NULL represents a total row and is not a distinct new sale. These rows needed to be removed. 
SELECT 
  --Sales_record_number,
  --Order_number,
  --Buyer_username, 
  --Buyer_name,
  Buyer_Name_Proper AS Buyer, 
  --Buyer_address_1,
  --Buyer_address_2,
  Buyer_city AS City, 
  --Buyer_county,
  --Buyer_postcode,
  Buyer_country AS Country, 
  Item_title, 
  --Quantity,
  Sold_for AS Sold_price, 
  Sale_date --Paid_on_date
  INTO #TempTable
FROM 
  [dbo].[Ebay data SQL 5] 
WHERE 
  Item_title IS NOT NULL;

-- Total number of orders 
SELECT 
  COUNT(Buyer) AS Total_Orders 
FROM 
  #TempTable

-- Total number of orders from the United States
SELECT 
  COUNT(Country) AS Total_Orders_United_States 
FROM 
  #TempTable
WHERE 
  Country = 'United States' 
  
-- Total number of distinct customers
SELECT 
  COUNT(DISTINCT Buyer) AS Distinct_Order_Totals 
FROM 
  #TempTable

-- Total of distinct countries from orders
SELECT 
  COUNT(DISTINCT Country) AS Distinct_Country_Total 
FROM 
  #TempTable

-- Calculating Total number of orders per date 
SELECT 
  Sale_date, 
  COUNT(Sale_date) AS Total_Order_By_Date 
FROM 
  #TempTable
GROUP BY 
  Sale_date 
  
-- Calculating date with most sales
SELECT 
  TOP 1 Sale_date, 
  COUNT(Sale_date) AS Total_Order_By_Date 
FROM 
  #TempTable
GROUP BY 
  Sale_date 
ORDER BY 
  Total_Order_By_Date DESC 
  
-- Coverting Sold_Price from a Float datatype to an Int to be able to make aggregations 
SELECT 
  CONVERT(INT, Sold_price) 
FROM 
  #TempTable
 
--Total Sales by each country rounded to nearest pound
SELECT 
  ROUND(
    SUM(Sold_price), 
    0
  ) AS Total_Sales_In_Pounds, 
  Country 
FROM 
  #TempTable
GROUP BY 
  Country 
  
-- Total sales from the top 3 countries 
SELECT 
  TOP 3 ROUND(
    SUM(Sold_price), 
    0
  ) AS Total_Sales_In_Pounds, 
  Country, 
FROM 
  #TempTable
GROUP BY 
  Country 
ORDER BY 
  Total_Sales_In_Pounds DESC 
  
-- Total sales from top 3 countries with number of orders
SELECT 
  TOP 3 ROUND(
    SUM(Sold_price), 
    0
  ) AS Total_Sales_In_Pounds, 
  COUNT(Buyer) AS Total_Of_Orders, 
  Country 
FROM 
  #TempTable
GROUP BY 
  Country 
ORDER BY 
  Total_Sales_In_Pounds DESC 
  
-- Top 10 customers who have spent the most money
SELECT 
  TOP 10 ROUND(
    MAX(Sold_price), 
    0
  ) AS Max_Item_In_Pounds, 
  Buyer, 
  Country 
FROM 
  #TempTable
GROUP BY 
  Country, 
  Buyer 
ORDER BY 
  Max_Item_In_Pounds DESC 
  
-- Average item sold for price by country
SELECT 
  ROUND(
    AVG(Sold_price), 
    0
  ) AS Avg_Item_In_Pounds, 
  COUNT(Buyer) AS Total_Of_Orders, 
  Country 
FROM 
  #TempTable
GROUP BY 
  Country 
ORDER BY 
  Avg_Item_In_Pounds DESC 
  
-- Minimum item sold for price
SELECT 
  TOP 5 ROUND(
    MIN(Sold_price), 
    0
  ) AS Min_Item_In_Pounds, 
  Country 
FROM 
  #TempTable
GROUP BY 
  Country 
ORDER BY 
  Min_Item_In_Pounds 
  
-- Maximum item sold for price 
SELECT 
  TOP 5 ROUND(
    MAX(Sold_price), 
    0
  ) AS Max_Item_In_Pounds, 
  Country 
FROM 
  #TempTable
GROUP BY 
  Country 
ORDER BY 
  Max_Item_In_Pounds DESC 
  
-- Calculating date with most sales in pounds
SELECT 
  TOP 1 Sale_date, 
  SUM(Sold_price) AS Total_Sales_By_Date 
FROM 
  #TempTable
GROUP BY 
  Sale_date 
ORDER BY 
  Total_Sales_By_Date DESC 
  
-- Top 10 items sold for the most money without private listings
SELECT 
  TOP 10 ROUND(
    MAX(Sold_price), 
    0
  ) AS Max_Item_In_Pounds, 
  Item_title 
FROM 
  #TempTable
WHERE 
  Item_title NOT LIKE 'Private%' 
GROUP BY 
  Country, 
  Item_title 
ORDER BY 
  Max_Item_In_Pounds DESC 

-- Number of orders over 20 pounds
SELECT 
  COUNT(Buyer) AS Total_Over_20_Pounds 
FROM 
  #TempTable
WHERE 
  Sold_price > 20.0 
  
-- Total Number of orders over 5 by Country
SELECT 
  COUNT(Sold_Price) AS Total_Orders_By_Country, 
  Country 
FROM 
  #TempTable
GROUP BY 
  Country 
HAVING 
  COUNT(Sold_Price) > 5 
ORDER BY 
  Total_Orders_By_Country DESC;

-- Creating a new temp table for 'Arsenal' related sales
SELECT 
  * INTO #TempTableArsenal
FROM 
  #TempTable
WHERE 
  Item_title LIKE '%Arsenal%' 
  
-- calculating the sum of all 'Arsenal' related sales
SELECT 
  SUM(Sold_price) AS Total_Arsenal_Sales_Pounds 
FROM 
  #TempTableArsenal
