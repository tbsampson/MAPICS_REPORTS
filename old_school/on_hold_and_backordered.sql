SELECT DISTINCT
	 XX.T
	,XX.SUMX
FROM
	(SELECT 'On Hold' as t, x.CDA0CD, SUM(x.CDDUVA) AS sumx    
	  FROM (
	     SELECT LINES.CDCVNB, /* QUOTE/ORDER NO */
	            LINES.CDDCCD, /* ORDER TYPE */
	            LINES.CDAITX, /* ITEM NUMBER */ 
	            LINES.CDGLCD, /* ITEM CLASS */
	            LINES.CDA0CD, /* IAC */
	            LINES.CDDUVA, /* LC - NET SALES AMOUNT */
	            HOLDS.CKCZCD, /* HOLD CODE */
	            HOLDS.CKACP8, /* RELEASE TYPE */            
	            LINES.CDZ902  /* TOTAL BACKORDERED QTY */ 
	       FROM AMFLIB.MBCDREP LINES,
	            AMFLIB.MBCKREP HOLDS
	      WHERE LINES.CDCVNB = HOLDS.CKCVNB AND /* SELECT ONLY LINES FROM ORDERS ON HOLD */ 
	            LINES.CDDCCD = 1 AND /* ORDER TYPE: ORDER */  
	            LINES.CDZ902 = 0 AND /* NO BACKORDERS */
	            HOLDS.CKACP8 != '1') x /* HOLD NOT RELEASED */
	GROUP BY 'On Hold', x.CDA0CD
	WITH ROLLUP 
	union all
	SELECT 'Back Orders' as t, y.CDA0CD, SUM(y.CDDUVA) AS sumx
	  FROM (
	     SELECT CDCVNB, /* QUOTE/ORDER NO */
	            CDDCCD, /* ORDER TYPE */
	            CDAITX, /* ITEM NUMBER */ 
	            CDGLCD, /* ITEM CLASS */
	            CDA0CD, /* IAC */
	            CDDUVA, /* LC - NET SALES AMOUNT */     
	            CDZ902  /* TOTAL BACKORDERED QTY */ 
	       FROM AMFLIB.MBCDREP
	      WHERE CDDCCD = 1 AND /* ORDER TYPE: ORDER */  
	            CDZ902 > 0) y /* BACKORDERS QTY GREATER THAN ZERO */
	GROUP BY y.CDA0CD
	WITH ROLLUP) XX
WHERE XX.T <> ''