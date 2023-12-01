-- Type in the following syntax for a LEFT JOIN.
-- Take note that in a LEFT JOIN, columns such as customer ID, first name, and last name from the 
-- left table will be joined with the customer ID from the right table.
SELECT c."CustomerId", "FirstName", "LastName",
SUM(i."Total") AS total
FROM public."Invoice" i
LEFT JOIN public."Customer" c
ON i."CustomerId" = c."CustomerId"
GROUP BY c."CustomerId"
ORDER BY total DESC;

-- Type in the following syntax for a RIGHT JOIN.
-- Take note that in a RIGHT JOIN, columns such as Genre ID and Name from the left table 
-- in this case, the Genre table will be joined with a Track table.
SELECT g."GenreId", g."Name" AS genre, t."Name" AS track, "Composer"
FROM public."Genre" g
RIGHT JOIN public."Track" t
USING ("GenreId")
WHERE g."Name" = 'Rock'
ORDER BY g."GenreId" DESC
LIMIT 15;

-- Type in the following syntax for a FULL JOIN.
SELECT i."InvoiceId", "InvoiceDate", "Total", il."UnitPrice", "Quantity"
FROM public."Invoice" i
FULL JOIN public."InvoiceLine" il
USING ("InvoiceId")
WHERE i."InvoiceDate" BETWEEN '2009-01-01' AND '2009-02-01'
ORDER BY i."InvoiceDate"
LIMIT 15;
