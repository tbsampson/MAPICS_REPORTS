/*
	Days to Ship
	Tom Sampson
	8/10/2018

*/

SELECT 

	 SHPDATEPL.WHS	"Whs"
	,SHPDATEPL.MKT	"Mkt"
	,SHPDATEPL.RMKT	"Report Mkt"
	,SHPDATEPL.CUSNO	"Cusno"
	,SHPDATEPL.CUSNAM	"Customer Name"
	,SHPDATEPL.ORDDT	"Order Date"
	,SHPDATEPL.PKLDT	"Request Date"
	,SHPDATEPL.SHPDT	"Ship Date"
--	,SHPDATEPL.	"Invoice Date"
	,SHPDATEPL.SHIPNUM	"Invoice Number"
--	,SHPDATEPL.	"Invoice Amount"
	,SHPDATEPL.CASES	"Cases"
	,SHPDATEPL.OTPDAY	"Order to Ship Days"
	,SHPDATEPL.OTSDAY	"Request to Ship Days"
	,SHPDATEPL.PTSDAY	"Ship to Invoice Days"


FROM RSF.SHPDATEPL SHPDATEPL