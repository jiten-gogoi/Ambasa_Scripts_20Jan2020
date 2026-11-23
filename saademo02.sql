SELECT C.cust_last_name, C.country_id
FROM sh.customers C
WHERE C.cust_id =
	ANY(SELECT S.cust_id
	    FROM sh.sales S
	    WHERE S.quantity_sold > 1000);
