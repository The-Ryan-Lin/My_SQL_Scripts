/**The total spend per country

SELECT "Country", SUM("Total_Sales") AS Total_Sales, COUNT("Total_Sales") AS Total_Count
FROM marketing_data
GROUP BY "Country"
Order BY "Country" ASC;
**/


/**The total spend per product per country

SELECT
	"Country",
	SUM ("AmtLiq") AS Total_Liquor,
	SUM ("AmtVege") AS Total_Vegetables,
	SUM ("AmtNonVeg") AS Total_Meat,
	SUM ("AmtPes") AS Total_Fish,
	SUM ("AmtChocolates") AS Total_Chocolates,
	SUM ("AmtComm") AS Total_Commodities,
	SUM("Total_Sales") AS Total_Sales
FROM marketing_data
GROUP BY "Country"
ORDER BY "Country" ASC;

**/


/**Which products are the most popular in each country

SELECT
	"Country",
	MAX("AmtLiq") AS Total_Liquor,
	MAX("AmtVege") AS Total_Vegetables,
	MAX("AmtNonVeg") AS Total_Meat,
	MAX("AmtPes") AS Total_Fish,
	MAX("AmtChocolates") AS Total_Chocolates,
	MAX("AmtComm") AS Total_Commodities,
	SUM("Total_Sales") AS Total_Sales
FROM marketing_data
GROUP BY "Country"
ORDER BY "Country" ASC;

**/


/**Which products are the most popular based on marital status

SELECT
	"Marital_Status",
	SUM ("AmtLiq") AS Total_Liquor,
	SUM ("AmtVege") AS Total_Vegetables,
	SUM ("AmtNonVeg") AS Total_Meat,
	SUM ("AmtPes") AS Total_Fish,
	SUM ("AmtChocolates") AS Total_Chocolates,
	SUM ("AmtComm") AS Total_Commodities,
	SUM("Total_Sales") AS Total_Sales
FROM marketing_data
GROUP BY "Marital_Status"
ORDER BY "Marital_Status" ASC;

**/

/**Which products are the most popular based on whether or not there are children or teens in the home.

--No children or teens in the home

SELECT COUNT("Kidhome") AS Kidhome_Count, 
	COUNT("Teenhome") AS Teenhome_Count,
	SUM ("AmtLiq") AS Total_Liquor,
	SUM ("AmtVege") AS Total_Vegetables,
	SUM ("AmtNonVeg") AS Total_Meat,
	SUM ("AmtPes") AS Total_Fish,
	SUM ("AmtChocolates") AS Total_Chocolates,
	SUM ("AmtComm") AS Total_Commodities
FROM marketing_data
WHERE "Kidhome" = 0 and "Teenhome" = 0

-- Children or teens in the home

SELECT COUNT("Kidhome") AS Kidhome_Count, 
	COUNT("Teenhome") AS Teenhome_Count,
	SUM ("AmtLiq") AS Total_Liquor,
	SUM ("AmtVege") AS Total_Vegetables,
	SUM ("AmtNonVeg") AS Total_Meat,
	SUM ("AmtPes") AS Total_Fish,
	SUM ("AmtChocolates") AS Total_Chocolates,
	SUM ("AmtComm") AS Total_Commodities
FROM marketing_data
WHERE "Kidhome" >=1 or "Teenhome" >=1

**/