/*
	Return Ship-to Country and State
	v1.0.1 
	8/27/2018
*/

SELECT
	UNION2."Customer # ",
	UNION2."Customer",
	UNION2."Address",
	UNION2."City",
	UNION2."State",
	UNION2."Country",
	UNION2."Group",
	UNION2."Market",
	UNION2."Territory"
--	UNION2."address_code" 
FROM
	(
		SELECT DISTINCT
			mbalrep.alcanb "Customer # ",
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
		WHERE
			mbalrep.alaenb = ?
			AND mbalrep.alcanb = ?
			AND mbbfrep.bilno < 999999 
		UNION
		SELECT DISTINCT
			mbalrep.alcanb "Customer # ",
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
		WHERE
			mbalrep.alaenb = ?
			AND mbalrep.alcanb = ?
			AND mbbfrep.bilno > 999999 
	)
	UNION2 
	JOIN
		amflib.mbderep mbderep 
		ON UNION2."Customer # " = mbderep.decanb 		-- customer number
		AND UNION2."address_code" = mbderep.decucd 		-- address code
WHERE
	mbderep.deb9cd <> '00000001'