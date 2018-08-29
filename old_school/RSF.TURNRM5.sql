/*
	Raw Materials - Turns Report
	Tom Sampson
	8/10/2018


*/


SELECT 

	 TURNRM5.WHSE	"Whs"
	,TURNRM5.CMDTY	"Buy Out"
	,TURNRM5.ITCLS	"Item Class"
	,TURNRM5.B0GTTX	"Class Description"
	,TURNRM5.ITNBR	"Item#"
	,TURNRM5.ITDSC	"Item Description"
	,TURNRM5.TYPDES	"Type of Product"
	,TURNRM5.ESTQTY01	"Jul 2017 through Jun 2018 Usage"
	,TURNRM5.PRQOH0201	"Average Inventory"
	,TURNRM5.TURNS	"Yearly Turns"
	,TURNRM5.BEGIN01	"Jun 2018 Month End Inventory"
	,TURNRM5.UCDEF	"Cost"
	,TURNRM5.VALUE	"Jun 2018 Month End Value"


FROM RSF.TURNRM5 TURNRM5