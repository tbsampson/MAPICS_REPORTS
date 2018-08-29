		SELECT DISTINCT
			mbalrep.alcanb "Customer #",
			mbalrep.alcltx "Customer Name",
			SHIPTOCUST."Shipto Name",
			SHIPTOCUST."Address",
			SHIPTOCUST."City",
			SHIPTOCUST."State",
			SHIPTOCUST."Country",
			Varchar(RIGHT('000000' || mbbfrep.bilno, 6)) "Group",
			mbbfrep.bfadr6 "Market",
			RIGHT('00' || mbbfrep.terrn, 2) "Territory"
		FROM
			mbalrep mbalrep 
		JOIN
			mbbfrep mbbfrep 
			ON mbbfrep.comno = mbalrep.alaenb 
			AND mbbfrep.cusno = mbalrep.alcanb 
		JOIN
			mbderep mbderep 
			ON mbalrep.alcanb = mbderep.decanb
			AND mbalrep.alcucd = mbderep.decucd
			AND mbalrep.ale2st = mbderep.dee2st
		JOIN
			(SELECT
				mbalrep.alcanb "Customer #",
				mbalrep.alcltx "Shipto Name",
				mbalrep.alcmtx "Address",
				mbalrep.alcptx "City",
				mbalrep.albycd "State",
				mbalrep.alcocd "Country"		
			FROM 
				mbalrep mbalrep 
			JOIN
				mbbfrep mbbfrep 
				ON mbbfrep.comno = mbalrep.alaenb 
				AND mbbfrep.cusno = mbalrep.alcanb 
			LEFT OUTER JOIN
				mbderep mbderep 
				ON mbalrep.alcanb = mbderep.decanb
				AND mbalrep.alcucd = mbderep.decucd
				AND mbalrep.ale2st = mbderep.dee2st
	
			WHERE
				mbalrep.alaenb = 1 
				AND mbalrep.alcanb = 3312501 
				AND mbbfrep.bilno < 999999 
				AND mbderep.deb9cd <> '00000001') SHIPTOCUST
			ON mbalrep.alcanb = SHIPTOCUST."Customer #"
			
		WHERE
			mbalrep.alaenb = 1 
			AND mbalrep.alcanb = 3312501 
			AND mbbfrep.bilno < 999999 
			AND mbderep.deb9cd = '00000001'
			