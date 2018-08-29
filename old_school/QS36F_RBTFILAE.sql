/*
	Menu Option 13:              file: RBTFILAE     Monthly AD ESD
	Tom Sampson
	08/07/2018
*/

SELECT 
--	 RBTFILAE.MKT	"Mkt"
--	 ,RBTFILAE.TERR	"Terr"	 
	 CASE WHEN RBTFILAE.GRPNO = ''
	 THEN RBTFILAE.CUSNO
	 ELSE RBTFILAE.GRPNO
	 END "Cusno /Grpno"
	,RBTFILAE.CUSNM		"Customer Name"
--	,RBTFILAE.GRSLRP	"Regular Products Gross Sales"
--	,RBTFILAE.DSFRRP	"Regular Products Discounts & Freight"
--	,RBTFILAE.NETSRP	"Regular Products Net Sales"
--	,RBTFILAE.GRSLSC	"PSC Products Gross Sales"
--	,RBTFILAE.DSFRSC	"PSC Products Discounts & Freight"
--	,RBTFILAE.NETSSC	"PSC Products Net Sales"
	,RBTFILAE.GRSLAL	"All Products Gross Sales"
	,RBTFILAE.DSFRAL	"All Products Discounts & Freight"
	,RBTFILAE.NETSAL	"All Products Net Sales"

FROM QS36F.RBTFILAE RBTFILAE

