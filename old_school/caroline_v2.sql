SELECT 
	 ITEMASA.ITCLS							"Item Class"
	,MBB0REP.B0GTTX							"Class Description"
	,MBB2CPP.B2ADSB 						"Item Sales Group" --"Sales Group"
	,CASE 
		WHEN ITEMASA.ITTYP = 'F' THEN 'Feature'
		WHEN ITEMASA.ITTYP = 'K' THEN 'Kit'
		WHEN ITEMASA.ITTYP = '0' THEN 'Phantom'
		WHEN ITEMASA.ITTYP = '1' THEN 'Assy/Sub'
		WHEN ITEMASA.ITTYP = '2' THEN 'Fabric.'
		WHEN ITEMASA.ITTYP = '3' THEN 'Raw Mat'
		WHEN ITEMASA.ITTYP = '4' THEN 'Purchased'
		WHEN ITEMASA.ITTYP = '9' THEN 'User Opt'
		ELSE 'Other'
	  END									"Item Type"	
	,ITEMASA.ITNBR						 	"Item Number"
	,ITEMASA.ITDSC							"Item Description"
	,ITEMASC.CMDTY							"CMCL" -- Comodity Class
	,ORDERS."DEBAL"							"DEBAL"
	,ORDERS."MTDS"							"MTDS"
	,ORDERS."OO DTM"						"OO DTM"
	,ORDERS."OO M+1"						"OO M+1"
	,ORDERS."OO M+2"						"OO M+2"
	,ORDERS."OO M+3+"						"OO M+3+"
	,HISTORY."-1Y -3M"						"-1Y -3M"	
	,HISTORY."CY -3M"						 "CY -3M"
	,HISTORY."-1Y -2M"						"-1Y -2M"
	,HISTORY."-1Y -2M"						 "CY -2M"
	,HISTORY."-1Y -1M"						"-1Y -1M"
	,HISTORY."CY -1M"						 "CY -1M"
	,HISTORY."MTDSLD"						 "MTDSLD"
	,HISTORY."-1Y CM"						 "-1Y CM"
	,HISTORY."-1Y +1M"						 "-1Y +1M"
	,HISTORY."-1Y +2M"						 "-1Y +2M"
	,ITEMBL.HOUSE							"WH"
	,NULLIF(CAST(ITEMBL.MOHTQ AS INTEGER),0)			"OH" -- "Qty On Hand"
	,NULLIF(CAST(ITEMBL.USEYR AS INTEGER),0)			"YU" -- "Yearly Usage"
	,NULLIF(CAST(ITEMBL.AVMEB AS INTEGER),0)			"APB" -- "Avg Period Balance"
	,NULLIF(CAST(ITEMBL.AVSAL AS INTEGER),0)			"APS" -- "Avg Period Sales"
	,NULLIF(DAYS(CURRENT_DATE) - DAYS(DATE(concat(concat(concat(substr(char((ITEMBL.DOFLS-1000000)+20000000),1,4),'-'),
						concat(substr(char((ITEMBL.DOFLS-1000000)+20000000),5,2), '-')),
							   substr(char((ITEMBL.DOFLS-1000000)+20000000),7,2)))),0)
											"DSLS" -- "Days Since Last Sale"
	,SUM(CASE WHEN (DATE(concat(concat(concat(substr(char((MOMAST.ODUDT-1000000)+20000000),1,4),'-'),
		concat(substr(char((MOMAST.ODUDT-1000000)+20000000),5,2), '-')),
		substr(char((MOMAST.ODUDT-1000000)+20000000),7,2))) = CURRENT DATE)
		THEN INT(MOMAST.ORQTY )
		ELSE NULL 
		END) "Today"
	,SUM(CASE WHEN (DATE(concat(concat(concat(substr(char((MOMAST.ODUDT-1000000)+20000000),1,4),'-'),
		concat(substr(char((MOMAST.ODUDT-1000000)+20000000),5,2), '-')),
		substr(char((MOMAST.ODUDT-1000000)+20000000),7,2))) = (CURRENT DATE + 1 DAY))
		THEN INT(MOMAST.ORQTY )
		ELSE NULL 
		END) "+1d"
	,SUM(CASE WHEN (DATE(concat(concat(concat(substr(char((MOMAST.ODUDT-1000000)+20000000),1,4),'-'),
		concat(substr(char((MOMAST.ODUDT-1000000)+20000000),5,2), '-')),
		substr(char((MOMAST.ODUDT-1000000)+20000000),7,2))) = (CURRENT DATE + 2 DAYS))
		THEN INT(MOMAST.ORQTY )
		ELSE NULL
		END) "+2d"
	,SUM(CASE WHEN (DATE(concat(concat(concat(substr(char((MOMAST.ODUDT-1000000)+20000000),1,4),'-'),
		concat(substr(char((MOMAST.ODUDT-1000000)+20000000),5,2), '-')),
		substr(char((MOMAST.ODUDT-1000000)+20000000),7,2))) = (CURRENT DATE + 3 DAYS))
		THEN INT(MOMAST.ORQTY )
		ELSE NULL
		END) "+3d"
	,SUM(CASE WHEN (DATE(concat(concat(concat(substr(char((MOMAST.ODUDT-1000000)+20000000),1,4),'-'),
		concat(substr(char((MOMAST.ODUDT-1000000)+20000000),5,2), '-')),
		substr(char((MOMAST.ODUDT-1000000)+20000000),7,2))) = (CURRENT DATE + 4 DAYS))
		THEN INT(MOMAST.ORQTY )
		ELSE NULL
		END) "+4d"
	,SUM(CASE WHEN (DATE(concat(concat(concat(substr(char((MOMAST.ODUDT-1000000)+20000000),1,4),'-'),
		concat(substr(char((MOMAST.ODUDT-1000000)+20000000),5,2), '-')),
		substr(char((MOMAST.ODUDT-1000000)+20000000),7,2))) = (CURRENT DATE + 5 DAYS))
		THEN INT(MOMAST.ORQTY )
		ELSE NULL
		END) "+5d"
	,SUM(CASE WHEN (DATE(concat(concat(concat(substr(char((MOMAST.ODUDT-1000000)+20000000),1,4),'-'),
		concat(substr(char((MOMAST.ODUDT-1000000)+20000000),5,2), '-')),
		substr(char((MOMAST.ODUDT-1000000)+20000000),7,2))) = (CURRENT DATE + 6 DAYS))
		THEN INT(MOMAST.ORQTY )
		ELSE NULL
		END) "+6d"
	,SUM(CASE WHEN (DATE(concat(concat(concat(substr(char((MOMAST.ODUDT-1000000)+20000000),1,4),'-'),
		concat(substr(char((MOMAST.ODUDT-1000000)+20000000),5,2), '-')),
		substr(char((MOMAST.ODUDT-1000000)+20000000),7,2))) = (CURRENT DATE + 7 DAYS)) 
		THEN INT(MOMAST.ORQTY )
		ELSE NULL
		END) "+7d"
	,SUM(CASE WHEN (DATE(concat(concat(concat(substr(char((MOMAST.ODUDT-1000000)+20000000),1,4),'-'),
		concat(substr(char((MOMAST.ODUDT-1000000)+20000000),5,2), '-')),
		substr(char((MOMAST.ODUDT-1000000)+20000000),7,2))) BETWEEN (CURRENT DATE + 8 DAYS) AND (CURRENT DATE + 14 DAYS)) 
		THEN INT(MOMAST.ORQTY )
		ELSE NULL
		END) "1-2w"
	,SUM(CASE WHEN (DATE(concat(concat(concat(substr(char((MOMAST.ODUDT-1000000)+20000000),1,4),'-'),
		concat(substr(char((MOMAST.ODUDT-1000000)+20000000),5,2), '-')),
		substr(char((MOMAST.ODUDT-1000000)+20000000),7,2))) BETWEEN (CURRENT DATE + 15 DAYS) AND (CURRENT DATE + 21 DAYS)) 
		THEN INT(MOMAST.ORQTY )
		ELSE NULL
		END) "2-3w"
	,SUM(CASE WHEN (DATE(concat(concat(concat(substr(char((MOMAST.ODUDT-1000000)+20000000),1,4),'-'),
		concat(substr(char((MOMAST.ODUDT-1000000)+20000000),5,2), '-')),
		substr(char((MOMAST.ODUDT-1000000)+20000000),7,2))) BETWEEN (CURRENT DATE + 12 DAYS) AND (CURRENT DATE + 28 DAYS)) 
		THEN INT(MOMAST.ORQTY )
		ELSE NULL
		END) "3-4w"
	,SUM(CASE WHEN (DATE(concat(concat(concat(substr(char((MOMAST.ODUDT-1000000)+20000000),1,4),'-'),
		concat(substr(char((MOMAST.ODUDT-1000000)+20000000),5,2), '-')),
		substr(char((MOMAST.ODUDT-1000000)+20000000),7,2))) > (CURRENT DATE + 28 DAYS)) 
		THEN INT(MOMAST.ORQTY )
		ELSE NULL
		END) "4+w"

