/*
	How much on hold?
*/
SELECT x.CDA0CD, SUM(x.CDDUVA) AS "On Hold"     
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
GROUP BY x.CDA0CD
WITH ROLLUP 