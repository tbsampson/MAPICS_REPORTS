/*
	Sales Detail Aspen Pumps
	Tom Sampson
	08/07/2018
*/

SELECT 
	 SALESDAP.MKT	"Mkt"
	,SALESDAP.MKTNM	"Market Name"
	,SALESDAP.TERR	"Terr"
	,SALESDAP.SLSNO	"Slsmn#"
	,SALESDAP.SLSMNM	"Salesman Name"
	,SALESDAP.REPNO	"Rep#"
	,SALESDAP.REPNAM	"Rep Name"
	,SALESDAP.GRPNO	"Grpno"
	,SALESDAP.GRPNM	"Group Name"
	,SALESDAP.CUSNO	"Cusno"
	,SALESDAP.CUSNM	"Customer Name"
	,SALESDAP.ALCLTX	"Ship to Name"
	,SALESDAP.ALCMTX	"Ship to Address 1"
	,SALESDAP.ALCNTX	"Ship to Address 2"
	,SALESDAP.ALCOTX	"Ship to Address 3"
	,SALESDAP.ALZ9HH	"Ship to Address 4"
	,SALESDAP.ALZ9HG	"Ship to Address 5"
	,SALESDAP.ALCPTX	"City"
	,SALESDAP.ALBYCD	"State"
	,SALESDAP.ALCVCD	"Zip Code"
	,SALESDAP.ALCOCD	"Country Code"
	,SALESDAP.BBCJTX	"Country Name"
	,SALESDAP.SHPTEL	"Phone Number"
	,SALESDAP.COMCOD	"Item Class"
	,SALESDAP.COMCNM	"Item Class Description"
	,SALESDAP.VIP	"Item Family"
	,SALESDAP.VIPNM	"Item Fanily Description"
	,SALESDAP.ID	"Item Group"
	,SALESDAP.IDNM	"Item Group Description"
	,SALESDAP.PROCOD	"Item#"
	,SALESDAP.PRODES	"Item Description"
	,SALESDAP.YEAR	"Year"
	,SALESDAP.QUARTR	"Quarter"
	,SALESDAP.MONTH	"Month"
	,SALESDAP.CASES	"Cases"
	,SALESDAP.UNITS	"Units"
	,SALESDAP.AMOUNT	"Gross Sales"

FROM QS36F.SALESDAP SALESDAP