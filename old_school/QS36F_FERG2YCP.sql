/*
	QS36F.FERG2YCP
	Ferguson FYTD Comparison Report
	Tom Sampson
	08/07/2018
*/

SELECT
	 FERG2YCP.GRPNO		"Grpno"
	,FERG2YCP.CUSNAM	"Customer Name"
	,FERG2YCP.ITMCLS	"Item Class"
	,FERG2YCP.ICDESC	"Item Class Description"
	,FERG2YCP.PROCOD	"Item#"
	,FERG2YCP.PRODES	"Item Description"
	,FERG2YCP.MONTH1	"Month 1"
	,FERG2YCP.YEAR1		"Year 1"
	,FERG2YCP.MONTH2	"Mont 2"
	,FERG2YCP.YEAR2		"Year 2"
	,FERG2YCP.CASES1	"FY17-18 July Cases"
	,FERG2YCP.CASES2	"FY18-19 July Cases"
	,CAST(FERG2YCP.FCSPCT/100 AS DECIMAL(5,2))	"Case Percent Difference"
--	,FERG2YCP.CSPCT	"Case Percent Difference"
	,FERG2YCP.AMT1	"FY17-18 July Net Sales"
	,FERG2YCP.AMT2	"FY18-19 July Net Sales"
	,CAST(FERG2YCP.FAMTPC/100 AS DECIMAL(5,2))	"Net Sales Percent Difference"
--	,FERG2YCP.AMTPCT	"Net Sales Percent Difference"
FROM QS36F.FERG2YCP FERG2YCP