FROM AMFLIB.ITEMASA ITEMASA -- Item Master

JOIN AMFLIB.ITEMASC ITEMASC -- Item Master C (to get Comodity Class)
	ON  ITEMASA.ITNBR = ITEMASC.ITNBR

JOIN AMFLIB.ITEMBL ITEMBL -- Item Master Detail
	ON ITEMASA.ITNBR = ITEMBL.ITNBR -- Product ID
JOIN AMFLIB.MBB0REP MBB0REP -- Item Class Ref
	ON ITEMASA.ITCLS = MBB0REP.B0GLCD -- Item Class ID
JOIN AMFLIB.MBB2CPP MBB2CPP
	ON ITEMASA.ITNBR = MBB2CPP.B2AITX
	
LEFT JOIN ------------------------------------------------------------------------- ORDERS
(
		/*
		 WH		Warehouse
		 DEBAL	Orders open since before today
		 MTDS	Month to DATE Sales
		 OO M+x	Open Orders Month +x
		*/
		SELECT  
		         MBCDREP.CDAITX                                 PRODID
		        ,ITEMBL.HOUSE                                    WH
				,SUM(CASE WHEN MBC6REP.C6FNST = '10' AND ( -- open orders
									CASE 
										 WHEN MBC6REP.C6UUD1 > 0
										 THEN DATE(CONCAT(CONCAT(CONCAT(Substr(CHAR((MBC6REP.C6UUD1 - 1000000 ) + 20000000), 1, 4), '-'), -- Is required DATE?
									   							 CONCAT(Substr(CHAR(( MBC6REP.C6UUD1 - 1000000 ) + 20000000), 5, 2), '-')),
									   							        Substr(CHAR(( MBC6REP.C6UUD1 - 1000000 ) + 20000000), 7, 2))) 
										 ELSE DATE(CONCAT(CONCAT(CONCAT(Substr(CHAR(( MBC6REP.C6D0NB - 1000000 ) + 20000000), 1, 4), '-'), -- If not use DATE order entered
									   							 CONCAT(Substr(CHAR(( MBC6REP.C6D0NB - 1000000 ) + 20000000), 5, 2), '-')),
									   							 		Substr(CHAR(( MBC6REP.C6D0NB - 1000000 ) + 20000000), 7, 2))) 
									END	< (CURRENT DATE) -- before today
								) 
							THEN CAST(MBCDREP.CDAGNV AS DECIMAL)
							ELSE NULL
							END) "DEBAL"
				,SUM(CASE WHEN (MBC6REP.C6FNST = '10' OR MBC6REP.C6FNST = '15') AND( -- Open or Picked
									CASE 
										 WHEN MBC6REP.C6UUD1 > 0
										 THEN DATE(CONCAT(CONCAT(CONCAT(Substr(CHAR((MBC6REP.C6UUD1 - 1000000 ) + 20000000), 1, 4), '-'), -- Is required DATE?
									   							 CONCAT(Substr(CHAR(( MBC6REP.C6UUD1 - 1000000 ) + 20000000), 5, 2), '-')),
									   							        Substr(CHAR(( MBC6REP.C6UUD1 - 1000000 ) + 20000000), 7, 2))) 
										 ELSE DATE(CONCAT(CONCAT(CONCAT(Substr(CHAR(( MBC6REP.C6D0NB - 1000000 ) + 20000000), 1, 4), '-'), -- If not use DATE order entered
									   							 CONCAT(Substr(CHAR(( MBC6REP.C6D0NB - 1000000 ) + 20000000), 5, 2), '-')),
									   							 		Substr(CHAR(( MBC6REP.C6D0NB - 1000000 ) + 20000000), 7, 2))) 
									END		BETWEEN DATE(CURRENT DATE - DAY(CURRENT DATE) DAYS + 1 DAYS)  -- 1st day of this current month
											AND  DATE(CURRENT DATE)  -- today
								) 
							THEN CAST(MBCDREP.CDAGNV AS DECIMAL)
							ELSE NULL
							END) "MTDS"		   
				,SUM(CASE WHEN (MBC6REP.C6FNST = '10' OR MBC6REP.C6FNST = '15') AND(  -- open orders
									CASE 
										 WHEN MBC6REP.C6UUD1 > 0
										 THEN DATE(CONCAT(CONCAT(CONCAT(Substr(CHAR((MBC6REP.C6UUD1 - 1000000 ) + 20000000), 1, 4), '-'), -- Is required DATE?
									   							 CONCAT(Substr(CHAR(( MBC6REP.C6UUD1 - 1000000 ) + 20000000), 5, 2), '-')),
									   							        Substr(CHAR(( MBC6REP.C6UUD1 - 1000000 ) + 20000000), 7, 2))) 
										 ELSE DATE(CONCAT(CONCAT(CONCAT(Substr(CHAR(( MBC6REP.C6D0NB - 1000000 ) + 20000000), 1, 4), '-'), -- If not use DATE order entered
									   							 CONCAT(Substr(CHAR(( MBC6REP.C6D0NB - 1000000 ) + 20000000), 5, 2), '-')),
									   							 		Substr(CHAR(( MBC6REP.C6D0NB - 1000000 ) + 20000000), 7, 2))) 
									END		BETWEEN DATE(CURRENT DATE)  -- today
											AND DATE(CURRENT DATE + 1 MONTHS - DAY(CURRENT DATE) DAYS)  -- last day of the month
								) 
							THEN CAST(MBCDREP.CDAGNV AS DECIMAL)
							ELSE NULL
							END) "OO DTM" -- DATE to month's end open orders
				,SUM(CASE WHEN MBC6REP.C6FNST = '10' AND(  -- open orders
									CASE 
										 WHEN MBC6REP.C6UUD1 > 0
										 THEN DATE(CONCAT(CONCAT(CONCAT(Substr(CHAR((MBC6REP.C6UUD1 - 1000000 ) + 20000000), 1, 4), '-'), -- Is required DATE?
									   							 CONCAT(Substr(CHAR(( MBC6REP.C6UUD1 - 1000000 ) + 20000000), 5, 2), '-')),
									   							        Substr(CHAR(( MBC6REP.C6UUD1 - 1000000 ) + 20000000), 7, 2))) 
										 ELSE DATE(CONCAT(CONCAT(CONCAT(Substr(CHAR(( MBC6REP.C6D0NB - 1000000 ) + 20000000), 1, 4), '-'), -- If not use DATE order entered
									   							 CONCAT(Substr(CHAR(( MBC6REP.C6D0NB - 1000000 ) + 20000000), 5, 2), '-')),
									   							 		Substr(CHAR(( MBC6REP.C6D0NB - 1000000 ) + 20000000), 7, 2))) 
									END		BETWEEN DATE(CURRENT DATE + 1 MONTHS - DAY(CURRENT DATE) DAYS + 1 DAYS)  -- first day of next month
											AND DATE(CURRENT DATE + 2 MONTHS - DAY(CURRENT DATE) DAYS)  -- last day of next month
								) 
							THEN CAST(MBCDREP.CDAGNV AS DECIMAL)
							ELSE NULL
							END) "OO M+1" -- next moth open orders
				,SUM(CASE WHEN MBC6REP.C6FNST = '10' AND(  -- open orders
									CASE 
										 WHEN MBC6REP.C6UUD1 > 0
										 THEN DATE(CONCAT(CONCAT(CONCAT(Substr(CHAR((MBC6REP.C6UUD1 - 1000000 ) + 20000000), 1, 4), '-'), -- Is required DATE?
									   							 CONCAT(Substr(CHAR(( MBC6REP.C6UUD1 - 1000000 ) + 20000000), 5, 2), '-')),
									   							        Substr(CHAR(( MBC6REP.C6UUD1 - 1000000 ) + 20000000), 7, 2))) 
										 ELSE DATE(CONCAT(CONCAT(CONCAT(Substr(CHAR(( MBC6REP.C6D0NB - 1000000 ) + 20000000), 1, 4), '-'), -- If not use DATE order entered
									   							 CONCAT(Substr(CHAR(( MBC6REP.C6D0NB - 1000000 ) + 20000000), 5, 2), '-')),
									   							 		Substr(CHAR(( MBC6REP.C6D0NB - 1000000 ) + 20000000), 7, 2))) 
									END		BETWEEN DATE(CURRENT DATE + 2 MONTHS - DAY(CURRENT DATE) DAYS + 1 DAYS)  -- first day of next next month
											AND DATE(CURRENT DATE + 3 MONTHS - DAY(CURRENT DATE) DAYS)  -- last day of next next month
								) 
							THEN CAST(MBCDREP.CDAGNV AS DECIMAL)
							ELSE NULL
							END) "OO M+2" -- next moth open orders
				,SUM(CASE WHEN MBC6REP.C6FNST = '10' AND(  -- open orders
									CASE 
										 WHEN MBC6REP.C6UUD1 > 0
										 THEN DATE(CONCAT(CONCAT(CONCAT(Substr(CHAR((MBC6REP.C6UUD1 - 1000000 ) + 20000000), 1, 4), '-'), -- Is required DATE?
									   							 CONCAT(Substr(CHAR(( MBC6REP.C6UUD1 - 1000000 ) + 20000000), 5, 2), '-')),
									   							        Substr(CHAR(( MBC6REP.C6UUD1 - 1000000 ) + 20000000), 7, 2))) 
										 ELSE DATE(CONCAT(CONCAT(CONCAT(Substr(CHAR(( MBC6REP.C6D0NB - 1000000 ) + 20000000), 1, 4), '-'), -- If not use DATE order entered
									   							 CONCAT(Substr(CHAR(( MBC6REP.C6D0NB - 1000000 ) + 20000000), 5, 2), '-')),
									   							 		Substr(CHAR(( MBC6REP.C6D0NB - 1000000 ) + 20000000), 7, 2))) 
									END		>= DATE(CURRENT DATE + 3 MONTHS - DAY(CURRENT DATE) DAYS + 1 DAYS)  -- first day of next next month
											--AND DATE(CURRENT DATE + 4 MONTHS - DAY(CURRENT DATE) DAYS)  -- last day of next next month
								) 
							THEN CAST(MBCDREP.CDAGNV AS DECIMAL)
							ELSE NULL
							END) "OO M+3+" -- next moth open orders												
		FROM   AMFLIB.MBCDREP MBCDREP 
		    JOIN AMFLIB.ITEMASA ITEMASA 
				ON ITEMASA.ITNBR = MBCDREP.CDAITX --item number
			JOIN AMFLIB.MBC6REP MBC6REP 
				ON MBC6REP.C6CVNB = MBCDREP.CDCVNB -- order number
				AND MBC6REP.C6CANB = MBCDREP.cdaayy -- customer number
				AND MBC6REP.C6DCCD = MBCDREP.cddccd -- internal header type
			JOIN AMFLIB.ITEMBL ITEMBL 
				ON ITEMASA.ITNBR = ITEMBL.ITNBR 
				AND MBCDREP.CDA3CD = ITEMBL.HOUSE -- itemnumber and wareHOUSE
		
		WHERE
		        MBC6REP.C6DCCD = '1' --orders only (4 is credit memo)
				-- AND MBC6REP.C6FNST = '10' -- not complete (10 = open, 15 = picked, 20 = shipped)
				AND MBCDREP.cdaabf > 0 --converted selling price - samples are 0 (better to use item class for sample)
				AND MBCDREP.cdagnv > 0 --total open quantity
				AND ITEMBL.mohtq >= 0
				AND ITEMBL.HOUSE <> ''
		
		GROUP  BY 	
		        MBCDREP.CDAITX --                                  "Product ID", 
		        ,ITEMBL.HOUSE --                                    "WH",
		--		MBC6REP.C6UUD1, -- req DATE
		--		MBC6REP.C6D0NB -- DATE order entered
				
		ORDER BY MBCDREP.CDAITX
)	ORDERS --------------------------------------------------------------------------------------------------------------------<end ORDERS>
	ON	ITEMASA.ITNBR = ORDERS.PRODID -- Prod ID
	AND ITEMBL.HOUSE = ORDERS.WH -- Warehouse

