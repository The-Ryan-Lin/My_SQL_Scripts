-- Create Tables for the Datasets

CREATE TABLE marketing_data(
	"ID" varchar(10) PRIMARY KEY,
	"Year_Birth" int,
	"Age" numeric(5),
	"Education" character(30),
	"Marital_Status" character(30),
	"Income_USD" money,
	"Kidhome" numeric(5),
	"Teenhome" numeric(5),
	"Registration_Date" Date,
	"Recency" numeric(5),
	"AmtLiq_USD" numeric(10),
	"AmtVege_USD" numeric(10),
	"AmtNonVeg_USD" numeric(10),
	"AmtPes_USD" numeric(10),
	"AmtChocolates_USD" numeric(10),
	"AmtComm_USD" numeric(10),
	"Total_Spend_USD" numeric(10),
	"NumDeals" numeric(5),
	"NumWebBuy" numeric(5),
	"NumWalkinPur" numeric(5),
	"NumVisits" numeric(5),
	"Response" numeric(5),
	"Complain" numeric(5),
	"Country" character(30),
	"Count_success" numeric(5));
	
CREATE TABLE public.ad_data(
	"ID" varchar(10) PRIMARY KEY,
	"Bulkmail_ad" numeric(2),
	"Twitter_ad" numeric(2),
	"Instagram_ad" numeric(2),
	"Facebook_ad" numeric(2),
	"Brochure_ad" numeric(2));
	
-- with weighting columns for product types

CREATE TABLE weight_marketing_data(
	"ID" varchar(10) PRIMARY KEY,
	"Year_Birth" int,
	"Age" numeric(5),
	"Education" character(30),
	"Marital_Status" character(30),
	"Income_USD" money,
	"Kidhome" numeric(5),
	"Teenhome" numeric(5),
	"Registration_Date" Date,
	"Recency" numeric(5),
	"AmtLiq_USD" numeric(10),
	"W_AmtLiq" decimal(4,2),
	"AmtVege_USD" numeric(10),
	"W_AmtVege" decimal(4,2),
	"AmtNonVeg_USD" numeric(10),
	"W_AmtNonVeg" decimal(4,2),
	"AmtPes_USD" numeric(10),
	"W_AmtPes" decimal(4,2),
	"AmtChocolates_USD" numeric(10),
	"W_AmtChocolates" decimal(4,2),
	"AmtComm_USD" numeric(10),
	"W_AmtComm" decimal(4,2),
	"Total_Spend_USD" numeric(10),
	"NumDeals" numeric(5),
	"NumWebBuy" numeric(5),
	"NumWalkinPur" numeric(5),
	"NumVisits" numeric(5),
	"Response" numeric(5),
	"Complain" numeric(5),
	"Country" character(30),
	"Count_success" numeric(5));
	
-- The Total Spend per Country

SELECT "Country", SUM("Total_Spend_USD")
FROM marketing_data
GROUP BY "Country";

--or to output in alphabetical order

SELECT DISTINCT "Country", SUM("Total_Spend_USD") AS Total_Spend
FROM marketing_data
GROUP BY "Country";

-- Total spend per country with count
SELECT "Country", 
SUM("Total_Spend_USD") AS Total_Spend,
ROUND(AVG("Total_Spend_USD"),2) AS Average_Spend,
COUNT("Total_Spend_USD") AS Cnt
FROM marketing_data
GROUP BY "Country" 
Order BY Total_Spend DESC;

-- The total spend per product per country

SELECT
	"Country",
	SUM ("AmtLiq_USD") AS Total_Liquor,
	SUM ("AmtVege_USD") AS Total_Vegetables,
	SUM ("AmtNonVeg_USD") AS Total_Meat,
	SUM ("AmtPes_USD") AS Total_Fish,
	SUM ("AmtChocolates_USD") AS Total_Chocolates,
	SUM ("AmtComm_USD") AS Total_Commodities,
	SUM("Total_Spend_USD") AS Total_Spend
FROM marketing_data
GROUP BY "Country"
ORDER BY "Country" ASC;

