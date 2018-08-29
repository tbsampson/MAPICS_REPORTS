/*
	Sales Detail Goodman Manufacturing
	Tom Sampson
	08/07/2018
*/

SELECT 
	 SALESDGM.MKT	"Mkt"
	,SALESDGM.MKTNM	"Market Name"
	,SALESDGM.TERR	"Terr"
	,SALESDGM.SLSNO	"Slsmn#"
	,SALESDGM.SLSMNM	"Salesman Name"
	,SALESDGM.REPNO	"Rep#"
	,SALESDGM.REPNAM	"Rep Name"
	,SALESDGM.GRPNO	"Grpno"
	,SALESDGM.GRPNM	"Group Name"
	,SALESDGM.CUSNO	"Cusno"
	,SALESDGM.CUSNM	"Customer Name"
	,SALESDGM.ALCLTX	"Ship to Name"
	,SALESDGM.ALCMTX	"Ship to Address 1"
	,SALESDGM.ALCNTX	"Ship to Address 2"
	,SALESDGM.ALCOTX	"Ship to Address 3"
	,SALESDGM.ALZ9HH	"Ship to Address 4"
	,SALESDGM.ALZ9HG	"Ship to Address 5"
	,SALESDGM.ALCPTX	"City"
	,SALESDGM.ALBYCD	"State"
	,SALESDGM.ALCVCD	"Zip Code"
	,SALESDGM.ALCOCD	"Country Code"
	,SALESDGM.BBCJTX	"Country Name"
	,SALESDGM.SHPTEL	"Phone Number"
	,SALESDGM.COMCOD	"Item Class"
	,SALESDGM.COMCNM	"Item Class Description"
	,SALESDGM.VIP	"Item Family"
	,SALESDGM.VIPNM	"Item Fanily Description"
	,SALESDGM.ID	"Item Group"
	,SALESDGM.IDNM	"Item Group Description"
	,SALESDGM.PROCOD	"Item#"
	,SALESDGM.PRODES	"Item Description"
	,SALESDGM.YEAR	"Year"
	,SALESDGM.QUARTR	"Quarter"
	,SALESDGM.MONTH	"Month"
	,SALESDGM.CASES	"Cases"
	,SALESDGM.UNITS	"Units"
	,SALESDGM.AMOUNT	"Gross Sales"

FROM QS36F.SALESDGM SALESDGM