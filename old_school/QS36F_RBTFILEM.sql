/*
	Menu Option 17:              file: RBTFILEM   Monthly Evergreen
	Tom Sampson
	08/07/2018
*/

SELECT 
	CASE
		WHEN RBTFILEM.GRPNO = ''
		THEN RBTFILEM.CUSNO
		ELSE RBTFILEM.GRPNO
	END "Grpno/ Cusno"
	,RBTFILEM.CUSNM	"Customer Name"
	,RBTFILEM.GRSLRP	"Regular Products Gross Sales"
	,RBTFILEM.DSFRRP	"Regular Products Discounts & Freight"
	,RBTFILEM.NETSRP	"Regular Products Net Sales"
	,RBTFILEM.GRSLSC	"PSC Products Gross Sales"
	,RBTFILEM.DSFRSC	"PSC Products Discounts & Freight"
	,RBTFILEM.NETSSC	"PSC Products Net Sales"
	,RBTFILEM.GRSLAL	"All Products Gross Sales"
	,RBTFILEM.DSFRAL	"All Products Discounts & Freight"
	,RBTFILEM.NETSAL	"All Products Net Sales"

FROM QS36F.RBTFILEM RBTFILEM
