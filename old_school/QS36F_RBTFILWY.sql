/*
	Menu Option 15:              file: RBTFILWY   YTD Wesco
	Tom Sampson
	08/07/2018
*/

SELECT 

	 RBTFILWY.MKT	"Mkt"
	,RBTFILWY.TERR	"Terr"
	,RBTFILWY.GRPNO	"Grpno"
	,RBTFILWY.CUSNO	"Cusno"
	,RBTFILWY.CMINNM	"Customer Name"
	,RBTFILWY.CMINA1	"Customer Address 1"
	,RBTFILWY.CMINA2	"Customer Address 2"
	,RBTFILWY.CMINA3	"Customer Address 3"
	,RBTFILWY.CMSTNM	"Ship to Name"
	,RBTFILWY.CMSTA1	"Ship to Address 1"
	,RBTFILWY.CMSTA2	"Ship to Address 2"
	,RBTFILWY.CMSTA3	"Ship to Address 3"
	,RBTFILWY.GRSLRP	"Regular Products Gross Sales"
	,RBTFILWY.DSFRRP	"Regular Products Discounts & Freight"
	,RBTFILWY.NETSRP	"Regular Products Net Sales"
	,RBTFILWY.GRSLSC	"PSC Products Gross Sales"
	,RBTFILWY.DSFRSC	"PSC Products Discounts & Freight"
	,RBTFILWY.NETSSC	"PSC Products Net Sales"
	,RBTFILWY.GRSLAL	"All Products Gross Sales"
	,RBTFILWY.DSFRAL	"All Products Discounts & Freight"
	,RBTFILWY.NETSAL	"All Products Net Sales"

FROM QS36F.RBTFILWY RBTFILWY