LEFT JOIN
(
			SELECT
				  MBDDREP.DDAITX "Prod ID"-- Item Number
			 	 ,MBDHREP.DHA3CD "WH" -- Warehouse
			-- -------------------------------------------------------------------------------------------------------------- -1Y -3M
				,SUM(CASE WHEN (DATE(concat(concat(concat(substr(char((MBDDREP.DDAAFY-1000000)+20000000),1,4),'-'),
					concat(substr(char((MBDDREP.DDAAFY-1000000)+20000000),5,2), '-')),
					substr(char((MBDDREP.DDAAFY-1000000)+20000000),7,2)))
					BETWEEN 
							DATE(CURRENT DATE -1 YEARS -3 MONTHS - DAY(CURRENT DATE) DAYS + 1 DAYS) 
						AND DATE(CURRENT DATE -1 YEARS -2 MONTHS - DAY(CURRENT DATE) DAYS)
						) 
					THEN CAST(MBDDREP.DDAAFX AS INTEGER)
					ELSE NULL
					END) "-1Y -3M"		
			-- -------------------------------------------------------------------------------------------------------------- -CY -3M
				,SUM(CASE WHEN (DATE(concat(concat(concat(substr(char((MBDDREP.DDAAFY-1000000)+20000000),1,4),'-'),
					concat(substr(char((MBDDREP.DDAAFY-1000000)+20000000),5,2), '-')),
					substr(char((MBDDREP.DDAAFY-1000000)+20000000),7,2)))
					BETWEEN 
							DATE(CURRENT DATE -3 MONTHS - DAY(CURRENT DATE) DAYS + 1 DAYS) 
						AND DATE(CURRENT DATE -2 MONTHS - DAY(CURRENT DATE) DAYS)
						) 
					THEN CAST(MBDDREP.DDAAFX AS INTEGER)
					ELSE NULL
					END) "CY -3M"			 
			-- -------------------------------------------------------------------------------------------------------------- -1Y -2M
				,SUM(CASE WHEN (DATE(concat(concat(concat(substr(char((MBDDREP.DDAAFY-1000000)+20000000),1,4),'-'),
					concat(substr(char((MBDDREP.DDAAFY-1000000)+20000000),5,2), '-')),
					substr(char((MBDDREP.DDAAFY-1000000)+20000000),7,2)))
					BETWEEN 
							DATE(CURRENT DATE -1 YEARS -2 MONTHS - DAY(CURRENT DATE) DAYS + 1 DAYS) 
						AND DATE(CURRENT DATE -1 YEARS -1 MONTHS - DAY(CURRENT DATE) DAYS)
						) 
					THEN CAST(MBDDREP.DDAAFX AS INTEGER)
					ELSE NULL
					END) "-1Y -2M"		
			-- -------------------------------------------------------------------------------------------------------------- -CY -2M
				,SUM(CASE WHEN (DATE(concat(concat(concat(substr(char((MBDDREP.DDAAFY-1000000)+20000000),1,4),'-'),
					concat(substr(char((MBDDREP.DDAAFY-1000000)+20000000),5,2), '-')),
					substr(char((MBDDREP.DDAAFY-1000000)+20000000),7,2)))
					BETWEEN 
							DATE(CURRENT DATE -2 MONTHS - DAY(CURRENT DATE) DAYS + 1 DAYS) 
						AND DATE(CURRENT DATE -1 MONTHS - DAY(CURRENT DATE) DAYS)
						) 
					THEN CAST(MBDDREP.DDAAFX AS INTEGER)
					ELSE NULL
					END) "CY -2M"					
			-- -------------------------------------------------------------------------------------------------------------- -1Y -1M
				,SUM(CASE WHEN (DATE(concat(concat(concat(substr(char((MBDDREP.DDAAFY-1000000)+20000000),1,4),'-'),
					concat(substr(char((MBDDREP.DDAAFY-1000000)+20000000),5,2), '-')),
					substr(char((MBDDREP.DDAAFY-1000000)+20000000),7,2)))
					BETWEEN 
							DATE(CURRENT DATE -1 YEARS -1 MONTHS - DAY(CURRENT DATE) DAYS + 1 DAYS) 
						AND DATE(CURRENT DATE -1 YEARS - DAY(CURRENT DATE) DAYS)
						) 
					THEN CAST(MBDDREP.DDAAFX AS INTEGER)
					ELSE NULL
					END) "-1Y -1M"		
			-- -------------------------------------------------------------------------------------------------------------- -CY -1M
				,SUM(CASE WHEN (DATE(concat(concat(concat(substr(char((MBDDREP.DDAAFY-1000000)+20000000),1,4),'-'),
					concat(substr(char((MBDDREP.DDAAFY-1000000)+20000000),5,2), '-')),
					substr(char((MBDDREP.DDAAFY-1000000)+20000000),7,2)))
					BETWEEN 
							DATE(CURRENT DATE -1 MONTHS - DAY(CURRENT DATE) DAYS + 1 DAYS) 
						AND DATE(CURRENT DATE - DAY(CURRENT DATE) DAYS)
						) 
					THEN CAST(MBDDREP.DDAAFX AS INTEGER)
					ELSE NULL
					END) "CY -1M"				
			-- ------------------------------------------------------------------------------------------------------------- MTDSLD
				,SUM(CASE WHEN (DATE(concat(concat(concat(substr(char((MBDDREP.DDAAFY-1000000)+20000000),1,4),'-'),
					concat(substr(char((MBDDREP.DDAAFY-1000000)+20000000),5,2), '-')),
					substr(char((MBDDREP.DDAAFY-1000000)+20000000),7,2)))
					BETWEEN DATE(CURRENT DATE - DAY(CURRENT DATE) DAYS + 1 DAYS)  -- 1st day of this current month
											AND  DATE(CURRENT DATE)  -- today
						) 
					THEN CAST(MBDDREP.DDAAFX AS INTEGER)
					ELSE NULL
					END) "MTDSLD"	
			-- -------------------------------------------------------------------------------------------------------------- -1Y CM
				,SUM(CASE WHEN (DATE(concat(concat(concat(substr(char((MBDDREP.DDAAFY-1000000)+20000000),1,4),'-'),
					concat(substr(char((MBDDREP.DDAAFY-1000000)+20000000),5,2), '-')),
					substr(char((MBDDREP.DDAAFY-1000000)+20000000),7,2)))
					BETWEEN 
							DATE(CURRENT DATE -1 YEARS - DAY(CURRENT DATE) DAYS + 1 DAYS) 
						AND DATE(CURRENT DATE -1 YEARS + 1 MONTHS - DAY(CURRENT DATE) DAYS)
						) 
					THEN CAST(MBDDREP.DDAAFX AS INTEGER)
					ELSE NULL
					END) "-1Y CM"		
			-- -------------------------------------------------------------------------------------------------------------- -1Y +1M
				,SUM(CASE WHEN (DATE(concat(concat(concat(substr(char((MBDDREP.DDAAFY-1000000)+20000000),1,4),'-'),
					concat(substr(char((MBDDREP.DDAAFY-1000000)+20000000),5,2), '-')),
					substr(char((MBDDREP.DDAAFY-1000000)+20000000),7,2)))
					BETWEEN 
							DATE(CURRENT DATE -1 YEARS + 1 MONTHS - DAY(CURRENT DATE) DAYS + 1 DAYS) 
						AND DATE(CURRENT DATE -1 YEARS + 2 MONTHS - DAY(CURRENT DATE) DAYS)
						) 
					THEN CAST(MBDDREP.DDAAFX AS INTEGER)
					ELSE NULL
					END) "-1Y +1M"
			-- -------------------------------------------------------------------------------------------------------------- -1Y +2M
				,SUM(CASE WHEN (DATE(concat(concat(concat(substr(char((MBDDREP.DDAAFY-1000000)+20000000),1,4),'-'),
					concat(substr(char((MBDDREP.DDAAFY-1000000)+20000000),5,2), '-')),
					substr(char((MBDDREP.DDAAFY-1000000)+20000000),7,2)))
					BETWEEN 
							DATE(CURRENT DATE -1 YEARS + 2 MONTHS - DAY(CURRENT DATE) DAYS + 1 DAYS) 
						AND DATE(CURRENT DATE -1 YEARS + 3 MONTHS - DAY(CURRENT DATE) DAYS)
						) 
					THEN CAST(MBDDREP.DDAAFX AS INTEGER)
					ELSE NULL
					END) "-1Y +2M"
						
	
							
							
			FROM AMFLIB.MBDDREP MBDDREP
			
			JOIN AMFLIB.MBDHREP MBDHREP
				ON MBDDREP.DDAENB = MBDHREP.DHAENB -- Company Number
				AND MBDDREP.DDDCCD = MBDHREP.DHDCCD -- Internal Header Type
				AND MBDDREP.DDCVNB = MBDHREP.DHCVNB -- Order ID
				AND MBDDREP.DDK4NB = MBDHREP.DHK4NB -- Shipment Header Number
			
			
			WHERE MBDDREP.DDAITX <> ''
			
			GROUP BY
				  MBDDREP.DDAITX -- Item Number
			 	 ,MBDHREP.DHA3CD -- "WH" -- Warehouse
			ORDER BY
				  MBDDREP.DDAITX -- Item Number
) HISTORY
	ON ITEMBL.ITNBR = HISTORY."Prod ID"
	AND ITEMBL.HOUSE = HISTORY."WH"
	
	
	
