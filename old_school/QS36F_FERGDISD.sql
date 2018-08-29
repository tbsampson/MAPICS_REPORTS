/*
	Ferguson DC Discounts
*/

SELECT 

--	 FERGDISD.CUSNON	"Entity"
	 FERGDISD.DHBYTX	"Name"
	,FERGDISD.BRANCH	"Branch"
	,FERGDISD.SCITY	"City"
	,FERGDISD.DHDXCD	"State"
	,FERGDISD.FECBTX	"PO"
	,FERGDISD.FEGGNB	"Invoice"
	,FERGDISD.IDATE	"Invoice Date"
--	,FERGDISD.FEIZVA	"Invoice Amount"
--	,FERGDISD.FEAACQ	"Item Amount"
	,FERGDISD.LINAMT01	"Gross Sales"
	,FERGDISD.CASHDL01	"Terms Disc"
	,FERGDISD.INVDS01	"Invoice Discount"
	,FERGDISD.FRTLIN01	"Freight"
	,FERGDISD.NETSLS	"Net Sales"
	,CAST(FERGDISD.NETSLS*.07 AS DECIMAL(10,2))	"7% DC Discount"

FROM QS36F.FERGDISD FERGDISD