-- average spend per product per country
SELECT
	"Country",
	ROUND(AVG("Total_Spend_USD"),2) AS AVG_Spend,
	ROUND(AVG("AmtLiq_USD"),2) AS AVG_Liquor,
	ROUND(AVG("AmtVege_USD"),2) AS AVG_Vegetables,
	ROUND(AVG("AmtNonVeg_USD"),2) AS AVG_Meat,
	ROUND(AVG("AmtPes_USD"),2) AS AVG_Fish,
	ROUND(AVG("AmtChocolates_USD"),2) AS AVG_Chocolates,
	ROUND(AVG("AmtComm_USD"),2) AS AVG_Commodities
FROM marketing_data
GROUP BY "Country"
ORDER BY AVG_Spend DESC;

-- weighted average spend per country
SELECT
	"Country",
	ROUND(AVG("Total_Spend_USD"),2) AS AVG_Spend,
	ROUND(AVG("W_AmtLiq"),2) AS weighted_Liquor,
	ROUND(AVG("W_AmtVege"),2) AS weighted_Vegetables,
	ROUND(AVG("W_AmtNonVeg"),2) AS weighted_Meat,
	ROUND(AVG("W_AmtPes"),2) AS weighted_Fish,
	ROUND(AVG("W_AmtChocolates"),2) AS weighted_Chocolates,
	ROUND(AVG("W_AmtComm"),2) AS weighted_Commodities
FROM weight_marketing_data
GROUP BY "Country"
ORDER BY AVG_Spend DESC;

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

SELECT
	"Marital_Status",
	ROUND(AVG("Total_Spend_USD"),2) AS AVG_Spend,
	ROUND(AVG("AmtLiq_USD"),2) AS AVG_Liquor,
	ROUND(AVG("AmtVege_USD"),2) AS AVG_Vegetables,
	ROUND(AVG("AmtNonVeg_USD"),2) AS AVG_Meat,
	ROUND(AVG("AmtPes_USD"),2) AS AVG_Fish,
	ROUND(AVG("AmtChocolates_USD"),2) AS AVG_Chocolates,
	ROUND(AVG("AmtComm_USD"),2) AS AVG_Commodities
FROM marketing_data
GROUP BY "Marital_Status"
ORDER BY "Marital_Status" ASC;

-- most popular products based on marital status (weighted)

SELECT
	"Marital_Status",
	ROUND(AVG("Total_Spend_USD"),2) AS AVG_Spend,
	ROUND(AVG("W_AmtLiq"),2) AS weighted_Liquor,
	ROUND(AVG("W_AmtVege"),2) AS weighted_Vegetables,
	ROUND(AVG("W_AmtNonVeg"),2) AS weighted_Meat,
	ROUND(AVG("W_AmtPes"),2) AS weighted_Fish,
	ROUND(AVG("W_AmtChocolates"),2) AS weighted_Chocolates,
	ROUND(AVG("W_AmtComm"),2) AS weighted_Commodities
FROM weight_marketing_data
GROUP BY "Marital_Status"
ORDER BY "Marital_Status" DESC;

-- Which products are the most popular based on Education

SELECT
	"Education",
	ROUND(AVG("Total_Spend_USD"),2) AS AVG_Spend,
	ROUND(AVG("W_AmtLiq"),2) AS weighted_Liquor,
	ROUND(AVG("W_AmtVege"),2) AS weighted_Vegetables,
	ROUND(AVG("W_AmtNonVeg"),2) AS weighted_Meat,
	ROUND(AVG("W_AmtPes"),2) AS weighted_Fish,
	ROUND(AVG("W_AmtChocolates"),2) AS weighted_Chocolates,
	ROUND(AVG("W_AmtComm"),2) AS weighted_Commodities
FROM weight_marketing_data
GROUP BY "Education"
ORDER BY "Education" DESC;

-- Which products are the most popular based on whether or not there 
-- are children or teens in the home.

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

SELECT COUNT("Kidhome") AS Kidhome_Count, 
	COUNT("Teenhome") AS Teenhome_Count,
	SUM ("AmtLiq") AS Total_Liquor,
	SUM ("AmtVege") AS Total_Vegetables,
	SUM ("AmtNonVeg") AS Total_Meat,
	SUM ("AmtPes") AS Total_Fish,
	SUM ("AmtChocolates") AS Total_Chocolates,
	SUM ("AmtComm") AS Total_Commodities
