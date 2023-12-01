
-- Enter the following syntax for INNER JOIN. 
-- Note that the alias for the tables was used and the result table will be limited to 15 rows
SELECT ar."ArtistId", "Name", "Title"
FROM public."Artist" ar
INNER JOIN public."Album" al
USING ("ArtistId")
ORDER BY ar."Name"
LIMIT 15;


-- Enter the following more advanced syntax for INNER JOIN. 
-- Take note that the CONCAT function was used to combine the customer’s first and last names 
-- and returns them as full names.
SELECT CONCAT("FirstName", "LastName") AS "FullName", "Country", "Total"
FROM public."Invoice" i
INNER JOIN public."Customer" c using ("CustomerId")
WHERE i."Total" > 10
ORDER BY i."Total" DESC
LIMIT 15;


-- Enter the following syntax to find the invoices created for January 2009 using an INNER JOIN. 
-- Note that the WHERE clause indicates the dates with the BETWEEN function.
SELECT i."InvoiceId", "InvoiceDate", "Total", il."UnitPrice", "Quantity"
FROM public."Invoice" i
INNER JOIN public."InvoiceLine" il
USING ("InvoiceId")
WHERE i."InvoiceDate" BETWEEN '2009-01-01' AND '2009-02-01'
ORDER BY i."InvoiceDate" DESC
LIMIT 15;