LEFT OUTER JOIN AMFLIB.MOMAST MOMAST -- Manufactureres Orders
	ON	ITEMASA.ITNBR = MOMAST.FITEM -- Prod ID
	AND ITEMBL.HOUSE = MOMAST.FITWH -- Warehouse


WHERE LEFT(ITEMASA.ITCLS, 2) = 'FG'

GROUP BY
	 ITEMASA.ITNBR	--					 	"Prod ID"
	,ITEMASA.ITDSC	--						"Description"
	,ITEMASC.CMDTY --						"CMCL" -- Comodity Class	
	,ORDERS."DEBAL"	--						"DEBAL"
	,ORDERS."MTDS"	--						"MTDS"
	,ORDERS."OO DTM"	--					"OO DTM"
	,ORDERS."OO M+1"--						"OO M+1"
	,ORDERS."OO M+2"--						"OO M+2"
	,ORDERS."OO M+3+"--						"OO M+3+"
	,HISTORY."-1Y -3M"	--					"-1Y -3M"	
	,HISTORY."CY -3M"	--					 "CY -3M"
	,HISTORY."-1Y -2M"	--					"-1Y -2M"
	,HISTORY."-1Y -2M"	--					 "CY -2M"
	,HISTORY."-1Y -1M"	--					"-1Y -1M"
	,HISTORY."CY -1M"	--					 "CY -1M"
	,HISTORY."MTDSLD"	--					 "MTDSLD"
	,HISTORY."-1Y CM"	--					 "-1Y CM"
	,HISTORY."-1Y +1M"	--					 "-1Y +1M"
	,HISTORY."-1Y +2M"	--					 "-1Y +2M"
	,MBB2CPP.B2ADSB -- 						"Sales Group"
	,ITEMASA.ITTYP	-- Item Type
	,ITEMASA.ITCLS	--						"IC ID"
	,MBB0REP.B0GTTX	--						"Item Class"
	,ITEMBL.HOUSE	--						"WH"
	,NULLIF(CAST(ITEMBL.MOHTQ AS INTEGER),0)	--		"OH" -- "Qty On Hand"
	,ITEMBL.VNDNR						--	"Vend #"
	,NULLIF(CAST(ITEMBL.USEYR AS INTEGER),0)		--	"YU" -- "Yearly Usage"
	,NULLIF(CAST(ITEMBL.AVMEB AS INTEGER),0)		--	"APB" -- "Avg Period Balance"
	,NULLIF(CAST(ITEMBL.AVSAL AS INTEGER),0)		--	"APS" -- "Avg Period Sales"
	,ITEMBL.DOFLS						--	"DSLS" -- "Days Since Last Sale"

ORDER BY
	 ITEMASA.ITCLS	--						"IC ID"
	,ITEMASA.ITNBR	--					 	"Prod ID"
	,ITEMBL.HOUSE	--						"WH"		 