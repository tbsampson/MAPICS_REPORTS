/*
	Return Ship-to Country and State
	8/27/201
	v1.0.5
*/

SELECT
	UNION2."Customer #",
	UNION2."Customer",
	UNION2."Address",
	UNION2."City",
	UNION2."State",
	UNION2."Country",
	UNION2."Group",
	UNION2."Market",
	UNION2."Territory"
FROM
	(
		SELECT DISTINCT
			mbalrep.alcanb "Customer #",
			mbalrep.alcltx "Customer",
			mbalrep.alcmtx "Address",
			mbalrep.alcptx "City",
			mbalrep.albycd "State",
			mbalrep.alcocd "Country",
			Varchar(RIGHT('000000' || mbbfrep.bilno, 6)) "Group",
			mbbfrep.bfadr6 "Market",
			RIGHT('00' || mbbfrep.terrn, 2) "Territory",
			mbalrep.alcucd "address_code" 
		FROM
			amflib.mbalrep mbalrep 
		JOIN
			amflib.mbbfrep mbbfrep 
			ON mbbfrep.comno = mbalrep.alaenb 
			AND mbbfrep.cusno = mbalrep.alcanb 
		JOIN
			amflib.mbderep mbderep 
			ON mbalrep.alcanb = mbderep.decanb 		-- customer number
			AND mbalrep.alcucd = mbderep.decucd 		-- address code				

		WHERE
			mbalrep.alaenb = 1 
			AND mbalrep.alcanb = 3312501 
			AND mbbfrep.bilno < 999999 
			AND mbderep.deb9cd <> '00000001'
			
		UNION
		SELECT DISTINCT
			mbalrep.alcanb "Customer #",
			mbalrep.alcltx "Customer",
			mbalrep.alcmtx "Address",
			mbalrep.alcptx "City",
			mbalrep.albycd "State",
			mbalrep.alcocd "Country",
			Varchar(mbbfrep.bilno) "Group",
			mbbfrep.bfadr6 "Market",
			RIGHT('00' || mbbfrep.terrn, 2) "Territory",
			mbalrep.alcucd "address_code" 
		FROM
			amflib.mbalrep mbalrep 
		JOIN
			amflib.mbbfrep mbbfrep 
			ON mbbfrep.comno = mbalrep.alaenb 
			AND mbbfrep.cusno = mbalrep.alcanb 
		JOIN
			amflib.mbderep mbderep 
			ON mbalrep.alcanb = mbderep.decanb 		-- customer number
			AND mbalrep.alcucd = mbderep.decucd 		-- address code					
		WHERE
			mbalrep.alaenb = 1 
			AND mbalrep.alcanb = 3312501 
			AND mbbfrep.bilno > 999999 
			AND mbderep.deb9cd <> '00000001'
	)
	UNION2 
