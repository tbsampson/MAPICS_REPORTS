/*
	Menu Option 18:              file: RBTFILEY     YTD Evergreen
	Tom Sampson
	08/07/2018
*/

SELECT 
--	 RBTFILEY.MKT	"Mkt"	
--	,RBTFILEY.TERR	"Terr"		
	CASE WHEN RBTFILEY.GRPNO = '' 
	THEN RBTFILEY.CUSNO
	ELSE RBTFILEY.GRPNO
	END "Grpno/ Cusno"
	,RBTFILEY.CUSNM	"Customer Name"
--	,RBTFILEY.GRSLRP	"Regular Products Gross Sales"
--	,RBTFILEY.DSFRRP	"Regular Products Discounts & Freight"
--	,RBTFILEY.NETSRP	"Regular Products Net Sales"
--	,RBTFILEY.GRSLSC	"PSC Products Gross Sales"
--	,RBTFILEY.DSFRSC	"PSC Products Discounts & Freight"
--	,RBTFILEY.NETSSC	"PSC Products Net Sales"
	,RBTFILEY.GRSLAL	"All Products Gross Sales"
	,RBTFILEY.DSFRAL	"All Products Discounts & Freight"
	,RBTFILEY.NETSAL	"All Products Net Sales"


FROM QS36F.RBTFILEY RBTFILEY