/*
	How much backorderd?
*/
SELECT y.CDA0CD, SUM(y.CDDUVA) AS "Back Orders"
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
WITH ROLLUP