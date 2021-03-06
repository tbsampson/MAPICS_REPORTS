/*
	Top 25 Report for Brian and Emanuel
	Tom Sampson
	8/10/2018

*/

SELECT 

	 PRFSUM25.SLSNO     "SLSNO"
	,PRFSUM25.SLSMNM     "SLSMNM"
	,PRFSUM25.REPNO     "REPNO"
	,PRFSUM25.REPNAM     "REPNAM"
	,PRFSUM25.MKT     "MKT"
	,PRFSUM25.MKTNM     "MKTNM"
	,PRFSUM25.TERR     "TERR"
	,PRFSUM25.GRPNO     "Grpno"
	,PRFSUM25.GRPNM     "Customer Name"
	,PRFSUM25.CUSNO     "CUSNO"
	,PRFSUM25.CUSNM     "CUSNM"
	,PRFSUM25.COMCOD     "COMCOD"
	,PRFSUM25.COMCNM     "COMCNM"
	,PRFSUM25.VIP     "VIP"
	,PRFSUM25.VIPNM     "VIPNM"
	,PRFSUM25.ID     "ID"
	,PRFSUM25.IDNM     "IDNM"
	,PRFSUM25.PROCOD     "PROCOD"
	,PRFSUM25.PRODES     "PRODES"
	,PRFSUM25.STRDAT     "Start Date"
	,PRFSUM25.ENDDAT     "End Date"
	,PRFSUM25.CASES     "CASES"
	,PRFSUM25.UNITS     "UNITS"
	,PRFSUM25.GRSSLS     "Gross Sales"
	,PRFSUM25.CASHDS     "Cash Discounts"
	,PRFSUM25.INVDIS     "Invoice Discounts"
	,PRFSUM25.OTHDIS     "Other Discounts"
	,PRFSUM25.NETSLS     "Net Sales"
	,PRFSUM25.RM     "RM"
	,PRFSUM25.LO     "LO"
	,PRFSUM25.GRSMAR     "GRSMAR"
	,PRFSUM25.GRSMRP     "GRSMRP"
	,PRFSUM25.FRT     "FRT"
	,PRFSUM25.COMM     "COMM"
	,PRFSUM25.PRTXCN     "PRTXCN"
	,PRFSUM25.PRTXCP     "PRTXCP"


FROM QS36F.PRFSUM25 PRFSUM25