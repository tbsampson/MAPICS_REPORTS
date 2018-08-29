/*
	Menu Option 14:              file: RBTFILWD   Monthly Wesco
	Tom Sampson
	08/07/2018
*/

SELECT 

	 RBTFILWD.MKT	"Mkt"
	,RBTFILWD.TERR	"Terr"
	,RBTFILWD.GRPNO	"Grpno"
	,RBTFILWD.CUSNO	"Cusno"
	,RBTFILWD.CMINNM	"Customer Name"
	,RBTFILWD.CMINA1	"Customer Address 1"
	,RBTFILWD.CMINA2	"Customer Address 2"
	,RBTFILWD.CMINA3	"Customer Address 3"
	,RBTFILWD.CMSTNM	"Ship to Name"
	,RBTFILWD.CMSTA1	"Ship to Address 1"
	,RBTFILWD.CMSTA2	"Ship to Address 2"
	,RBTFILWD.CMSTA3	"Ship to Address 3"
	,RBTFILWD.GRSLRP	"Regular Products Gross Sales"
	,RBTFILWD.DSFRRP	"Regular Products Discounts & Freight"
	,RBTFILWD.NETSRP	"Regular Products Net Sales"
	,RBTFILWD.GRSLSC	"PSC Products Gross Sales"
	,RBTFILWD.DSFRSC	"PSC Products Discounts & Freight"
	,RBTFILWD.NETSSC	"PSC Products Net Sales"
	,RBTFILWD.GRSLAL	"All Products Gross Sales"
	,RBTFILWD.DSFRAL	"All Products Discounts & Freight"
	,RBTFILWD.NETSAL	"All Products Net Sales"

FROM QS36F.RBTFILWD RBTFILWD
