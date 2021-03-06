SELECT
	AMFLIB . CUSMAS . CUSNO AS "Customer Number" , AMFLIB . CUSMAS . CUSNM AS "Customer Name" ,
	SUM ( CASE WHEN AMFLIB . MBF9REP . FEGHNB BETWEEN 1181001 AND 1181231 THEN AMFLIB . MBDDREP . DDDUVA ELSE 0 END ) AS "QE 12/31/18" ,
	0 AS "RANK 1",
--	RANK() OVER (ORDER BY SUM ( CASE WHEN AMFLIB . MBF9REP . FEGHNB BETWEEN 1091001 AND 1091231 THEN AMFLIB . MBDDREP . DDDUVA ELSE 0 END ) ) AS "RANK 1",
	SUM ( CASE WHEN AMFLIB . MBF9REP . FEGHNB BETWEEN 1171001 AND 1171231 THEN AMFLIB . MBDDREP . DDDUVA ELSE 0 END ) AS "QE 12/31/17" ,
	0 AS "RANK 2",
	SUM ( CASE WHEN AMFLIB . MBF9REP . FEGHNB BETWEEN 1161001 AND 1161231 THEN AMFLIB . MBDDREP . DDDUVA ELSE 0 END ) AS "QE 12/31/16" ,
	0 AS "RANK 3",
	SUM ( CASE WHEN AMFLIB . MBF9REP . FEGHNB BETWEEN 1150101 AND 1150331 THEN AMFLIB . MBDDREP . DDDUVA ELSE 0 END ) AS "QE 03/31/15" ,
	0 AS "RANK 4",
	SUM ( CASE WHEN AMFLIB . MBF9REP . FEGHNB BETWEEN 1140101 AND 1140331 THEN AMFLIB . MBDDREP . DDDUVA ELSE 0 END ) AS "QE 03/31/14" ,
	0 AS "RANK 5",
	SUM ( CASE WHEN AMFLIB . MBF9REP . FEGHNB BETWEEN 1130101 AND 1130331 THEN AMFLIB . MBDDREP . DDDUVA ELSE 0 END ) AS "QE 03/31/13", 
	0 AS "RANK 6"
FROM
	AMFLIB . CUSMAS
		-- Shipment Header
		JOIN AMFLIB . MBDHREP
			ON AMFLIB . CUSMAS . CUSNO = AMFLIB . MBDHREP . DHCANB
		-- Shipment Details
		JOIN AMFLIB . MBDDREP
			-- ON Shipment #
			ON AMFLIB . MBDHREP . DHZ969 = AMFLIB . MBDDREP . DDZ969
		-- Invoice Header
		JOIN AMFLIB . MBF9REP
			-- ON Invoice #
			ON AMFLIB . MBF9REP . FEGGNB = AMFLIB . MBDHREP . DHGGNB
WHERE
	
	AMFLIB . MBDDREP . DDAXNB = 1 OR AMFLIB . MBDDREP . DDAAF4 = 1 
GROUP BY
	AMFLIB . CUSMAS . CUSNO ,
	AMFLIB . CUSMAS . CUSNM 
ORDER BY
	"QE 12/31/18" DESC;
-- FETCH FIRST 50 ROWS ONLY;
