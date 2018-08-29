/*
Desolv Royalty Sales
Tom Sampson 20180802
*/
SELECT 
--	 DESOLV.DHADR6
	 CAST(DESOLV.TERR AS INTEGER)	"Terr" 
	,CAST(DESOLV.CUSNO AS INTEGER)	"Cusno"
	,DESOLV.DHAAGX 					"Ship to City"
	,DESOLV.DHDXCD					"State"
	,CAST(DESOLV.DHB6CD AS INTEGER)	"Zip"
	,DESOLV.DDESST					"Credit"
	,DESOLV.BVAAHZ					"Order Type"
	,CAST(DESOLV.DDCVNB AS INTEGER)	"Order Number"	
	,CAST(DESOLV.DDZ969 AS INTEGER)	"Shipment Number"
	,DESOLV.SDATE				"Shipment Date"
	,CAST(DESOLV.FEGGNB AS INTEGER)	"Invoice Number"
	,DESOLV.IDATE				"Invoice Date"
	,CAST(DESOLV.DDAITX AS INTEGER)	"Item#"
	,DESOLV.DDALTX					"Item Description"
	,CAST(DESOLV.DDARQT AS INTEGER)	"Qty Shipped"
	,DESOLV.DDEKCD					"U/M"
	,CAST(DESOLV.UNITS AS INTEGER)	"Units"
	,CAST(DESOLV.DDAAGP AS DECIMAL(14,2))	"Selling Price"
	,CAST(DESOLV.DDDPVA AS DECIMAL(14,2))	"Gross Sales"
FROM QS36F.DESOLV DESOLV