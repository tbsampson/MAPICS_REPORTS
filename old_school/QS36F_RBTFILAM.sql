/*
	Menu Option 16:              file: RBTFILAM   Monthly AMAROK
	Tom Sampson
	08/07/2018
*/

SELECT 

	 RBTFILAM.MKT		"Mkt"
	,RBTFILAM.TERR		"Ter"
	,RBTFILAM.CUSNO		"Cusno"
	,RBTFILAM.GRPNO		"Grpno"
	,RBTFILAM.TYPRBT	"Type of Rebate"
	,RBTFILAM.CUSNM		"Customer Name"
	,RBTFILAM.CUSAD1	"Address 1"
	,RBTFILAM.CUSAD2	"Address 2"
	,RBTFILAM.CUSAD3	"Address 3"
	,RBTFILAM.GRSLRP	"Regular Products Gross Sales"
	,RBTFILAM.DSFRRP	"Regular Products Discounts & Freight"
	,RBTFILAM.NETSRP	"Regular Products Net Sales"
	,RBTFILAM.GRSLSC	"PSC Products Gross Sales"
	,RBTFILAM.DSFRSC	"PSC Products Discounts & Freight"
	,RBTFILAM.NETSSC	"PSC Products Net Sales"
	,RBTFILAM.GRSLAL	"All Products Gross Sales"
	,RBTFILAM.DSFRAL	"All Products Discounts & Freight"
	,RBTFILAM.NETSAL	"All Products Net Sales"

FROM QS36F.RBTFILAM RBTFILAM