FROM marketing_data
WHERE "Kidhome" >=1 and "Teenhome" >=1

-- Kids or Teens at home (More accurate)

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

SELECT COUNT("Kidhome") AS Kidhome_Count, 
	COUNT("Teenhome") AS Teenhome_Count,
	ROUND(AVG("Total_Spend_USD"),2) AS AVG_Spend,
	ROUND(AVG("W_AmtLiq"),2) AS weighted_Liquor,
	ROUND(AVG("W_AmtVege"),2) AS weighted_Vegetables,
	ROUND(AVG("W_AmtNonVeg"),2) AS weighted_Meat,
	ROUND(AVG("W_AmtPes"),2) AS weighted_Fish,
	ROUND(AVG("W_AmtChocolates"),2) AS weighted_Chocolates,
	ROUND(AVG("W_AmtComm"),2) AS weighted_Commodities
FROM weight_marketing_data
WHERE "Kidhome" >=1 or "Teenhome" >=1

SELECT COUNT("Kidhome") AS Kidhome_Count, 
	COUNT("Teenhome") AS Teenhome_Count,
	ROUND(AVG("Total_Spend_USD"),2) AS AVG_Spend,
	ROUND(AVG("W_AmtLiq"),2) AS weighted_Liquor,
	ROUND(AVG("W_AmtVege"),2) AS weighted_Vegetables,
	ROUND(AVG("W_AmtNonVeg"),2) AS weighted_Meat,
	ROUND(AVG("W_AmtPes"),2) AS weighted_Fish,
	ROUND(AVG("W_AmtChocolates"),2) AS weighted_Chocolates,
	ROUND(AVG("W_AmtComm"),2) AS weighted_Commodities
FROM weight_marketing_data
WHERE "Kidhome" =0 and "Teenhome" =0

-- Join the Tables

CREATE TABLE full_data AS
SELECT 
	m."ID",m."Year_Birth", m."Age", m."Education" , m."Marital_Status", m."Income_USD", m."Kidhome", m."Teenhome", 
	m."Registration_Date", m."Recency", m."AmtLiq_USD", m."AmtVege_USD", m."AmtNonVeg_USD", m."AmtPes_USD", m."AmtChocolates_USD", m."AmtComm_USD",
	m."Total_Spend_USD", m."NumDeals", m."NumWebBuy", m."NumWalkinPur", m."NumVisits", m."Response", m."Complain", m."Country",
	m."Count_success",
	a."Bulkmail_ad", a."Twitter_ad", a. "Instagram_ad", a."Facebook_ad", a."Brochure_ad"
FROM marketing_data m
FULL JOIN ad_data a 
USING ("ID")
Order BY m."ID";

-- Which social media platform (Twitter, Instagram, or Facebook) is the most effective method of advertising in each country?

SELECT m."Country", 
	SUM(a."Bulkmail_ad") AS Bulkmail, 
	SUM(a."Twitter_ad") AS Twitter, 
	SUM(a."Instagram_ad") AS Instagram, 
	SUM(a."Facebook_ad") AS Facebook, 
	SUM(a."Brochure_ad") AS Brochure
FROM marketing_data m
FULL JOIN ad_data a
USING ("ID")
GROUP BY "Country"
ORDER BY "Country" ASC;

-- Using fully joined table

SELECT "Country", 
	SUM("Bulkmail_ad") AS Bulkmail, 
	SUM("Twitter_ad") AS Twitter, 
	SUM("Instagram_ad") AS Instagram, 
	SUM("Facebook_ad") AS Facebook, 
	SUM("Brochure_ad") AS Brochure
FROM full_data
GROUP BY "Country"
ORDER BY "Country" ASC; 

