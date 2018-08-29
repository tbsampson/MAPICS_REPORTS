/*
Open order detail report
Tom Sampson 20180829
*/

SELECT  
		slsrep.offcnm									"Sales Manager",
        MBC6REP.C6A3CD                                  "WH",
		mbbfrep.cusno									"Cust#",
		MBBFREP.cusnm									"Customer Name",
		MBCJCPP.CJCBTX									"PO Number",
		CAST(TRIM(MBC6REP.C6CVNB) AS INTEGER)			"Order Number",
		DATE(CONCAT(
			CONCAT(
				CONCAT(
					Substr(CHAR((mbc6rep.c6uud1 - 1000000 ) + 20000000), 1, 4), '-'), 
       			CONCAT(
       				Substr(CHAR(( mbc6rep.c6uud1 - 1000000 ) + 20000000), 5, 2),'-')),
       				Substr(CHAR(( mbc6rep.c6uud1 - 1000000 ) + 20000000), 7, 2)))       
						       							"Order Date",
       CASE 
         WHEN ( mbc6rep.c6uud1 > 0 ) THEN DATE(CONCAT(CONCAT( 
                                                      CONCAT( 
         Substr(CHAR( 
         ( 
         mbc6rep.c6uud1 - 1000000 ) + 20000000), 1, 4), '-'), 
       CONCAT(Substr(CHAR(( mbc6rep.c6uud1 - 1000000 ) + 20000000), 5, 2), 
       '-')) 
       , Substr(CHAR(( mbc6rep.c6uud1 - 1000000 ) + 20000000), 7, 2))) 
         ELSE DATE(CONCAT(CONCAT( 
       CONCAT( 
              Substr(CHAR(( mbc6rep.c6d0nb - 1000000 ) + 20000000), 1, 4), '-'), 
       CONCAT(Substr(CHAR(( mbc6rep.c6d0nb - 1000000 ) + 20000000), 5, 2), 
       '-')) 
       , Substr(CHAR(( mbc6rep.c6d0nb - 1000000 ) + 20000000), 7, 2))) 
       END 												"Due Date",
        MBC6REP.C6FNST									"Order Status",
		mbc6rep.c6afvn									"Created By",
		MBB0REP.B0GTTX 									"Item Class",
        mbcdrep.cdaitx                                  "Product ID", 
        itemasa.itdsc                                   "Product Description",
	CAST(itembl.mohtq AS INTEGER)	   				"Qty On Hand",
	CAST(mbcdrep.cdagnv AS INTEGER)						"Qty Open",
	CAST(mbcdrep.cdaabf	AS DECIMAL(14,2))				"Price",
	CAST(mbcdrep.cdagnv * mbcdrep.cdaabf AS DECIMAL(14,2))	"Open Item Value",
		 CASE 
	 WHEN (MBC6REP.C6BLCD = 'CI') THEN 'CIA'
	 WHEN (MBC6REP.C6BLCD = '2%') THEN '2% CIA'
	 ELSE NULL
	 END CIA,
	CASE 
		WHEN MBC6REP.C6F1CD = 'WILL CALL'
		THEN 'WILL CALL'
		ELSE ''
	END "Will Call"


FROM AMFLIB.MBC6REP mbc6rep -- order header

JOIN AMFLIB.mbcdrep mbcdrep -- order detail
		ON mbc6rep.c6cvnb = mbcdrep.cdcvnb -- order number
			AND mbc6rep.C6CANB = mbcdrep.cdaayy -- customer number
			AND mbc6rep.C6DCCD = mbcdrep.cddccd -- internal header type
INNER JOIN amflib.itemasa ITEMASA -- item master
		ON itemasa.itnbr = mbcdrep.cdaitx --item number
INNER JOIN amflib.mbb0rep MBB0REP -- item classes
		ON mbb0rep.b0glcd = mbcdrep.cdglcd  --item class code
INNER JOIN amflib.mbbfrep MBBFREP -- customer master
		ON mbcdrep.cdaayy = mbbfrep.cusno -- customer number
INNER JOIN amflib.itembl ITEMBL 
		ON itemasa.itnbr = itembl.itnbr AND mbcdrep.CDA3CD = itembl.HOUSE -- itemnumber and warehouse
JOIN amflib.mbbvrep MBBVREP 
		ON mbc6rep.c6dccd = mbbvrep.bvdccd --internal header type 
LEFT JOIN qs36f.slsrep SLSREP 
		ON mbc6rep.c6chnb = slsrep.slsrno -- sales rep
JOIN amflib.mbcjcpp mbcjcpp
		ON mbc6rep.c6dccd = mbcjcpp.cjdccd -- internal header type
	AND mbcdrep.cdcvnb = mbcjcpp.cjcvnb -- order number    

WHERE  MBC6REP.C6DCCD = '1' --orders only (4 is credit memo)
	AND MBC6REP.C6FNST <> '50' -- not complete (10 = open, 15 = picked, 20 = shipped)
	AND mbcdrep.cdaabf > 0 --converted selling price - samples are 0 (better to use item class for sample)
	AND mbcdrep.cdagnv > 0 --total open quantity	


		

ORDER BY MBC6REP.C6CVNB, mbcdrep.cdaitx