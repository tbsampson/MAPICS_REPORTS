/*
 AMFLIB.MBCLREP
 Pick Header
 Tom Sampson 08/23/2018

*/

SELECT 
--	 MBCLREP.CLAENB "Company Number"
	 MBCLREP.CLKZNB "Pick List Number"
	,MBCLREP.CLANVN "Initiator User ID"
	,DATE(CONCAT(
			 CONCAT(
				CONCAT(
					Substr(CHAR((MBCLREP.CLBEDT - 1000000 ) + 20000000), 1, 4), '-'), 
					CONCAT(
						Substr(CHAR(( MBCLREP.CLBEDT - 1000000 ) + 20000000), 5, 2),'-')),
						Substr(CHAR(( MBCLREP.CLBEDT - 1000000 ) + 20000000), 7, 2))) 
					"Pick Date"
 	,MBCLREP.CLH6ST "Pick List Status"
--	,MBCLREP.CLH7ST "Pick Header Type"
--	,MBCLREP.CLZ93K "Pick Consolidation Option"
--	,MBCLREP.CLZ93M "Stage Area"
	,MBCLREP.CLH6NB "Print Count"
--	,MBCLREP.CLAGQ7 "Release Eligible for Shipping Count"
--	,MBCLREP.CLA3CD "Warehouse"
--	,MBCLREP.CLCKTX "Location in Warehouse"
--	,MBCLREP.CLZ95G "Kit Parent Company"
--	,MBCLREP.CLZ95H "Kit Parent Pick List"
--	,MBCLREP.CLDCCD "Internal Header Type"
	,MBCLREP.CLCVNB "Quote/Order Number"
	,MBC6REP.C6CANB "Customer Number"
	,MBBFREP.CUSNM	"Customer Name"
--	,MBCLREP.CLFCNB "Line Item Sequence"
--	,MBCLREP.CLDRNB "Release Number"
--	,MBCLREP.CLAASZ "Kit Sequence Number"
--	,MBCLREP.CLBUCD "Userid"
	,MBCLREP.CLK0NB "Trigger Sequence Number"
	,MBCLREP.CLHUNB "Turnaround File Designator"
	,MBCLREP.CLHWNB "Turnaround Sequence Number"
	,MBCLREP.CLHVNB "Turnaround Check Digit"
	,DATE(CONCAT(
			 CONCAT(
				CONCAT(
					Substr(CHAR((MBCLREP.CLALDT - 1000000 ) + 20000000), 1, 4), '-'), 
					CONCAT(
						Substr(CHAR(( MBCLREP.CLALDT - 1000000 ) + 20000000), 5, 2),'-')),
						Substr(CHAR(( MBCLREP.CLALDT - 1000000 ) + 20000000), 7, 2))) 
					"Create Date"
	,cast(HOUR(MBCLREP.CLABTM)||':'||MINUTE(MBCLREP.CLABTM)||':'||SECOND(MBCLREP.CLABTM) as char(8))
					"Create Time"
	,MBCLREP.CLAFVN "Created by User"
--	,MBCLREP.CLAGVN "Created by Program"
	,DATE(CONCAT(
			 CONCAT(
				CONCAT(
					Substr(CHAR((MBCLREP.CLAMDT - 1000000 ) + 20000000), 1, 4), '-'), 
					CONCAT(
						Substr(CHAR(( MBCLREP.CLAMDT - 1000000 ) + 20000000), 5, 2),'-')),
						Substr(CHAR(( MBCLREP.CLAMDT - 1000000 ) + 20000000), 7, 2))) 
					"Change Date"	
	,cast(HOUR(MBCLREP.CLACTM)||':'||MINUTE(MBCLREP.CLACTM)||':'||SECOND(MBCLREP.CLACTM) as char(8))
					"Change Time"
	,MBCLREP.CLAHVN "Changed by User"
--	,MBCLREP.CLAIVN "Changed by Program"
FROM AMFLIB.MBCLREP MBCLREP
JOIN AMFLIB.MBC6REP MBC6REP
	ON MBCLREP.CLCVNB = MBC6REP.C6CVNB
	JOIN
		AMFLIB.MBBFREP MBBFREP
			ON MBC6REP.C6AENB = MBBFREP.COMNO
			AND MBC6REP.C6CANB = MBBFREP.CUSNO



WHERE MBCLREP.CLA3CD = '1'