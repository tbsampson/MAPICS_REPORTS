/*
	Bluehawk Distributors Monthly Report MMMDD.xls
	Tom Sampson
	08/06/2018
	Menu Option 8:                 file: RBTFILBH    Monthly Bluehawk
*/
SELECT 

--	RBTFILBH.MKT	"MKT"
--	,RBTFILBH.TERR	"TERR"
--	,RBTFILBH.CUSNO	"CUSNO"
	 
	 CASE WHEN 
	 	RBTFILBH.GRPNO = '' THEN RBTFILBH.CUSNO
	 	ELSE RBTFILBH.GRPNO
	 END	"Cusno /Grpno"
	,RBTFILBH.CUSAD3	"BH ID"		 
	,RBTFILBH.CUSNM	"Customer Name"
--	,RBTFILBH.GRSLRP	"Regular Products Gross Sales"
--	,RBTFILBH.DSFRRP	"Regular Products Discounts & Freight"
--	,RBTFILBH.NETSRP	"Regular Products Net Sales"
--	,RBTFILBH.GRSLSC	"PSC Products Gross Sales"
--	,RBTFILBH.DSFRSC	"PSC Products Discounts & Freight"
--	,RBTFILBH.NETSSC	"PSC Products Net Sales"
	,RBTFILBH.GRSLAL	"All Products Gross Sales"
	,RBTFILBH.DSFRAL	"All Products Discounts & Freight"
	,RBTFILBH.NETSAL	"All Products Net Sales"

FROM QS36F.RBTFILBH RBTFILBH