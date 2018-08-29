/*
	Menu Option 10:              file: RBTFILGM  Monthly Goodman
	Tom Sampson
	08/07/2018
*/

SELECT 

--	 RBTFILGM.MKT		"Mkt"
--	,RBTFILGM.TERR		"Terr"
	 RBTFILGM.GRPNO		"Grpno"
	,RBTFILGM.CUSNO		"Cusno"
	,RBTFILGM.CMINNM	"Customer Name"
	,RBTFILGM.CMINA1	"Customer Address 1"
	,RBTFILGM.CMINA2	"Customer Address 2"
--	,RBTFILGM.CMINA3	"Customer Address 3"
	,RBTFILGM.CMSTNM	"Ship to Name"
	,RBTFILGM.CMSTA1	"Ship to Address 1"
	,RBTFILGM.CMSTA2	"Ship to Address 2"
	,RBTFILGM.CMSTA3	"Ship to Address 3"
--	,RBTFILGM.GRSLRP	"Regular Products Gross Sales"
--	,RBTFILGM.DSFRRP	"Regular Products Discounts & Freight"
--	,RBTFILGM.NETSRP	"Regular Products Net Sales"
--	,RBTFILGM.GRSLSC	"PSC Products Gross Sales"
--	,RBTFILGM.DSFRSC	"PSC Products Discounts & Freight"
--	,RBTFILGM.NETSSC	"PSC Products Net Sales"
	,RBTFILGM.GRSLAL	"All Products Gross Sales"
	,RBTFILGM.DSFRAL	"All Products Discounts & Freight"
	,RBTFILGM.NETSAL	"All Products Net Sales"

FROM QS36F.RBTFILGM RBTFILGM
