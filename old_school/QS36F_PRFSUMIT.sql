/*
	Profit Summary by Item
	Tom Sampson
	08/08/2018
*/

SELECT 

	 PRFSUMIT.SLSNO	"Obslt Code"
	,PRFSUMIT.SLSMNM	"Product Type"
--	,PRFSUMIT.REPNO	"REPNO"
--	,PRFSUMIT.REPNAM	"REPNAM"
--	,PRFSUMIT.MKT	"MKT"
--	,PRFSUMIT.MKTNM	"MKTNM"
--	,PRFSUMIT.TERR	"TERR"
--	,PRFSUMIT.GRPNO	"GRPNO"
--	,PRFSUMIT.GRPNM	"GRPNM"
--	,PRFSUMIT.CUSNO	"CUSNO"
--	,PRFSUMIT.CUSNM	"CUSNM"
	,PRFSUMIT.COMCOD	"Item Class"
	,PRFSUMIT.COMCNM	"Item Class Description"
	,PRFSUMIT.VIP	"Item Family"
	,PRFSUMIT.VIPNM	"Item Family Description"
	,PRFSUMIT.ID	"Item Group"
	,PRFSUMIT.IDNM	"Item Group Description"
	,PRFSUMIT.PROCOD	"Item#"
	,PRFSUMIT.PRODES	"Item Description"
	,PRFSUMIT.STRDAT	"Start Date"
	,PRFSUMIT.ENDDAT	"End Date"
	,PRFSUMIT.CASES	"Cases"
	,PRFSUMIT.UNITS	"Units"
	,PRFSUMIT.GRSSLS	"Gross Sales"
	,PRFSUMIT.CASHDS	"Cash Discounts"
	,PRFSUMIT.INVDIS	"Invoice Discounts"
	,PRFSUMIT.OTHDIS	"Other Discounts (Rebates)"
	,PRFSUMIT.NETSLS	"Net Sales"
	,PRFSUMIT.RM	"Raw Materials"
	,PRFSUMIT.LO	"Labor & Overhead"
	,PRFSUMIT.GRSMAR	"Gross Margin"
	,CAST(PRFSUMIT.GRSMRP/100 AS DECIMAL(5,2))	"Gross Margin Percent"
	,PRFSUMIT.FRT	"Freight"
	,PRFSUMIT.COMM	"Commissions"
	,PRFSUMIT.PRTXCN	"Pre Tax Contribution"
	,CAST(PRFSUMIT.PRTXCP/100 AS DECIMAL(5,2))	"Pre Tax Contribution Percent"


FROM QS36F.PRFSUMIT PRFSUMIT