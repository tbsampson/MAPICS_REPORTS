/*
	Export Shipments
*/
SELECT

	 EXPSHPMT.FEAADG	"Mrkt"
	,EXPSHPMT.CUSNO		"Customer Number"
	,EXPSHPMT.FEAADM	"Customer Name"
	,EXPSHPMT.FEAADY	"Sold to Country"
	,EXPSHPMT.FECVNB	"Order Number"
	,EXPSHPMT.DHZ969	"Shipment Number"
	,EXPSHPMT.SDATE		"Shipment Date"
	,EXPSHPMT.FEA2TX	"Payment Terms"
	,EXPSHPMT.FEGGNB	"Invoice Number"
	,EXPSHPMT.IDATE		"Invoice Date"
	,EXPSHPMT.FEIZVA	"Invoice Amount"


FROM RSF.EXPSHPMT EXPSHPMT