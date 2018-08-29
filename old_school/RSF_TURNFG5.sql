/*
	Finished Goods - Turns Report
	Tom Sampson
	8/10/2018


*/


SELECT 

	 TURNFG5.WHSE	"Whs"
	,TURNFG5.CMDTY	"Buy Out"
	,TURNFG5.ITCLS	"Item Class"
	,TURNFG5.B0GTTX	"Class Description"
	,TURNFG5.ITNBR	"Item#"
	,TURNFG5.ITDSC	"Item Description"
	,TURNFG5.TYPDES	"Type of Product"
	,TURNFG5.ESTQTY01	"Jul 2017 through Jun 2018 Usage"
	,TURNFG5.PRQOH02	"Average Inventory"
	,TURNFG5.TURNS	"Yearly Turns"
	,TURNFG5.BEGIN01	"Jun 2018 Month End Inventory"
	,TURNFG5.UCDEF	"Cost"
	,TURNFG5.VALUE	"Jun 2018 Month End Value"


FROM RSF.TURNFG5 TURNFG5