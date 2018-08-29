/*
	Affiliated Distributors Monthly Report MMMDD.xls
	Tom Sampson
	08/06/2018
	Menu Option 7:                 file: RBTFILAD    Monthly AD Plb/AC
*/
SELECT 

--	RBTFILAD.MKT	"MKT"
--	,RBTFILAD.TERR	"TERR"
--	,RBTFILAD.CUSNO	"CUSNO"
	 RBTFILAD.GRPNO	"Cusno /Grpno"
	,RBTFILAD.CUSNM	"Customer Name"
--	,RBTFILAD.GRSLRP	"Regular Products Gross Sales"
--	,RBTFILAD.DSFRRP	"Regular Products Discounts & Freight"
--	,RBTFILAD.NETSRP	"Regular Products Net Sales"
--	,RBTFILAD.GRSLSC	"PSC Products Gross Sales"
--	,RBTFILAD.DSFRSC	"PSC Products Discounts & Freight"
--	,RBTFILAD.NETSSC	"PSC Products Net Sales"
	,RBTFILAD.GRSLAL	"All Products Gross Sales"
	,RBTFILAD.DSFRAL	"All Products Discounts & Freight"
	,RBTFILAD.NETSAL	"All Products Net Sales"

FROM QS36F.RBTFILAD RBTFILAD