-- most effective social ad channel in each country
SELECT "Country", 
	ROUND(AVG("Bulkmail_ad"),2) AS Bulkmail, 
	ROUND(AVG("Twitter_ad"),2) AS Twitter, 
	ROUND(AVG("Instagram_ad"),2) AS Instagram, 
	ROUND(AVG("Facebook_ad"),2) AS Facebook, 
	ROUND(AVG("Brochure_ad"),2) AS Brochure
FROM full_data
GROUP BY "Country"
ORDER BY "Country" ASC; 

-- Which social media platform is the most effective method of advertising based on marital status? 

-- most effective ad channel for marital status 
SELECT "Marital_Status", 
	SUM("Bulkmail_ad") AS Bulkmail, 
	SUM("Twitter_ad") AS Twitter, 
	SUM("Instagram_ad") AS Instagram, 
	SUM("Facebook_ad") AS Facebook, 
	SUM("Brochure_ad") AS Brochure
FROM full_data
GROUP BY "Marital_Status"
ORDER BY "Marital_Status" ASC;

-- Which social media platforms seem to be the most effective per country? 
-- Amount Spent per Product Type Filtered by Country

SELECT
	"Country",
	SUM ("AmtLiq") AS Total_Liquor,
	SUM ("AmtVege") AS Total_Vegetables,
	SUM ("AmtNonVeg") AS Total_Meat,
	SUM ("AmtPes") AS Total_Fish,
	SUM ("AmtChocolates") AS Total_Chocolates,
	SUM ("AmtComm") AS Total_Commodities,
	SUM("Total_Sales") AS Total_Sales,
	SUM("Bulkmail_ad") AS Bulkmail, 
	SUM("Twitter_ad") AS Twitter, 
	SUM("Instagram_ad") AS Instagram, 
	SUM("Facebook_ad") AS Facebook, 
	SUM("Brochure_ad") AS Brochure
FROM full_data
GROUP BY "Country"
ORDER BY "Country" ASC;

SELECT
	"Country",
	ROUND(AVG("Total_Spend_USD"),2) AS AVG_Spend,
	ROUND(AVG("W_AmtLiq"),2) AS weighted_Liquor,
	ROUND(AVG("W_AmtVege"),2) AS weighted_Vegetables,
	ROUND(AVG("W_AmtNonVeg"),2) AS weighted_Meat,
	ROUND(AVG("W_AmtPes"),2) AS weighted_Fish,
	ROUND(AVG("W_AmtChocolates"),2) AS weighted_Chocolates,
	ROUND(AVG("W_AmtComm"),2) AS weighted_Commodities,
	ROUND(AVG("Bulkmail_ad"),2) AS Bulkmail, 
	ROUND(AVG("Twitter_ad"),2) AS Twitter, 
	ROUND(AVG("Instagram_ad"),2) AS Instagram, 
	ROUND(AVG("Facebook_ad"),2) AS Facebook, 
	ROUND(AVG("Brochure_ad"),2) AS Brochure
FROM full_data
GROUP BY "Country"
ORDER BY "Country" ASC;

--- Using average weighting

SELECT
	"Country",
	ROUND(AVG(m."Total_Spend_USD"),2) AS AVG_Spend,
	ROUND(AVG(m."W_AmtLiq"),2) AS weighted_Liquor,
	ROUND(AVG(m."W_AmtVege"),2) AS weighted_Vegetables,
	ROUND(AVG(m."W_AmtNonVeg"),2) AS weighted_Meat,
	ROUND(AVG(m."W_AmtPes"),2) AS weighted_Fish,
	ROUND(AVG(m."W_AmtChocolates"),2) AS weighted_Chocolates,
	ROUND(AVG(m."W_AmtComm"),2) AS weighted_Commodities,
	ROUND(AVG(a."Bulkmail_ad"),2) AS Bulkmail, 
	ROUND(AVG(a."Twitter_ad"),2) AS Twitter, 
	ROUND(AVG(a."Instagram_ad"),2) AS Instagram, 
	ROUND(AVG(a."Facebook_ad"),2) AS Facebook, 
	ROUND(AVG(a."Brochure_ad"),2) AS Brochure
FROM weight_marketing_data m
JOIN ad_data a
USING ("ID")
GROUP BY "Country"
ORDER BY "Country" ASC;