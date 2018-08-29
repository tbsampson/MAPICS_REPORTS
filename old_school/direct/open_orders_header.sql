/*
Open order header report
Tom Sampson
20180829
*/

SELECT  
		slsrep.offcnm									"Sales Manager",
        MBC6REP.C6A3CD                                  "WH",
		mbbfrep.cusno									"Cust#",
		MBBFREP.cusnm									"Customer Name",
		MBCJCPP.CJCBTX									"PO Number",
		CAST(MBC6REP.C6CVNB AS INTEGER)					"Order Number",
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

	 CASE 
	 WHEN (MBC6REP.C6BLCD = 'CI') THEN 'CIA'
	 WHEN (MBC6REP.C6BLCD = '2%') THEN '2% CIA'
	 ELSE NULL
	 END CIA,
        
	SUM(mbcdrep.cdagnv * mbcdrep.cdaabf)				"Open Value",

	CASE WHEN CAST(STOCK.FLAG AS INTEGER) > 0
		THEN ''
		ELSE 'All'
		END												"In Stock",	
	CASE 
		WHEN MBC6REP.C6F1CD = 'WILL CALL'
		THEN 'WILL CALL'
		ELSE ''
	END 												"Will Call",
	
	mbc6rep.c6afvn										"Created By"


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


LEFT JOIN
	(
		SELECT FLAG1.OID,
				SUM(FLAG1.FLAG) FLAG
		
		FROM
			(
				SELECT  
						MBC6REP.C6CVNB									"OID",
				        mbcdrep.cdaitx                                  "PID", 
					CASE WHEN CAST(mbcdrep.cdagnv AS INTEGER) > CAST(AVG(itembl.mohtq) AS INTEGER)
					THEN 1
					ELSE 0
					END "FLAG"
				
				FROM   amflib.mbcdrep MBCDREP 
				       INNER JOIN amflib.itemasa ITEMASA 
				               ON itemasa.itnbr = mbcdrep.cdaitx --item number
				       INNER JOIN amflib.mbb0rep MBB0REP 
				               ON mbb0rep.b0glcd = mbcdrep.cdglcd  --item class code
				       INNER JOIN amflib.mbc6rep MBC6REP 
				               ON mbc6rep.c6cvnb = mbcdrep.cdcvnb -- order number
				               AND mbc6rep.C6CANB = mbcdrep.cdaayy -- customer number
				               AND mbc6rep.C6DCCD = mbcdrep.cddccd -- internal header type
				       INNER JOIN amflib.mbbfrep MBBFREP 
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
				
				WHERE
				        mbc6rep.c6dccd = '1' --orders only (4 is credit memo)
						AND MBC6REP.C6FNST <> '50' -- not complete (10 = open, 15 = picked, 20 = shipped)
						AND MBC6REP.C6FNST <> ''
						AND MBC6REP.C6FNST <> '00'
						AND MBC6REP.C6FNST <> '20'
						AND mbcdrep.cdaabf > 0 --converted selling price - samples are 0 (better to use item class for sample)
						AND mbcdrep.cdagnv > 0 --total open quantity
						AND itembl.mohtq >= 0
						AND itembl.house <> ''
				GROUP  BY 	
						MBC6REP.C6CVNB, --									"Order Number",
				        mbcdrep.cdaitx, --                                  "Product ID", 
						mbcdrep.cdagnv --									"Qty Ordered",
			) FLAG1	GROUP BY FLAG1.OID) STOCK
		ON MBC6REP.C6CVNB = STOCK.OID			


       
                      
WHERE  MBC6REP.C6DCCD = '1'
	AND MBC6REP.C6FNST <> '50' -- not complete (10 = open, 15 = picked, 20 = shipped)
--	AND MBC6REP.C6FNST <> ''
--	AND MBC6REP.C6FNST <> '00'
--	AND MBC6REP.C6FNST <> '20'
--	AND MBC6REP.C6FGVA > '0'
	AND mbcdrep.cdaabf > 0 --converted selling price - samples are 0 (better to use item class for sample)
	AND mbcdrep.cdagnv > 0 --total open quantity		

GROUP  BY 	
		slsrep.offcnm, --									"Sales Manager",
        MBC6REP.C6A3CD, --                                    "WH",
		mbbfrep.cusno, --									"Cust#",
		MBBFREP.cusnm, --									"Customer Name",
		MBCJCPP.CJCBTX, --									"PO Number",
		MBC6REP.C6CVNB, --									"Order Number",
		mbc6rep.c6d0nb, --									"Order Date",		
		mbc6rep.c6uud1, -- req date
		mbc6rep.c6d0nb, -- date order entered
		STOCK.FLAG,		
        MBC6REP.C6FNST, --									"Order Status",	
        MBC6REP.C6BLCD, -- CIA	
		MBC6REP.C6F1CD, -- CARRIER,        
		mbc6rep.c6afvn --									"Created By"	

ORDER BY MBC6REP.C6CVNB