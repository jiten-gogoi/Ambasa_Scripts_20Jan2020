SELECT C.cust_last_name, C.country_id
FROM sh.customers C
WHERE Exists(SELECT null
	FROM sh.sales S
	WHERE C.cust_id=S.cust_id
	AND s.quantity_sold > 1000);

