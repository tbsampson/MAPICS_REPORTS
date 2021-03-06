/*
 	Ferguson Sure Seal Discounts
 	Tom Sampson
 	08/07/2018
*/

SELECT

--	,FERGDISS.CUSNO	"Entity"
	 FERGDISS.ALCLTX	"Name"
	,FERGDISS.BRANCD	"Branch"
	,FERGDISS.ALCPTX	"City"
	,FERGDISS.ALBYCD	"State"
	,FERGDISS.CUSONO	"PO"
	,FERGDISS.INVNO	"Invoice"
	,FERGDISS.INVDT	"Invoice Date"
	,FERGDISS.PROCOD	"Item#"
	,FERGDISS.PRODES	"Item Description"
	,FERGDISS.CASES	"Cases"
	,FERGDISS.LINAMT	"Item Amount"
	,FERGDISS.CASHDL	"Terms Disc"
--	,FERGDISS.INVDS	"Invoice Discount"
	,FERGDISS.FRTLIN	"Freight"
	,FERGDISS.NETSLS	"Net Sales"
	,CAST(FERGDISS.NETSLS*-.05 AS DECIMAL(10,2))	"5% Sure Seal Rebate"

FROM QS36F.FERGDISS FERGDISS